defmodule GildedRose.Item.Implementation.Sulfuras do
  @moduledoc false

  alias GildedRose.Item

  @behaviour GildedRose.Item.Implementation.Behaviour

  def update(%Item{} = item), do: item
end
