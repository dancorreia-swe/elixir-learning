defmodule FunctionsTest do
  use ExUnit.Case
  doctest Functions

  describe "anonymous functions" do
    test "function pattern matching" do
      handle_result = fn
        {:ok, result} -> "Handling, result: #{result}"
        {:ok, _} -> "This would never run, since the first one is alredy gonna be evaluated"
        {:error} -> "Ops! An error ocurred"
      end

      # to use anonymous functions in elixir is necessary to use dot notation
      assert handle_result.({:ok, ~c"yay"}) == "Handling, result: yay"
      assert handle_result.({:error}) == "Ops! An error ocurred"
    end

    test "single line function from module" do
      greeting = Functions.hello("daniel")
      assert "Hello, daniel" === greeting
    end
  end

  describe "pattern matching" do
    test "extracting key in function calling" do
      map = %{name: "Daniel", second_name: "Correia"}
      assert Functions.extract_person(map) === "Daniel"
    end
  end

  describe "use of private functions" do
    test "flag to use private func" do
      map = %{name: "Daniel", second_name: "Correia"}

      assert Functions.extract_person(map, true) == "DANIEL"
    end

    test "failed when trying to acess a private function" do
      assert_raise UndefinedFunctionError, fn ->
        Functions.uppercase_name("Luna")
      end
    end
  end

  describe "use of guards (when)" do
    test "passing an error to function" do
      map = %{name: 1, second_name: "Correia"}

      assert_raise ArgumentError, "Name can't be a number", fn ->
        Functions.extract_person(map)
      end
    end
  end

  describe "pipe operator" do
    test "pass on the result of a variable" do
      # The pipe operator is use to pass on the result of a function
      phrase = "Elixir is awesome!"

      phrase_array =
        phrase
        |> String.upcase()
        |> String.split()

      assert length(phrase_array) === 3
      assert Enum.all?(phrase_array, fn word -> String.upcase(word) === word end)
    end
  end
end
