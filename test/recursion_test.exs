defmodule RecursionTest do
  use ExUnit.Case

  test "recursion stops when n is 0" do
    assert Recursion.print_multiple_times("Hello", 0) == :ok
    assert Recursion.print_multiple_times("Hello", 2) == "Hello"
    Recursion.print_multiple_times("Hello", 3)
  end
end
