defmodule Imports do
  import Hello

  def say do
    Hello.say()
  end
end
