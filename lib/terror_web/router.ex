defmodule TerrorWeb.Router do
  use TerrorWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", TerrorWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  forward "/graphiql", Absinthe.Plug.GraphiQL, schema: TerrorWeb.Schema, socket: TerrorWeb.UserSocket, interface: :playground
  forward "/graphql", Absinthe.Plug, schema: TerrorWeb.Schema
end
