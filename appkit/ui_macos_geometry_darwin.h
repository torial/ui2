#include <objc/message.h>
#include <objc/runtime.h>

// A message that takes a rectangle and answers one, which vlib's macos bridge has no
// entry for: -[NSCell titleRectForBounds:] is how a control says where its title is
// drawn once its image, bezel and arrows have had their share of the frame.
typedef struct ui2_macos_rect {
	double x;
	double y;
	double width;
	double height;
} ui2_macos_rect;

static inline ui2_macos_rect ui2_macos_msg_rect_rect(void* obj, void* sel, ui2_macos_rect rect) {
#if defined(__x86_64__)
	// Intel returns a structure this large through memory, which plain objc_msgSend
	// does not do.
	ui2_macos_rect result;
	((void (*)(ui2_macos_rect*, void*, void*, ui2_macos_rect))objc_msgSend_stret)(&result, obj, sel, rect);
	return result;
#else
	return ((ui2_macos_rect (*)(void*, void*, ui2_macos_rect))objc_msgSend)(obj, sel, rect);
#endif
}

// A class built at runtime has no `super` to send to, so reaching the method it
// overrides means naming the class the lookup should start from. objc_super is a
// receiver followed by that class; plain pointers keep this free of ownership casts.
static inline void ui2_macos_msg_super_void_id(void* obj, void* superclass, void* sel, void* arg) {
	struct {
		void* receiver;
		void* super_class;
	} target = { obj, superclass };
	((void (*)(void*, void*, void*))objc_msgSendSuper)(&target, sel, arg);
}

// -[NSView hitTest:] takes a point and answers an object, which the bridge has no
// entry for either. A point is two doubles on both architectures.
static inline void* ui2_macos_msg_id_point(void* obj, void* sel, double x, double y) {
	struct { double x; double y; } point = { x, y };
	return ((void* (*)(void*, void*, __typeof__(point)))objc_msgSend)(obj, sel, point);
}

// Gives `view` a tracking area that follows its visible rectangle and reports the
// pointer entering, moving over and leaving it while the app is active. The
// initializer takes a rectangle, an option set and two objects: a shape the bridge
// has no entry for.
static inline void ui2_macos_add_tracking_area(void* view) {
	const unsigned long entered_and_exited = 0x01, moved = 0x02, active_in_app = 0x40,
		in_visible_rect = 0x200;
	void* area = ((void* (*)(void*, void*))objc_msgSend)((void*)objc_getClass("NSTrackingArea"),
		sel_registerName("alloc"));
	ui2_macos_rect zero = { 0, 0, 0, 0 };
	area = ((void* (*)(void*, void*, ui2_macos_rect, unsigned long, void*, void*))objc_msgSend)(area,
		sel_registerName("initWithRect:options:owner:userInfo:"), zero,
		entered_and_exited | moved | active_in_app | in_visible_rect, view, (void*)0);
	if (area == (void*)0) return;
	((void (*)(void*, void*, void*))objc_msgSend)(view, sel_registerName("addTrackingArea:"), area);
	((void (*)(void*, void*))objc_msgSend)(area, sel_registerName("release"));
}
