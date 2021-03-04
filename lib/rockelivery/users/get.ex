defmodule Rockelivery.Users.Get do
  alias Ecto.UUID

  alias Rockelivery.{Error, Repo, User}

  def by_id(id) do
    case UUID.cast(id) do
      :error -> {:error, Error.build_id_format_error()}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(User, uuid) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> {:ok, user}
    end
  end

  def by_id_2(id) do
    with {:ok, uuid} <- UUID.cast(id),
         %User{} = user <- Repo.get(User, uuid) do
      {:ok, user}
    else
      :error -> {:error, Error.build_id_format_error()}
      nil -> {:error, Error.build_user_not_found_error()}
    end
  end
end
