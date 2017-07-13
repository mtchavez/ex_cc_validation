# CcValidation

[![build status](https://gitlab.com/mtchavez/ex_cc_validation/badges/master/build.svg)](https://gitlab.com/mtchavez/ex_cc_validation/commits/master)
[![coverage report](https://gitlab.com/mtchavez/ex_cc_validation/badges/master/coverage.svg)](https://gitlab.com/mtchavez/ex_cc_validation/commits/master)

Credit Card format validation

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `cc_validation` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:cc_validation, "~> 0.1.0"}]
end
```

## Usage

### Validate a card number

Valid credit card

```elixir
iex> CcValidation.validate("4716892095589823")
{:ok, true}
````

Invalid credit card

```elixir
iex> CcValidation.validate("4024007106963124")
{:error, false}
````

Test card returns false

```elixir
iex> CcValidation.validate("4111111111111111")
{:error, false}
````

### Validate test card numbers when check_test_numbers is true

A valid test card

```elixir
iex> CcValidation.validate("4111111111111111", true)
{:ok, true, test_number: true}
````

An invalid test card

```elixir
iex> CcValidation.validate("4212121212121212", true)
{:error, false, test_number: false}
````

A valid card when checking for test numbers just passes through
to the validate function but will also return that it is not
a test card

```elixir
iex> CcValidation.validate("4716892095589823", true)
{:ok, true, test_number: false}
````

### Card numbers that are of length less than 13 or greater than 19 are invalid.

```elixir
iex> CcValidation.validate("123")
{:error, false}

iex> CcValidation.validate("12345678901234567890")
{:error, false}
````

## Tests

Tests can be ran with `mix` by running `mix test`

## Documentation

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/cc_validation](https://hexdocs.pm/cc_validation).

