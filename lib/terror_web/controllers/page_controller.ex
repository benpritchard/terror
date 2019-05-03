defmodule TerrorWeb.PageController do
  use TerrorWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
