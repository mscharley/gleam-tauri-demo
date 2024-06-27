import gleam/option.{type Option, None}
import lustre/effect

pub type Model {
  Model(name: String, greeting: Option(String))
}

pub fn new(_flags) -> #(Model, effect.Effect(a)) {
  #(Model("", None), effect.none())
}
