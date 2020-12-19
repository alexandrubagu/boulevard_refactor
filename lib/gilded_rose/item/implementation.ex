defmodule GildedRose.Item.Implementation do
  @moduledoc false

  alias GildedRose.Item
  alias GildedRose.Item.Implementation.BackstagePasses
  alias GildedRose.Item.Implementation.AgedBrie
  alias GildedRose.Item.Implementation.Default

  @behaviour GildedRose.Item.Implementation.Behaviour

  def update(%Item{name: "Backstage passes" <> _} = item), do: BackstagePasses.update(item)
  def update(%Item{name: "Aged Brie" <> _} = item), do: AgedBrie.update(item)
  def update(%Item{} = item), do: Default.update(item)
end
