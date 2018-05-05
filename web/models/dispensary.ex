defmodule Dank.Dispensary do
  use Dank.Web, :model

  schema "dispensaries" do
    field(:name, :string)
    field(:location, :string)
    field(:description, :string)
    has_many(:reviews, Dank.Review)

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :location, :description])
    |> validate_required([:name, :location, :description])
  end
end
