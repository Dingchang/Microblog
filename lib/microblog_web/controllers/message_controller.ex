defmodule MicroblogWeb.MessageController do
  use MicroblogWeb, :controller

  alias Microblog.Mblog
  alias Microblog.Mblog.Message

  def index(conn, _params) do
    messages = Mblog.list_messages()
    render(conn, "index.html", messages: messages)
  end

  def new(conn, _params) do
    changeset = Mblog.change_message(%Message{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"message" => message_params}) do
    case Mblog.create_message(message_params) do
      {:ok, message} ->
        conn
        |> put_flash(:info, "Message created successfully.")
        |> redirect(to: message_path(conn, :show, message))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    message = Mblog.get_message!(id)
    |> Microblog.Repo.preload(:user)
    render(conn, "show.html", message: message)
  end

  def edit(conn, %{"id" => id}) do
    message = Mblog.get_message!(id)
    changeset = Mblog.change_message(message)
    render(conn, "edit.html", message: message, changeset: changeset)
  end

  def update(conn, %{"id" => id, "message" => message_params}) do
    message = Mblog.get_message!(id)

    case Mblog.update_message(message, message_params) do
      {:ok, message} ->
        conn
        |> put_flash(:info, "Message updated successfully.")
        |> redirect(to: message_path(conn, :show, message))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", message: message, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    message = Mblog.get_message!(id)
    {:ok, _message} = Mblog.delete_message(message)

    conn
    |> put_flash(:info, "Message deleted successfully.")
    |> redirect(to: message_path(conn, :index))
  end
end
