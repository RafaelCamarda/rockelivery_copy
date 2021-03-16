defmodule Rockelivery.Order do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Enum
  alias Rockelivery.{Item, User}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:address, :comments, :payment_method, :user_id]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "items" do
    field :address, :string
    field :comments, :string
    field :payment_method, Enum, values: [:food, :drink, :desert]

    many_to_many :items, Item, join_through: "order_items"
    belongs_to :user, User

    timestamps()
  end

  def changeset(changeset \\ %__MODULE__{}, params, items) do
    changeset
    |> cast(params, @required_params)
    |> put_assoc(:items, items)
    |> validate_required(@required_params)
    |> validate_length(:description, min: 6)
    |> validate_number(:price, greater_than: 0)
  end
end
