defmodule InmanaWeb.RestaurantView do
  use InmanaWeb, :view

  def render("create.json", %{restaurant: restaurant}) do
    %{
      message: "Restaurant created!",
      retaurant: restaurant
    }
  end
end
