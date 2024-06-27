import gleam/io
import lustre
import message
import model
import view

pub fn main() {
  lustre.application(model.new, message.update, view.view)
  |> lustre.start("#app", Nil)
  |> handle_error
}

fn handle_error(v: Result(a, lustre.Error)) -> Nil {
  case v {
    Error(lustre.ActorError(_)) ->
      io.println_error("Actor error while initialising Lustre.")

    Error(lustre.BadComponentName(name)) ->
      io.println_error("Bad component name: " <> name)

    Error(lustre.ComponentAlreadyRegistered(name)) ->
      io.println_error("Component already registered: " <> name)

    Error(lustre.ElementNotFound(selector)) ->
      io.println_error("Selector not found: " <> selector)

    Error(lustre.NotABrowser) ->
      io.println_error("Expected to be running a browser, but am not.")

    Error(lustre.NotErlang) ->
      io.println_error("Expected to be running Erland, but am not.")

    Ok(_) -> Nil
  }
}
