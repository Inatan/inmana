defmodule Inmana.Supply do
  use Ecto.Schema
  import Ecto.Changeset

  alias Inmana.Restaurant

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @require_paramers [:description, :expiration_date, :responsible, :restaurant_id]

  # formatação do json
  @derive {Jason.Encoder, only: @require_paramers ++ [:id]}

  schema "supplies" do
    field :description, :string
    field :responsible, :string
    field :expiration_date, :date

    belongs_to :restaurant, Restaurant

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @require_paramers)
    |> validate_required(@require_paramers)
    |> validate_length(:description, min: 3)
    |> validate_length(:responsible, min: 3)
    |> foreign_key_constraint(:restaurant_id)
  end
end
