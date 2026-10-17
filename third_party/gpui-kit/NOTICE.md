# GPUI Kit attribution

Source: https://github.com/longbridge/gpui-kit
Revisions: `1b6059c13315dc5c304759ad3aa666e0b6e301d8` (batch 1) and
`f8cf0bd964f9ef2e5b7be79f3a8fc391371feb4a` (later batches)
Copyright 2024 - 2026 Longbridge <https://longbridge.com>

These files adapt GPUI Kit logic or tests and are distributed under
Apache-2.0; the complete license is in `LICENSE-APACHE` alongside this notice.
Each carries an SPDX header naming it.

| File | Adapted from |
| --- | --- |
| `ui/pagination.v` | The controlled pagination state and page-window algorithm of `crates/base/src/pagination.rs`. The V version changes types and error handling, caps visible-page allocation, adds guarded action encoding/decoding, and renders through UI2's elements. |
| `ui/component_catalog_test.v` | Pagination behavior tests from the same file, beside new UI2 regression tests. |
| `ui/component_choice_rating.v` | The rating click rule of `crates/component/src/rating.rs` (clicking a filled star sets the value to the star before it). |
| `ui/component_inputs_number.v` | The stepping rules of `step_value` in `crates/base/src/number_input.rs`. |
| `ui/component_inputs_test.v` | Some number-input stepping cases from the same file, beside new tests. |

Every other component implementation is new V code following the GPUI Kit
catalog's documented concepts, not copied Rust. It, the examples and the
documentation use UI2's existing MIT license. No GPUI Kit assets or runtime are
included, and this does not change the license of existing UI2 files.
