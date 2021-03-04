defmodule Rockelivery do
  alias Rockelivery.Users.Create, as: UserCreate
  alias Rockelivery.Users.Delete, as: UserDelete
  alias Rockelivery.Users.Get, as: UserGet
  alias Rockelivery.Users.Update, as: UserUpdate

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate delete_user(params), to: UserDelete, as: :call
  defdelegate update_user(params), to: UserUpdate, as: :call
  defdelegate get_user_by_id(id), to: UserGet, as: :by_id
end
