use wasm_bindgen::prelude::*;

// Esta función será expuesta a JavaScript
#[wasm_bindgen]
pub fn add(a: i32, b: i32) -> i32 {
    a + b
}
