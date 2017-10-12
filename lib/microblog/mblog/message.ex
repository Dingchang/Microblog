defmodule Microblog.Mblog.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Mblog.Message


  schema "messages" do
    field :contant, :string

    timestamps()
  end

  @doc false
  def changeset(%Message{} = message, attrs) do
    message
    |> cast(attrs, [:contant])
    |> validate_required([:contant])
  end
end
