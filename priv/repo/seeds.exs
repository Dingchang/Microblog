# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Microblog.Repo.insert!(%Microblog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Microblog.Repo
alias Microblog.Accounts.User

Repo.delete_all(User)

Repo.insert!(%User{email: "abe@example.com", username: "Abe"})
Repo.insert!(%User{email: "bill@example.com", username: "Bill"})
Repo.insert!(%User{email: "carlo@example.com", username: "Carlo"})
Repo.insert!(%User{email: "jack@example.com", username: "Jack"})
Repo.insert!(%User{email: "kim@example.com", username: "Kim"})
