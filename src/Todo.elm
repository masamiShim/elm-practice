module Todo exposing (..)
import Browser
import Html exposing (..)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (..)


-- MAIN
main =
    Browser.sandbox { init = init, update = update, view = view }

type alias Todo = String
type alias TodoList = List String
type alias Model = {todo: Todo, list: TodoList}
init : Model
init = { todo = "", list = []}

type Msg = Add | Change String
update: Msg -> Model -> Model
update msg model  =
    case msg of
        Add -> { model | list =  model.todo::model.list}
        Change text -> { model | todo = text }

view: Model -> Html Msg
view model =
    div[]
    [
        input[value model.todo , onInput Change][],
        viewTable model.list,
        button [ onClick Add ] [ text "Add" ]
    ]

viewTable: List Todo -> Html Msg
viewTable list =
    div[](List.map itemRow list)

itemRow: Todo -> Html Msg
itemRow todo =
    div[][
        span[][text todo]
    ]
