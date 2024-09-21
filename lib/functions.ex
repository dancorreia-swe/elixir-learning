defmodule Functions do
  def hello(name), do: "Hello, " <> name

  def extract_person(%{name: person_name}) when is_number(person_name) do
    raise ArgumentError, "Name can't be a number"
  end

  @spec extract_person(%{:name => binary(), optional(any()) => any()}, any()) :: binary()
  def extract_person(%{name: person_name}, up \\ false) when is_binary(person_name) do
    if up do
      uppercase_name(person_name)
    else
      person_name
    end
  end

  defp uppercase_name(name) do
    String.upcase(name)
  end
end

defmodule Functions.Actions do
  def say_hello(name) do
    Functions.hello(name)
  end
end
