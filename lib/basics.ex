defmodule Basics do
  @moduledoc """
  Documentation for `Basics`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Basics.hello()
      :world

  """
  def hello do
    :world
  end

  def integers do
    1..10
  end

  def float do
    1.0
  end

  @doc """
  Returns a list with 3 items.
  A list can contain items of different types.
  It can concatenate, prepend, subtract, and separate in head and tail.
  Also can have non-unique items.
  Lists in Elixir are linked lists.
  So prepending is O(1) and appending is O(n).
  """
  def list do
    [1, 2, 3]
  end

  @doc """
  Returns a tuple
  Tuples are more efficient than lists for pattern matching.
  Also are stored in contiguous memory.
  Which makes them faster to access. But slower to update.
  """
  def tuple do
    {:ok, "hello"}
  end

  def keyword_list do
    [foo: "bar", bar: "baz"]
  end

  @spec map() :: %{:bar => <<_::24>>, :foo => <<_::24>>, 1 => <<_::24>>}
  @doc """
  Returns a map
  Maps are the most flexible data structure in Elixir.
  They can have any type as a key.
  """
  def map do
    %{:foo => "bar", :bar => "baz", 1 => "one"}
  end

  def string do
    "hello"
  end
end
