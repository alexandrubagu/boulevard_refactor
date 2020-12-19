defmodule GildedRose do
  @moduledoc false

  alias GildedRose.Item
  alias GildedRose.Item.Implementation

  defstruct items: []

  @type t :: %__MODULE__{
          items: [Item.t()]
        }

  @spec new([Item.t()]) :: t
  def new(items), do: %__MODULE__{items: items}

  @spec update_quality(t) :: [Item.t()]
  def update_quality(%__MODULE__{items: items}), do: Enum.map(items, &Implementation.update/1)
end
