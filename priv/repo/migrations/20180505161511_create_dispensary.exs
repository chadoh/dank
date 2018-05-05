defmodule Dank.Repo.Migrations.CreateDispensary do
  use Ecto.Migration

  def change do
    create table(:dispensaries) do
      add :name, :string
      add :location, :string
      add :description, :text

      timestamps()
    end

  end
end
