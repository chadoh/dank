defmodule Dank.SessionController do
  use Dank.Web, :controller

  def new(conn, _) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => %{"username" => user, "password" => pass}}) do
    case Dank.Auth.login_by_username_and_pass(conn, user, pass, repo: Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:error, "Invalid username/password combination")
        |> render("new.html")
    end
  end

  def delet(conn, _) do
    conn
    |> Dank.Auth.logut()
    |> redirect(to: page_path(conn, :index))
  end
end
