defmodule GildedRoseTest do
  use ExUnit.Case

  alias GildedRose.Item

  test "interface specification" do
    gilded_rose = GildedRose.new()
    [%Item{} | _] = GildedRose.items(gilded_rose)
    assert :ok == GildedRose.update_quality(gilded_rose)

    assert [
             %Item{name: "+5 Dexterity Vest", quality: 19, sell_in: 9},
             %Item{name: "Aged Brie", quality: 1, sell_in: 1},
             %Item{name: "Elixir of the Mongoose", quality: 6, sell_in: 4},
             %Item{name: "Sulfuras, Hand of Ragnaros", quality: 80, sell_in: 0},
             %Item{name: "Backstage passes to a TAFKAL80ETC concert", quality: 21, sell_in: 14},
             %Item{name: "Conjured Mana Cake", quality: 5, sell_in: 2}
           ] = GildedRose.items(gilded_rose)
  end
end
