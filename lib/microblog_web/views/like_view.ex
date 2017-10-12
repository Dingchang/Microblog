defmodule MicroblogWeb.LikeView do
  use MicroblogWeb, :view
  alias MicroblogWeb.LikeView

  def render("index.json", %{likes: likes}) do
    %{data: render_many(likes, LikeView, "like.json")}
  end

  def render("show.json", %{like: like}) do
    %{data: render_one(like, LikeView, "like.json")}
  end

  def render("like.json", %{like: like}) do
    data = %{
      id: like.id,
      user_id: like.user_id,
      message_id: like.message_id,
    }

    if Ecto.assoc_loaded?(like.post) do
      Map.put(data, :post_contant, like.post.contant)
    else
      data
    end
  end
end
