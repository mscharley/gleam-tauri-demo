import gleam/javascript/promise
import gleam/option.{Some}
import lustre/effect
import model.{type Model, Model}
import tauri

pub type Msg {
  UpdateName(name: String)
  UpdateGreeting(greeting: String)

  SubmitName
}

pub fn update(model: Model, msg: Msg) -> #(Model, effect.Effect(Msg)) {
  case msg {
    UpdateName(name) -> #(Model(..model, name: name), effect.none())
    UpdateGreeting(greeting) -> #(
      Model(..model, greeting: Some(greeting)),
      effect.none(),
    )
    SubmitName -> #(model, effect.from(get_greeting(model.name)))
  }
}

fn get_greeting(name) {
  fn(dispatch) {
    tauri.greet(name)
    |> promise.map(fn(greeting) { dispatch(UpdateGreeting(greeting)) })

    Nil
  }
}
