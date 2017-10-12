defmodule Microblog.MblogTest do
  use Microblog.DataCase

  alias Microblog.Mblog

  describe "messages" do
    alias Microblog.Mblog.Message

    @valid_attrs %{contant: "some contant"}
    @update_attrs %{contant: "some updated contant"}
    @invalid_attrs %{contant: nil}

    def message_fixture(attrs \\ %{}) do
      {:ok, message} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Mblog.create_message()

      message
    end

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Mblog.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Mblog.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      assert {:ok, %Message{} = message} = Mblog.create_message(@valid_attrs)
      assert message.contant == "some contant"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Mblog.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      assert {:ok, message} = Mblog.update_message(message, @update_attrs)
      assert %Message{} = message
      assert message.contant == "some updated contant"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Mblog.update_message(message, @invalid_attrs)
      assert message == Mblog.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Mblog.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Mblog.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Mblog.change_message(message)
    end
  end
end
