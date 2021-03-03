defmodule RockeliveryWeb.UsersView do
  use RockeliveryWeb, :view

  alias Rockelivery.User

  def render("create.json", %{user: %User{id: id} = user}) do
    %{
      message: "User created successfully",
      id: id,
      user: user
    }
  end

  def render("show.json", %{user: %User{} = user}), do: %{user: user}
end
