module Todo exposing (..)
import Browser
import Html exposing (..)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (..)


-- MAIN
main =
    Browser.sandbox { init = init, update = update, view = view }

type alias Content = String
type alias Todo = {id: Int, content: String, done: Bool}
type alias TodoList = List Todo
type alias Model = {counter: Int, content: Content, todo: Todo, list: TodoList}
init : Model
init = { counter = 0, content = "", todo = Todo 0 "" False , list = []}

type Msg = Add | Change String
update: Msg -> Model -> Model
update msg model  =
    case msg of
        Add -> { model | list =  Todo model.counter  model.content False::model.list}
        Change text -> { model | content = text }

view: Model -> Html Msg
view model =
    div[]
    [
        input[value model.content , onInput Change][],
        viewTable model.list,
        button [ onClick Add ] [ text "Add" ]
    ]

viewTable: List Todo -> Html Msg
viewTable list =
    div[](List.map itemRow list)

itemRow: Todo -> Html Msg
itemRow todo =
    div[][
        span[][text (String.fromInt todo.id)],
        input[type_ "checkbox"][],
        span[][text todo.content]
    ]
