module Main exposing (main)

import Browser
import Html exposing (Html, div, text)
import Html.Attributes as Attr exposing (class)
import MdConverter as Md
import Mustache
import Quantity as Qty


type alias Model =
    {}


init : () -> ( Model, Cmd Msg )
init () =
    ( {}, Cmd.none )


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div
        [ class "tw md:container md:mx-auto md:mt-6 md:px-4 prose" ]
        (Html.h1
            [ class "tw text-red-700" ]
            [ text "¡Aquí Vamamos Pues!" ]
            :: t
        )



-- )
-- * Presentar Texto Resultados para confirmar


t : List (Html msg)
t =
    "## Resumen importante\n\nCada módulo es un para **dos** y la entrada es {{entrada1}}.\n\n Bye."
        |> Mustache.render
            [ Mustache.Variable "entrada1" "en markdown" ]
        |> Md.parsea
        |> Md.renderea


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
