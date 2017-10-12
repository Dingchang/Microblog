defmodule Microblog.Repo.Migrations.CreateLikes do
  use Ecto.Migration

  def change do
    create table(:likes) do

      timestamps()
    end

  end
end
