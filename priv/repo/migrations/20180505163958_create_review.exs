defmodule Dank.Repo.Migrations.CreateReview do
  use Ecto.Migration

  def change do
    create table(:reviews) do
      add :" dispensary", :string
      add :rank, :integer
      add :review, :text
      add :user_id, references(:users, on_delete: :nothing)
      add :dispensary_id, references(:dispensaries, on_delete: :nothing)

      timestamps()
    end
    create index(:reviews, [:user_id])
    create index(:reviews, [:dispensary_id])

  end
end
