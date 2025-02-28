defmodule Structs do
  defmodule User do
    @enforce_keys [:name]
    defstruct [:name, :age]
  end
end
