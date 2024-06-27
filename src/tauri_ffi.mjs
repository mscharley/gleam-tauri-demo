const { invoke } = window.__TAURI__.core;

export const greet = (name) => invoke("greet", { name });

