defmodule Microblog.Repo.Migrations.ModifyOnDeleteToReferences do
  use Ecto.Migration

  def up do
    execute "ALTER TABLE likes DROP CONSTRAINT likes_user_id_fkey"
    execute "ALTER TABLE likes DROP CONSTRAINT likes_message_id_fkey"
    alter table(:likes) do
      modify(:user_id, references(:users, on_delete: :delete_all), null: false)
      modify(:message_id, references(:messages, on_delete: :delete_all), null: false)
    end

    execute "ALTER TABLE follows DROP CONSTRAINT follows_follow_id_fkey"
    execute "ALTER TABLE follows DROP CONSTRAINT follows_user_id_fkey"
    alter table(:follows) do
      modify(:follow_id, references(:users, on_delete: :delete_all))
      modify(:user_id, references(:users, on_delete: :delete_all))
    end
  end
end
