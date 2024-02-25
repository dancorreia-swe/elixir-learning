defmodule BasicsTest do
  use ExUnit.Case
  doctest Basics

  test "greets the world" do
    assert Basics.hello() == :world
  end

  describe "numbers behaviors" do
    test "it should return a range of integers" do
      assert Basics.integers() === 1..10
    end

    test "it should return a single float" do
      assert Basics.float() === 1.0
      assert is_float(Basics.float())
    end
  end

  describe "list behaviors" do
    test "it should return a list with 3 items" do
      assert Enum.count(Basics.list()) === 3
      assert Basics.list() === [1, 2, 3]
    end

    test "it should contain items of different types" do
      list_distinct = [:foo, "bar", 1]
      assert list_distinct === [:foo, "bar", 1]

      assert is_list(list_distinct)
      assert is_atom(Enum.at(list_distinct, 0))
      assert String.valid?(Enum.at(list_distinct, 1))
    end

    test "it should concatenate a list" do
      base_list = [1, 2, 3]
      assert base_list === [1, 2, 3]

      concatenate_list = base_list ++ [4, 5, 6]
      assert concatenate_list === [1, 2, 3, 4, 5, 6]
    end

    test "it should prepend items in a list" do
      base_list = [1, 2, 3]
      assert base_list === [1, 2, 3]

      prepend_list = [0 | base_list]
      assert prepend_list === [0, 1, 2, 3]
    end

    test "it should subtract a list" do
      assert [1, 2, 3] -- [2] === [1, 3]
    end

    test "it should separate in head and tail of a list" do
      list = [1, 2, 3]
      assert hd(list) === 1
      assert tl(list) === [2, 3]

      [h | t] = list
      assert h === 1
      assert t === [2, 3]
    end
  end

  describe "tuple behaviors" do
    test "it should return a tuple with 2 items" do
      assert Basics.tuple() === {:ok, "hello"}
    end
  end

  describe "keyword lists" do
    test "it should return a list with 2 associatives items" do
      Keyword.keyword?(Basics.keyword_list())
    end
  end

  describe "strings behaviors" do
    test "it should return a string" do
      String.valid?(Basics.string())
    end

    test "it should check if matches a break line" do
      breakLine = "string
      test"

      assert String.contains?(breakLine, "\n")
    end

    test "it should check if matches a tab" do
      tab = "string\ttest"

      assert String.contains?(tab, "\t")
    end

    test "it should check if matches a space" do
      space = "string test"

      assert String.contains?(space, " ")
    end

    test "it should concatenate a string" do
      base_string = "First"
      assert base_string === "First"

      interpolate_string = base_string <> " Second"
      assert interpolate_string === "First Second"
    end

    test "it should interpolate a string" do
      name = "Daniel"
      base_string = "Help me, #{name}"

      assert base_string === "Help me, Daniel"
    end
  end

  describe "map behaviors" do
    test "it should return a map" do
      assert Basics.map() === %{:foo => "bar", :bar => "baz", 1 => "one"}
    end

    test "it should replace an equal key" do
      assert %{:foo => "bar", :foo => "baz"} === %{:foo => "baz"}
    end

    test "it should check if every keys is an atom" do
      map = %{hello: "world", key: "value"}
      assert is_map(map)
      assert Enum.all?(map, fn {k, _} -> is_atom(k) end)
    end

    test "it should add a key value into the map" do
      map = %{hello: "world"}
      assert %{hello: "world", key: "value"} === Map.put(map, :key, "value")
    end
  end

  describe "enum behaviors" do
    test "map function" do
      list = [1, 2, 3]
      assert Enum.map(list, fn x -> x * 2 end) === [2, 4, 6]

      assert Enum.map(list, &(&1 * 2)) === [2, 4, 6]
    end

    test "sort function" do
      list = [3, 1, 2]
      assert Enum.sort(list) === [1, 2, 3]
    end

    test "any function" do
      list = ["string", 1, :foo]
      assert true === Enum.any?(list, fn x -> is_atom(x) end)

      assert true === Enum.any?(list, &is_atom(&1))
    end

    test "chunk every function" do
      list = [1, 2, 3, 4, 5, 6]
      assert [[1, 2], [3, 4], [5, 6]] === Enum.chunk_every(list, 2)
    end

    test "uniq function" do
      list = [1, 1, 1, 2, 3, 4, 4, :foo, :stop, :foo]
      assert [1, 2, 3, 4, :foo, :stop] === Enum.uniq(list)
    end
  end

  describe "control structures" do
    test "unless structure" do
      a = :rand.uniform()

      unless a > 0.5 do
        IO.puts(a)
        IO.puts(~c"Is lower than 0.5")
      end
    end
  end

  test "cond structure" do
    a = :rand.uniform()

    answer =
      cond do
        a > 0.2 ->
          "First case"

        a > 0.4 ->
          "Second case"

        true ->
          "Default case"
      end

    possibilities = ["Default case", "First case", "Second case"]
    assert true === Enum.any?(possibilities, &(&1 === answer))
  end

  test "case structure" do
    main_case = {:okaysons, "Hello, boy", :even, "okay"}

    result =
      case main_case do
        {:okaysons, result} ->
          result

        {:okaysons, _, :even, result2} ->
          result2

        {:error} ->
          "oh uh"

        _ ->
          "default value"
      end

    assert result === "okay"
  end

  test "case structure with pattern matching" do
    pie = 3.14

    # The pin operator is a way to express that you want to
    # check the value of an existing variable rather than create a new binding in the pattern match.
    # pie is always gonna be true, since is rebouding the value of pie.
    # With the pin operator, the value of pie is gonna be 3.14, keeping the original value of the variable.
    pie_phrase =
      case "cherry pie" do
        ^pie -> "Not so tasty"
        pie -> "I must say, this #{pie}, is delicious!"
        _ -> "default"
      end

    assert pie_phrase === "I must say, this cherry pie, is delicious!"
  end

  test "case structure with guard clauses" do
    result =
      case {1, 2, 3} do
        {1, x, 3} when x > 0 ->
          "It's 1, 2, 3"

        _ ->
          "Default value"
      end

    assert result === "It's 1, 2, 3"
  end
end
