module ui2

// `symbol:<name>` images name SF Symbols, which AppKit and UIKit draw natively.
// Every other renderer draws the same name as a glyph from the bundled Material
// Icons face (assets/fonts/MaterialIcons-Regular.ttf), so an icon stays
// recognizable on a machine without a symbol font. symbol_glyphs is the shared
// list of names that have such a glyph.
const symbol_glyphs = {
	'align.horizontal.center':                      '\ue00f'
	'line.3.horizontal':                            '\ue5d2'
	'text.justify':                                 '\ue235'
	'align.vertical.center':                        '\ue011'
	'arrow.up.and.down':                            '\ue8d5'
	'arrow.up.arrow.down':                          '\ue8d5'
	'arrow.up.and.down.text.horizontal':            '\ue25b'
	'arrow.2.squarepath':                           '\ue627'
	'arrow.triangle.2.circlepath':                  '\ue627'
	'arrow.left.and.right':                         '\ue8d4'
	'arrow.left.and.right.square':                  '\ue933'
	'arrow.clockwise':                              '\ue5d5'
	'arrow.clockwise.circle':                       '\ue5d5'
	'clock.arrow.circlepath':                       '\ue889'
	'arrow.down.right.and.arrow.up.left':           '\uf1ce'
	'arrow.up.and.down.and.arrow.left.and.right':   '\uf1ce'
	'move.3d':                                      '\uf1ce'
	'arrow.down.to.line':                           '\ue258'
	'icloud.and.arrow.down':                        '\ue2c0'
	'arrow.right.to.line':                          '\ue23e'
	'increase.indent':                              '\ue23e'
	'arrow.uturn.backward':                         '\ue166'
	'arrow.uturn.forward':                          '\ue15a'
	'icloud.and.arrow.up':                          '\ue2c3'
	'square.and.arrow.up':                          '\ue2c6'
	'square.and.arrow.down':                        '\ue161'
	'asterisk':                                     '\ue83a'
	'character.book.closed':                        '\uea19'
	'textformat':                                   '\ue262'
	'textformat.abc':                               '\ue262'
	'chart.bar':                                    '\ue26b'
	'chart.bar.doc.horizontal':                     '\ue26b'
	'chart.bar.xaxis':                              '\ue26b'
	'crop':                                         '\ue3be'
	'cube.transparent':                             '\ue9fe'
	'square.on.circle':                             '\ue574'
	'curlybraces':                                  '\ue86f'
	'cursorarrow':                                  '\ue323'
	'doc.badge.arrow.up':                           '\ue9fc'
	'doc.badge.plus':                               '\ue89c'
	'text.badge.plus':                              '\ue89c'
	'plus.rectangle':                               '\ue146'
	'plus.rectangle.on.rectangle':                  '\ue02e'
	'plus.square.on.square':                        '\ue02e'
	'doc.on.doc':                                   '\ue14d'
	'list.bullet.clipboard':                        '\ue85d'
	'ellipsis':                                     '\ue5d3'
	'eye':                                          '\ue8f4'
	'eye.slash':                                    '\ue8f5'
	'folder':                                       '\ue2c7'
	'function':                                     '\ue24a'
	'gearshape':                                    '\ue8b8'
	'grid':                                         '\ue3ec'
	'rectangle.grid.2x2':                           '\ue3ec'
	'rectangle.split.3x3':                          '\ue3ec'
	'tablecells':                                   '\ue3ec'
	'info.circle':                                  '\ue88e'
	'line.vertical':                                '\ue5d4'
	'list.number':                                  '\ue242'
	'number':                                       '\ue9ef'
	'lock':                                         '\ue897'
	'lock.doc':                                     '\ue897'
	'magnifyingglass':                              '\ue8b6'
	'rectangle.and.text.magnifyingglass':           '\ue8b6'
	'minus':                                        '\ue15b'
	'minus.rectangle':                              '\ue909'
	'number.circle':                                '\ue400'
	'paintbrush':                                   '\ue3ae'
	'paintpalette':                                 '\ue40a'
	'pencil':                                       '\ue3c9'
	'pencil.line':                                  '\ue3c9'
	'person.2':                                     '\ue7ef'
	'person.crop.circle':                           '\ue853'
	'person.crop.circle.badge.plus':                '\ue7fe'
	'photo':                                        '\ue410'
	'textbox':                                      '\ue262'
	'plus':                                         '\ue145'
	'printer':                                      '\ue8ad'
	'rectangle.3.group':                            '\ue8f0'
	'rectangle.split.1x2':                          '\uf114'
	'rectangle.split.2x1':                          '\ue8f2'
	'rectangle.split.3x1':                          '\ue8ec'
	'rectangle.bottomthird.inset.filled':           '\uf114'
	'rectangle.portrait.and.arrow.right':           '\uf114'
	'rectangle.righthalf.inset.filled.arrow.right': '\uf114'
	'rectangle.topthird.inset.filled':              '\uf114'
	'sidebar.right':                                '\uf114'
	'scissors':                                     '\ue14e'
	'seal':                                         '\uef76'
	'slider.horizontal.3':                          '\ue429'
	'square.2.layers.3d.bottom.filled':             '\ue53b'
	'square.2.layers.3d.top.filled':                '\ue53b'
	'square.stack.3d.up':                           '\ue53b'
	'star':                                         '\ue838'
	'star.circle':                                  '\ue8d0'
	'tag':                                          '\ue892'
	'text.alignleft':                               '\ue236'
	'text.alignright':                              '\ue237'
	'text.bubble':                                  '\ue0cb'
	'textformat.123':                               '\ueb8d'
	'textformat.size':                              '\ue245'
	'textformat.size.larger':                       '\ueae2'
	'trash':                                        '\ue872'
	'xmark':                                        '\ue5cd'
}

// The glyph drawn for a name the table does not know: a question mark in a
// circle, so a missing icon is visible rather than an empty box.
const symbol_unknown_glyph = '\ue8fd'

// symbol_known reports whether `name` (without the `symbol:` prefix) draws the
// same icon on every renderer. Names outside the list still work natively on
// Apple platforms but fall back to a question mark elsewhere.
pub fn symbol_known(name string) bool {
	return name in symbol_glyphs
}

// symbol_names lists every name symbol_known accepts, sorted.
pub fn symbol_names() []string {
	mut names := symbol_glyphs.keys()
	names.sort()
	return names
}

fn symbol_glyph(name string) string {
	return symbol_glyphs[name] or { symbol_unknown_glyph }
}

// symbol_name returns the name in a `symbol:<name>` image path, or none for an
// ordinary file path.
fn symbol_name(image_path string) ?string {
	if !image_path.starts_with('symbol:') || image_path.len == 'symbol:'.len {
		return none
	}
	return image_path['symbol:'.len..]
}
