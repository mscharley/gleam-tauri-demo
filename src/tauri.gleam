import gleam/javascript/promise.{type Promise}

@external(javascript, "./tauri_ffi.mjs", "greet")
pub fn greet(name: String) -> Promise(String)
