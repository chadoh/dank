defmodule Dank.Review do
  use Dank.Web, :model

  schema "reviews" do
    field(:" dispensary", :string)
    field(:rank, :integer)
    field(:review, :string)
    belongs_to(:user, Dank.User)
    belongs_to(:dispensary, Dank.Dispensary)

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
<<<<<<< HEAD
    # model
    # |> cast(params, @required_fields, @optional_fields)
=======
    struct
    |> cast(params, [:dispensary, :rank, :review])
>>>>>>> 28347f34a38880f71488393a11f3a40111037150

    struct
    |> cast(params, @required_fields, @optional_fields)
    |> validate_required([:" dispensary", :rank, :review])
  end
end
