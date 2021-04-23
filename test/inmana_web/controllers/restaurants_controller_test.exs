defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase

  describe "create/2" do
    test "when all params are valid,  creates the user", %{conn: conn} do
      params = %{name: "Siri cascudo", email: "siri@cascudo.com.br"}

      response =
        conn
        |> post(Routes.restaurant_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Restaurant created!",
               "restaurant" => %{
                 "email" => "siri@cascudo.com.br",
                 "name" => "Siri cascudo",
                 "id" => _id
               }
             } = response
    end

    test "when are invalid params,  return erro", %{conn: conn} do
      params = %{email: "siri@cascudo.com.br"}

      expected_response = %{"message" => %{"name" => ["can't be blank"]}}

      response =
        conn
        |> post(Routes.restaurant_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end
end
