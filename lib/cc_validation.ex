defmodule CcValidation do
  @moduledoc """
  CcValidation implements methods to verify validity of a credit card number
  """

  def validate(number, check_test_numbers \\ false)

  @doc """
  Validate test card numbers when check_test_numbers is true

  A valid test card
      iex> CcValidation.validate("4111111111111111", true)
      {:ok, true, test_number: true}

  An invalid test card
      iex> CcValidation.validate("4212121212121212", true)
      {:error, false, test_number: false}

  A valid card when checking for test numbers just passes through
  to the validate function but will also return that it is not
  a test card
      iex> CcValidation.validate("4716892095589823", true)
      {:ok, true, test_number: false}
  """
  def validate(number, true) do
    case CcValidation.TestNumbers.has_number?(number) do
      true ->
        {:ok, true, test_number: true}
      false ->
        Tuple.append(validate(number), test_number: false)
    end
  end

  @doc """
  Card numbers that are of length less than 13 or greater than 19 are invalid.

  ## Examples

      iex> CcValidation.validate("123")
      {:error, false}

      iex> CcValidation.validate("12345678901234567890")
      {:error, false}
  """
  def validate(number, false)
    when byte_size(number) < 13 or byte_size(number) > 19 do
      {:error, false}
  end

  @doc """
  Validate a credit card number using Luhn Algorithm

  ## Examples

  Valid credit card
      iex> CcValidation.validate("4716892095589823")
      {:ok, true}

  Invalid credit card
      iex> CcValidation.validate("4024007106963134")
      {:error, false}
  """
  def validate(number, false) do
    total = String.codepoints(number)
    |> Enum.reverse
    |> Stream.with_index
    |> Enum.filter_map(fn({_, i}) -> rem(i + 1, 2) == 0 end, fn({n, _}) -> String.to_integer(n) * 2 end)
    |> Enum.sum
    case rem(total, 10) do
      0 ->
        {:ok, true}
      _ ->
        {:error, false}
    end
  end
end
