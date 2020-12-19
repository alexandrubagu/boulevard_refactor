defmodule GildedRoseTest do
  use ExUnit.Case

  alias GildedRose.Item

  @items [
    Item.new("+5 Dexterity Vest", 10, 20),
    Item.new("Aged Brie", 2, 0),
    Item.new("Elixir of the Mongoose", 5, 7),
    Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
    Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
    Item.new("Conjured Mana Cake", 3, 6)
  ]

  test "interface specification" do
    gilded_rose = GildedRose.new(@items)

    assert [
             %Item{name: "+5 Dexterity Vest", quality: 19, sell_in: 9},
             %Item{name: "Aged Brie", quality: 1, sell_in: 1},
             %Item{name: "Elixir of the Mongoose", quality: 6, sell_in: 4},
             %Item{name: "Sulfuras, Hand of Ragnaros", quality: 80, sell_in: 0},
             %Item{name: "Backstage passes to a TAFKAL80ETC concert", quality: 21, sell_in: 14},
             %Item{name: "Conjured Mana Cake", quality: 4, sell_in: 2}
           ] = GildedRose.update_quality(gilded_rose)
  end
end
