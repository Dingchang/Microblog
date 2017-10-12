defmodule Microblog.Mblog.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Mblog.Message


  schema "messages" do
    field :contant, :string

    belongs_to :user, Microblog.Accounts.User

    has_many :likes, Microblog.Mblog.Like

    timestamps()
  end

  @doc false
  def changeset(%Message{} = message, attrs) do
    message
    |> cast(attrs, [:contant, :user_id])
    |> validate_required([:contant, :user_id])
  end
end
