defmodule Inmana.WelcomerTest do
  use ExUnit.Case

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when the user is special,  returns  a special message" do
      params = %{"name" => "banana", "age" => "42"}

      expect_result = {:ok, "You are very special banana"}

      result = Welcomer.welcome(params)

      assert result == expect_result
    end

    test "when the user is not special,  returns a message" do
      params = %{"name" => "bananinha", "age" => "22"}

      expect_result = {:ok, "Welcome bananinha"}

      result = Welcomer.welcome(params)

      assert result == expect_result
    end

    test "when the user age is under eitheen,  returns  You shall not pass message" do
      params = %{"name" => "banana", "age" => "14"}

      expect_result = {:error, "You shall not pass banana"}

      result = Welcomer.welcome(params)

      assert result == expect_result
    end
  end
end
