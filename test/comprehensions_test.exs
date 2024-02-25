defmodule ComprehensionsTest do
  use ExUnit.Case

  test "it should iterate through a list" do
    list = [1, 2, 3, 4, 5]
    list = for x <- list, do: x * 2

    assert [2, 4, 6, 8, 10] === list
  end

  test "it should iterate through a tuple" do
    keyword_list = [ok: "hello", error: "Unknow error", ok: "world"]
    ok_list = for {:ok, val} <- keyword_list, do: val

    assert ["hello", "world"] === ok_list
  end

  test "nested generators" do
    list = [1, 2, 3]

    stars_list =
      for n <- list, times <- 1..n do
        String.duplicate("*", times)
      end

    assert ["*", "*", "**", "*", "**", "***"] == stars_list
  end

  test "filter generator" do
    import Integer

    even_numbers = for x <- 1..10, is_even(x), do: x

    assert [2, 4, 6, 8, 10] = even_numbers

    even_divide_by_3 = for x <- 1..60, is_even(x), rem(x, 3) == 0, do: x

    assert [6, 12, 18, 24, 30, 36, 42, 48, 54, 60] == even_divide_by_3
  end

  test "into generator comprehesions" do
    import Integer

    map_keys = for {k, v} <- [one: 1, two: 2, three: 3, four: 4], into: %{}, do: {k, v}

    assert %{one: 1, two: 2, three: 3, four: 4} == map_keys
  end
end
