defmodule StringsTest do
  use ExUnit.Case

  test "binaries to string" do
    string = <<104, 101, 108, 108, 111>>

    assert string = "hello"
  end

  test "utf-8 capabilites" do
    strange_hello = ~c"hełło"

    assert strange_hello == [104, 101, 322, 322, 111]
    assert ?Z == 90
  end
end
