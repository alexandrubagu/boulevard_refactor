defmodule GildedRose.Item.Implementation do
  @moduledoc false

  alias GildedRose.Item
  alias GildedRose.Item.Implementation.Default

  @behaviour GildedRose.Item.Implementation.Behaviour

  def update(%Item{} = item), do: Default.update(item)
end
