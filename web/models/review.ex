defmodule Dank.Review do
  use Dank.Web, :model

  schema "reviews" do
    field :" dispensary", :string
    field :rank, :integer
    field :review, :string
    belongs_to :user, Dank.User
    belongs_to :dispensary, Dank.Dispensary

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:" dispensary", :rank, :review])
    |> validate_required([:" dispensary", :rank, :review])
  end
end
