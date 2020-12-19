defmodule GildedRose.Item.Implementation.AgedBrie do
  @moduledoc false

  alias GildedRose.Item

  @behaviour GildedRose.Item.Implementation.Behaviour

  def update(%Item{} = item) do
    item
    |> update_sell_in()
    |> update_quality()
  end

  defp update_sell_in(item), do: %{item | sell_in: item.sell_in - 1}

  defp update_quality(item) do
    item =
      case item do
        %{quality: quality} when quality < 50 -> %{item | quality: quality + 1}
        _ -> item
      end

    if item.sell_in < 0 and item.quality < 0,
      do: %{item | quality: item.quality + 1},
      else: item
  end
end
