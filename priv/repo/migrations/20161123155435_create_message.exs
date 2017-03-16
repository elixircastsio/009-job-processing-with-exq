defmodule Teacher.Repo.Migrations.CreateMessage do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :subject, :string
      add :body, :text

      timestamps()
    end

  end
end
