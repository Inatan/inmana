defmodule Inmana.SupplyTest do
  use Inmana.DataCase

  alias Ecto.Changeset
  alias Inmana.Supply

  describe "changeset/1" do
    test "when all params are valid,  returns  a valid changeset" do
      params = %{
        responsible: "inatan",
        description: "uva 2",
        expiration_date: "2021-04-23",
        restaurant_id: "d0515121-3c92-4143-b755-a86536477236"
      }

      result = Supply.changeset(params)

      assert %Changeset{
               changes: %{
                 responsible: "inatan",
                 description: "uva 2",
                 expiration_date: ~D[2021-04-23],
                 restaurant_id: _id
               },
               valid?: true
             } = result
    end

    test "when are invalid params,  returns a invalid changeset" do
      params = %{
        responsible: "S",
        description: "",
        expiration_date: "2021-04-23",
        restaurant_id: "d0515121-3c92-4143-b755-a86536477236"
      }

      expected_errors = %{
        description: ["can't be blank"],
        responsible: ["should be at least 3 character(s)"]
      }

      result = Supply.changeset(params)

      assert %Changeset{valid?: false} = result

      assert errors_on(result) == expected_errors
    end
  end
end
