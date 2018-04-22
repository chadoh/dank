defmodule Dank.Router do
  use Dank.Web, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", Dank do
    pipe_through(:browser)

    get("/", PageController, :index)
    resources("/users", UserController, only: [:index, :show, :new, :create])
  end
end
