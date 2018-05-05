defmodule Dank.ReviewTest do
  use Dank.ModelCase

  alias Dank.Review

  @valid_attrs %{" dispensary": "some content", rank: 42, review: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Review.changeset(%Review{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Review.changeset(%Review{}, @invalid_attrs)
    refute changeset.valid?
  end
end
