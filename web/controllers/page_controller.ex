defmodule Dank.PageController do
  use Dank.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
