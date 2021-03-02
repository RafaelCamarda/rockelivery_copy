defmodule RockeliveryWeb.UsersController do
  use RockeliveryWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> text("Welcome! :)")
  end
end
