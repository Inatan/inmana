defmodule InmanaWeb.SupplyViewTest do
  use InmanaWeb.ConnCase

  import Phoenix.View

  alias Inmana.Supply
  alias InmanaWeb.SupplyView

  describe "render/2" do
    test "renders create.json" do
      params = %{
        responsible: "inatan",
        description: "uva 2",
        expiration_date: "2021-04-23",
        restaurant_id: "2a8bffd3-48a5-4b92-8fe5-1ecfaa4202d8"
      }

      {:ok, supply} = Inmana.create_supply(params)

      response = render(SupplyView, "create.json", supply: supply)

      assert %{
               message: "Supply created!",
               supply: %{
                 responsible: "inatan",
                 description: "uva 2",
                 expiration_date: ~D[2021-04-23],
                 restaurant_id: "2a8bffd3-48a5-4b92-8fe5-1ecfaa4202d8",
                 id: _id
               }
             } = response
    end
  end
end
