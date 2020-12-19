defmodule GildedRose.Item.Implementation.Behaviour do
  @moduledoc false

  alias GildedRose.Item

  @doc """
  Updates sell_in and quality after the day passes
  """
  @callback update(Item.t()) :: Item.t()
end
