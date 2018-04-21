defmodule Dank.DankController do
  use Dank.Web, :controller

  def world(conn, _params) do
    render(conn, "world.html")
  end
end
