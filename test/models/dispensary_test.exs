defmodule Dank.DispensaryTest do
  use Dank.ModelCase

  alias Dank.Dispensary

  @valid_attrs %{" name": "some content", description: "some content", location: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Dispensary.changeset(%Dispensary{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Dispensary.changeset(%Dispensary{}, @invalid_attrs)
    refute changeset.valid?
  end
end
