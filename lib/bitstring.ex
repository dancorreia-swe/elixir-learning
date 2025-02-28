defmodule Bitstrings do
  @moduledoc """
  Documentation for Bitstrings module
  """

  def encode_instruction(code_point) do
    case code_point do
      ?H -> 0b0000
      ?F -> 0b0001
      ?B -> 0b0010
      ?E -> 0b0100
      ?T -> 0b1000
      ?O -> 0b0011
    end
  end

  def encode(instructions, encoded_value \\ <<0::size(0)>>)
  def encode([], encoded_value), do: encoded_value
  def encode([head | tail], encoded_value) do
    encode(tail, <<encoded_value::bitstring, encode_instruction(head)::4>>)
  end
end
