defmodule MicroblogWeb.FollowController do
  use MicroblogWeb, :controller

  alias Microblog.Accounts
  alias Microblog.Accounts.Follow

  def create(conn, %{"follow" => follow_params}) do
    case Accounts.create_follow(follow_params) do
      {:ok, follow} ->
        conn
        |> put_flash(:info, "Successfully followed")
        |> redirect(to: NavigationHistory.last_path(conn, default: user_path(conn, :index)))
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:info, "An error occurred when following this user.")
        |> redirect(to: NavigationHistory.last_path(conn, default: user_path(conn, :index)))
    end
  end

  def delete(conn, %{"follow" => follow_params}) do
    follow = Accounts.get_follow(follow_params["follow_id"], follow_params["user_id"])
    {:ok, _follow} = Accounts.delete_follow(follow)

    conn
    |> put_flash(:info, "Successfully unfollowed")
    |> redirect(to: user_path(conn, :show, follow_params["follow_id"]))
  end
end
