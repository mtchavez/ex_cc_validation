defmodule CcValidation do
  @moduledoc """
  CcValidation implements methods to verify validity of a credit card number
  """

  defmacro name do

  end

  @doc """
  Card numbers that are of length less than 13 or greater than 19 are invalid.

  ## Examples

      iex> CcValidation.validate("123")
      {:error, false}

      iex> CcValidation.validate("12345678901234567890")
      {:error, false}
  """
  def validate(number)
    when byte_size(number) < 13 or byte_size(number) > 19 do
      {:error, false}
  end
end
