defmodule Microblog.AccountsTest do
  use Microblog.DataCase

  alias Microblog.Accounts

  describe "users" do
    alias Microblog.Accounts.User

    @valid_attrs %{email: "some email", username: "some username"}
    @update_attrs %{email: "some updated email", username: "some updated username"}
    @invalid_attrs %{email: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

#    test "list_users/0 returns all users" do
#      user = user_fixture()
#      assert Accounts.list_users() == [user]
#    end

#    test "get_user!/1 returns the user with given id" do
#      user = user_fixture()
#      assert Accounts.get_user!(user.id) == user
#    end

#    test "create_user/1 with valid data creates a user" do
#      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
#      assert user.email == "some email"
#      assert user.username == "some username"
#    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

#    test "update_user/2 with valid data updates the user" do
#      user = user_fixture()
#      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
#      assert %User{} = user
#      assert user.email == "some updated email"
#      assert user.username == "some updated username"
#    end

#    test "update_user/2 with invalid data returns error changeset" do
#      user = user_fixture()
#      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
#      assert user == Accounts.get_user!(user.id)
#    end

#    test "delete_user/1 deletes the user" do
#      user = user_fixture()
#      assert {:ok, %User{}} = Accounts.delete_user(user)
#      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
#    end

#    test "change_user/1 returns a user changeset" do
#      user = user_fixture()
#      assert %Ecto.Changeset{} = Accounts.change_user(user)
#    end
  end

  describe "follows" do
    alias Microblog.Accounts.Follow

    @valid_attrs %{follow_id: 42, user_id: 42}
    @update_attrs %{follow_id: 43, user_id: 43}
    @invalid_attrs %{follow_id: nil, user_id: nil}

    def follow_fixture(attrs \\ %{}) do
      {:ok, follow} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_follow()

      follow
    end

#    test "list_follows/0 returns all follows" do
#      follow = follow_fixture()
#      assert Accounts.list_follows() == [follow]
#    end

#    test "get_follow!/1 returns the follow with given id" do
#      follow = follow_fixture()
#      assert Accounts.get_follow!(follow.id) == follow
#    end

#    test "create_follow/1 with valid data creates a follow" do
#      assert {:ok, %Follow{} = follow} = Accounts.create_follow(@valid_attrs)
#      assert follow.follow_id == 42
#      assert follow.user_id == 42
#    end

    test "create_follow/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_follow(@invalid_attrs)
    end

#    test "update_follow/2 with valid data updates the follow" do
#      follow = follow_fixture()
#      assert {:ok, follow} = Accounts.update_follow(follow, @update_attrs)
#      assert %Follow{} = follow
#      assert follow.follow_id == 43
#      assert follow.user_id == 43
#    end

#    test "update_follow/2 with invalid data returns error changeset" do
#      follow = follow_fixture()
#      assert {:error, %Ecto.Changeset{}} = Accounts.update_follow(follow, @invalid_attrs)
#      assert follow == Accounts.get_follow!(follow.id)
#    end

#    test "delete_follow/1 deletes the follow" do
#      follow = follow_fixture()
#      assert {:ok, %Follow{}} = Accounts.delete_follow(follow)
#      assert_raise Ecto.NoResultsError, fn -> Accounts.get_follow!(follow.id) end
#    end

#    test "change_follow/1 returns a follow changeset" do
#      follow = follow_fixture()
#      assert %Ecto.Changeset{} = Accounts.change_follow(follow)
#    end
  end
end
