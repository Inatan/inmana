defmodule Inmana.RestaurantTest do
  use Inmana.DataCase

  alias Ecto.Changeset
  alias Inmana.Restaurant

  describe "changeset/1" do
    test "when all params are valid,  returns  a valid changeset" do
      params = %{name: "Siri cascudo", email: "siri@cascudo.com.br"}

      result = Restaurant.changeset(params)

      assert %Changeset{
               changes: %{name: "Siri cascudo", email: "siri@cascudo.com.br"},
               valid?: true
             } = result
    end

    test "when are invalid params,  returns a invalid changeset" do
      params = %{name: "S", email: ""}

      expected_errors = %{
        email: ["can't be blank"],
        name: ["should be at least 2 character(s)"]
      }

      result = Restaurant.changeset(params)

      assert %Changeset{valid?: false} = result

      assert errors_on(result) == expected_errors
    end
  end
end
