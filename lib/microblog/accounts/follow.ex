defmodule Microblog.Accounts.Follow do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Accounts.Follow


  schema "follows" do
    belongs_to :follow, Microblog.Accounts.User, foreign_key: :follow_id
    belongs_to :user, Microblog.Accounts.User, foreign_key: :user_id

    timestamps()
  end

  @doc false
  def changeset(%Follow{} = follow, attrs) do
    follow
    |> cast(attrs, [:user_id, :follow_id])
    |> validate_required([:user_id, :follow_id])
  end
end
