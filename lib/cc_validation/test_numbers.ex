defmodule CcValidation.TestNumbers do
  @moduledoc """
  CcValidation.TestNumbers contains test card numbers to validate against
  as a valid card number
  """

  @numbers %{
    "378282246310005": "American Express",
    "371449635398431": "American Express",
    "378734493671000": "American Express Corporate",
    "5610591081018250": "Australian BankCard",
    "30569309025904": "Diners Club",
    "38520000023237": "Diners Club",
    "6011111111111117": "Discover",
    "6011000990139424": "Discover",
    "3530111333300000": "JCB",
    "3566002020360505": "JCB",
    "5555555555554444": "MasterCard",
    "5105105105105100": "MasterCard",
    "4111111111111111": "Visa",
    "4012888888881881": "Visa",
    "4222222222222": "Visa"
  }


  @doc """
  Check that a number is a valid test number or not

  A valid test card
      iex> CcValidation.TestNumbers.exists?("4111111111111111")
      true

  An invalid test card
      iex> CcValidation.TestNumbers.exists?("4212121212121212")
      false
  """
  def exists?(number) do
    Map.has_key? @numbers, String.to_atom(number)
  end
end
