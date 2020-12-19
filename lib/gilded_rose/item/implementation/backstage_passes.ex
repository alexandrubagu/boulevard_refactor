defmodule GildedRose.Item.Implementation.BackstagePasses do
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
    item = if item.quality < 50, do: %{item | quality: item.quality + 1}, else: item

    case item do
      %{sell_in: sell_in} when sell_in < 0 ->
        %{item | quality: 0}

      %{quality: quality, sell_in: sell_in} when quality < 50 and sell_in < 6 ->
        %{item | quality: quality + 2}

      %{quality: quality, sell_in: sell_in} when quality < 50 and sell_in < 11 ->
        %{item | quality: quality + 1}

      _ ->
        item
    end
  end
end
