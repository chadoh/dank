defmodule Dank.DispensaryControllerTest do
  use Dank.ConnCase

  alias Dank.Dispensary
  @valid_attrs %{description: "some content", location: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, dispensary_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing dispensaries"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, dispensary_path(conn, :new)
    assert html_response(conn, 200) =~ "New dispensary"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, dispensary_path(conn, :create), dispensary: @valid_attrs
    assert redirected_to(conn) == dispensary_path(conn, :index)
    assert Repo.get_by(Dispensary, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, dispensary_path(conn, :create), dispensary: @invalid_attrs
    assert html_response(conn, 200) =~ "New dispensary"
  end

  test "shows chosen resource", %{conn: conn} do
    dispensary = Repo.insert! %Dispensary{}
    conn = get conn, dispensary_path(conn, :show, dispensary)
    assert html_response(conn, 200) =~ "Show dispensary"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, dispensary_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    dispensary = Repo.insert! %Dispensary{}
    conn = get conn, dispensary_path(conn, :edit, dispensary)
    assert html_response(conn, 200) =~ "Edit dispensary"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    dispensary = Repo.insert! %Dispensary{}
    conn = put conn, dispensary_path(conn, :update, dispensary), dispensary: @valid_attrs
    assert redirected_to(conn) == dispensary_path(conn, :show, dispensary)
    assert Repo.get_by(Dispensary, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    dispensary = Repo.insert! %Dispensary{}
    conn = put conn, dispensary_path(conn, :update, dispensary), dispensary: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit dispensary"
  end

  test "deletes chosen resource", %{conn: conn} do
    dispensary = Repo.insert! %Dispensary{}
    conn = delete conn, dispensary_path(conn, :delete, dispensary)
    assert redirected_to(conn) == dispensary_path(conn, :index)
    refute Repo.get(Dispensary, dispensary.id)
  end
end
