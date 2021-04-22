defmodule Inmana.Supplies.ExpirationEmail do
  import Bamboo.Email
  alias Inmana.Supply

  def create(to_email, supplies) do
    new_email(
      to: to_email,
      from: "app@inmana.com.br",
      subject: "Supplies taht are about to expire",
      text_body: email_text(supplies)
    )
  end

  defp email_text(supplies) do
    initical_text = "--------- Supplies that are about to expire: ---------\n"

    Enum.reduce(supplies, initical_text, fn supply, text -> text <> supply_string(supply) end)
  end

  defp supply_string(%Supply{
         description: description,
         expiration_date: expiration_date,
         responsible: responsible
       }) do
    "Description: #{description}, Expiration Date: #{expiration_date}, Responsible: #{responsible}\n"
  end
end
