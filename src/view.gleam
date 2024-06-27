import gleam/dynamic
import gleam/io
import gleam/option
import gleam/result
import lustre/attribute.{class}
import lustre/element
import lustre/element/html.{a, button, div, h1, img, input}
import lustre/event
import message.{type Msg}
import model.{type Model}

fn logo_link(href: String, src: String) {
  a([attribute.href(href), attribute.target("_blank")], [
    img([class("w-24 h-24"), attribute.src(src)]),
  ])
}

fn handle_enter(event) -> Result(Msg, List(dynamic.DecodeError)) {
  use key <- result.try(dynamic.field("key", dynamic.string)(io.debug(event)))

  case key {
    "Enter" -> Ok(message.SubmitName)
    _ -> Error([])
  }
}

pub fn view(model: Model) -> element.Element(Msg) {
  div([class("flex flex-col text-center mt-16 space-y-8 font-demo")], [
    h1([class("text-4xl")], [element.text("Welcome to Gleam@Tauri!")]),
    div([class("flex flex-row justify-center space-x-12")], [
      logo_link("https://tauri.app", "/assets/tauri.svg"),
      logo_link("https://gleam.run", "/assets/lucy.svg"),
      logo_link("https://tailwindcss.com", "/assets/tailwindcss.svg"),
    ]),
    div([], [
      element.text("Click on the Tauri logo to learn more about the framework"),
    ]),
    div([class("space-x-2")], [
      input([
        attribute.placeholder("Enter a name..."),
        event.on_input(message.UpdateName),
        event.on("keypress", handle_enter),
      ]),
      button([event.on_click(message.SubmitName)], [element.text("Greet")]),
    ]),
    div(
      [],
      model.greeting
        |> option.map(fn(g) { [element.text(g)] })
        |> option.unwrap([]),
    ),
  ])
}
