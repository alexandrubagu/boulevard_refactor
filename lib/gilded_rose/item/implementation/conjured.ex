defmodule GildedRose.Item.Implementation.Conjured do
  @moduledoc false

  alias GildedRose.Item

  def update(%Item{} = item) do
    item
    |> update_sell_in()
    |> update_quality()
  end

  defp update_sell_in(item), do: %{item | sell_in: item.sell_in - 1}

  defp update_quality(item) do
    item =
      case item do
        %{quality: quality} when quality > 0 -> %{item | quality: quality - 2}
        %{quality: quality} when quality < 50 -> %{item | quality: quality + 1}
      end

    if item.sell_in < 0 and item.quality > 0,
      do: %{item | quality: item.quality - 2},
      else: item
  end
end
