defmodule Dank.Repo.Migrations.CreateDispensary do
  use Ecto.Migration

  def change do
    create table(:dispensaries) do
      add(:name, :string)
      add(:location, :string)
      add(:description, :text)
      add(:user_id, references(:users, on_delete: :nothing))

      timestamps()
    end

    create(index(:dispensaries, [:user_id]))
  end
end
