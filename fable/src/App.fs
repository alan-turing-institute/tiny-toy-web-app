module App

open Elmish
open Elmish.React
open Fable.React
open Fable.React.Props

// Model - View - Controller again

// Model
type Model = int

// Controller
type Msg =
    | Increment

let ttwaStart () =
    0

let ttwaUpdate msg count =
    match msg with
        | Increment -> count + 1

// View
// dispatch is a some magic thing
let ttwaView count dispatch =
    div [] // Properties
        [ button [ OnClick (fun _ -> dispatch Increment) ] [ str "+" ] ;
          div [] [ ofInt count ] ]


// Entry point
Program.mkSimple ttwaStart ttwaUpdate ttwaView 
|> Program.withReactBatched "app"
|> Program.run
