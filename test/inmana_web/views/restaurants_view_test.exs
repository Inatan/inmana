defmodule InmanaWeb.RestaurantControllerTest do
  use InmanaWeb.ConnCase

  import Phoenix.View

  alias Inmana.Restaurant
  alias InmanaWeb.RestaurantView

  describe "render/2" do
    test "renders create.json" do
      params = %{name: "Siri cascudo", email: "siri@cascudo.com.br"}

      {:ok, restaurant} = Inmana.create_restaurant(params)

      response = render(RestaurantView, "create.json", restaurant: restaurant)

      assert %{
               message: "Restaurant created!",
               restaurant: %Restaurant{
                 email: "siri@cascudo.com.br",
                 name: "Siri cascudo",
                 id: _id
               }
             } = response
    end
  end
end
