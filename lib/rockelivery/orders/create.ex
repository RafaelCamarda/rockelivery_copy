defmodule Rockelivery.Orders.Create do
  import Ecto.Query

  alias Rockelivery.{Error, Item, Order, Repo}

  def call(params) do
    params
    |> fetch_items()
    |> handle_items(params)
  end

  defp fetch_items(items_ids) do
    query = from item in Item, where: item.id in ^items_ids

    query
    |> Repo.all()
    |> validate_items(items_ids)
  end

  # MUDAR ISSO DAQUI
  defp validate_items(items, items_ids) when length(items) == length(items_ids) do
    {:ok, items}
  end

  defp validate_items(_items, _items_ids), do: {:error, "Invalid item ids"}

  defp handle_items({:error, result}, _params), do: build_error(result)

  defp handle_items({:ok, items}, params) do
    params
    |> Order.changeset(items)
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Order{}} = order), do: Repo.preload(order, [:items])
  defp handle_insert({:error, result}), do: build_error(result)

  defp build_error(result), do: {:error, Error.build(:bad_request, result)}
end
