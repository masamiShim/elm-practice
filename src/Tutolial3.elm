module Tutolial1 exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

-- MAIN
main =
    Browser.sandbox { init = init, update = update, view = view}

-- INIT

type alias Model = { name: String, password: String, confirmation: String }

init : Model
init = Model "" "" ""

-- UPDATE

type Msg = Name String | Password String | Confirmation String
update msg model =
    case msg of
        Name name ->
            { model | name = name}
        Password password ->
            { model | password = password}
        Confirmation confirmation ->
            { model | confirmation = confirmation}

-- VIEW

view: Model -> Html Msg
view model =
    div[]
    [
        viewInput "text" "Name" model.name Name,
        viewInput "password" "Password" model.password Password,
        viewInput "password" "Confirmation" model.confirmation Confirmation,
        viewValidation model
     ]

viewInput: String -> String -> String ->(String -> msg) -> Html msg
viewInput t p v toMsg =
    input[ type_ t, placeholder p, value v, onInput toMsg] []

viewValidation: Model -> Html msg
viewValidation model =
    if model.password == model.confirmation then
        div[style "color" "green"][text "OK"]
    else
        div[style "color" "red"] [text "Password do not Much!"]

