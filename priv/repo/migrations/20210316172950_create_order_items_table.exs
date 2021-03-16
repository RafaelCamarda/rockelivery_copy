defmodule Rockelivery.Repo.Migrations.CreateOrderItemsTable do
  use Ecto.Migration

  def change do
    create table(:order_items) do
      add :item_id, references(:items, type: :binary_id)
      add :order_id, references(:orders, type: :binary_id)
    end

    create unique_index(:order_items, [:item_id, :order_id])
  end
end
