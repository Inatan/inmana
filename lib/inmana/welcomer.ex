defmodule Inmana.Welcomer do
  # Receber um nome e uma idade do usuario
  # se o usuário chamar banana e tiver idade 42,  ele recebe uma mensagem especial
  # se o usuário for maior de idade, ele recebe uma mensagem normal
  # se o usuário for menor de idada, retornamos um erro
  # temos que tratar o nome do usuário para entradas erradas, como "BaNaNa", "  BaNaNa \n"

  # iex -S mix

  # h String.upcase => toda a documentação

  # alias  Iamana.Welcomer => Welcomer

  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)

    name
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)
  end

  defp evaluate("banana", 42) do
    {:ok, "You are very special banana"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Welcome #{name}"}
  end

  defp evaluate(name, _age) do
    {:error, "You shall not pass #{name}"}
  end
end
