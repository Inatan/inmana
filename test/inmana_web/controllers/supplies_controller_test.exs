defmodule InmanaWeb.SuppliesControllerTest do
  use InmanaWeb.ConnCase

  describe "create/2" do
    test "when all params are valid, creates the supply", %{conn: conn} do
      params = %{
        responsible: "inatan",
        description: "uva 2",
        expiration_date: "2021-04-23",
        restaurant_id: "2a8bffd3-48a5-4b92-8fe5-1ecfaa4202d8"
      }

      response =
        conn
        |> post(Routes.supply_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Supply created!",
               "supply" => %{
                 "responsible" => "inatan",
                 "description" => "uva 2",
                 "expiration_date" => ~D[2021-04-23],
                 "restaurant_id" => "2a8bffd3-48a5-4b92-8fe5-1ecfaa4202d8",
                 "id" => _id
               }
             } = response
    end

    test "when are invalid params,  returns error", %{conn: conn} do
      params = %{
        description: "uva 2",
        expiration_date: "2021-04-23",
        restaurant_id: "d0515121-3c92-4143-b755-a86536477236"
      }

      expected_response = %{"message" => %{"responsible" => ["can't be blank"]}}

      response =
        conn
        |> post(Routes.supply_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end

  describe "show/2" do
    test "when uuid is valid, returns the supply", %{conn: conn} do
      params = %{
        id: "9ec5259f-9ea2-4f43-8387-c69ad848f4a3"
      }

      response =
        conn
        |> get(Routes.supply_path(conn, :show, params))
        |> json_response(:created)

      assert %{
               "message" => "Supply created!",
               "supply" => %{
                 "responsible" => "inatan",
                 "description" => "uva 2",
                 "expiration_date" => ~D[2021-04-23],
                 "restaurant_id" => "2a8bffd3-48a5-4b92-8fe5-1ecfaa4202d8",
                 "id" => _id
               }
             } = response
    end

    test "when uuid is invalid,  returns error", %{conn: conn} do
      params = %{
        id: "9ec5259f-9ea2-4f43-8387-c69ad8Z8f4a3"
      }

      expected_response = %{"message" => %{"responsible" => ["can't be blank"]}}

      response =
        conn
        |> get(Routes.supply_path(conn, :show, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end
end
