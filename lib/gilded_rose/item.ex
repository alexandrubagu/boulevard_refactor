defmodule GildedRose.Item do
  @moduledoc false

  @type t :: %__MODULE__{
          name: binary(),
          sell_in: integer(),
          quality: non_neg_integer()
        }

  defstruct [:name, :sell_in, :quality]

  @spec new(name :: binary(), sell_in :: integer(), quality :: non_neg_integer()) :: t()
  def new(name, sell_in, quality), do: %__MODULE__{name: name, sell_in: sell_in, quality: quality}
end
