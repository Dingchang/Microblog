defmodule Microblog.Repo.Migrations.EditLikes do
  use Ecto.Migration

  def change do
    alter table(:likes) do
      add :user_id, references(:users, on_delete: :nothing), null: false
      add :message_id, references(:messages, on_delete: :nothing), null: false
    end

    create index(:likes, [:user_id])
    create index(:likes, [:message_id])
  end
end
