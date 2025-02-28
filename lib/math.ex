defmodule Math do
  @moduledoc """
  Provides math-related functions.

  ## Examples

    iex> Math.sum(1, 2)
    3

  """

  @doc """
  Calculates the sum of two numbers.
  """
  @spec sum(number(), number()) :: number()
  def sum(a, b), do: a + b
end
