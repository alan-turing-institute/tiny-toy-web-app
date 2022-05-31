module Main exposing (..)

-- Tiny Toy Web App (TTWA)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

-- Entry point
-- I gather there are other "kinds" of apps, not just "sandbox"

main =
    -- The syntax { } creates a record (like a named tuple)
    Browser.sandbox { init = ttwaStart, update = ttwaUpdate, view = ttwaView }


-- The "Elm architecture" is "Model-View-Controller".

-- Model
-- The entire state of this app is a single integer.

type alias Model = Int

ttwaStart : Model
ttwaStart = 0


-- View
-- view takes a Model and returns a web page that generates messages.
-- (That is, Html Msg is a type, the type of "web pages which produce Msg's"

ttwaView : Model -> Html Msg
ttwaView counter =
    div []
        [ button [ onClick Increment ] [ text "+" ],
          div [] [ text (String.fromInt counter) ] ]

            
-- Controller
-- Our app receives a single message, "Increment"
-- Note that it does /not/ "update the counter" it "returns a new model"

type Msg = Increment

ttwaUpdate : Msg -> Model -> Model
ttwaUpdate msg counter =
    case msg of
        Increment ->
            counter + 1

