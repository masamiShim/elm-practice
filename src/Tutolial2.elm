module Tutolial1 exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

-- MAIN
main =
    Browser.sandbox { init = init, update = update, view = view}

-- INIT

type alias Model = { content: String }

init : Model
init = { content = "" }

-- UPDATE

type Msg = Change String
update msg model =
    case msg of
        Change newContent ->
            { model | content = newContent }

-- VIEW

view: Model -> Html Msg
view model =
    div[]
    [
        input[placeholder "Text to reverse", value model.content, onInput Change] [],
        div[][text (String.reverse model.content)]
    ]
