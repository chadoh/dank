defmodule Dank.DispensaryController do
  use Dank.Web, :controller

  alias Dank.Dispensary

  def index(conn, _params) do
    dispensaries = Repo.all(Dispensary)
    render(conn, "index.html", dispensaries: dispensaries)
  end

  def new(conn, _params) do
    changeset = Dispensary.changeset(%Dispensary{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"dispensary" => dispensary_params}) do
    changeset = Dispensary.changeset(%Dispensary{}, dispensary_params)

    case Repo.insert(changeset) do
      {:ok, _dispensary} ->
        conn
        |> put_flash(:info, "Dispensary created successfully.")
        |> redirect(to: dispensary_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    dispensary = Repo.get!(Dispensary, id)
    render(conn, "show.html", dispensary: dispensary)
  end

  def edit(conn, %{"id" => id}) do
    dispensary = Repo.get!(Dispensary, id)
    changeset = Dispensary.changeset(dispensary)
    render(conn, "edit.html", dispensary: dispensary, changeset: changeset)
  end

  def update(conn, %{"id" => id, "dispensary" => dispensary_params}) do
    dispensary = Repo.get!(Dispensary, id)
    changeset = Dispensary.changeset(dispensary, dispensary_params)

    case Repo.update(changeset) do
      {:ok, dispensary} ->
        conn
        |> put_flash(:info, "Dispensary updated successfully.")
        |> redirect(to: dispensary_path(conn, :show, dispensary))
      {:error, changeset} ->
        render(conn, "edit.html", dispensary: dispensary, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    dispensary = Repo.get!(Dispensary, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(dispensary)

    conn
    |> put_flash(:info, "Dispensary deleted successfully.")
    |> redirect(to: dispensary_path(conn, :index))
  end
end
