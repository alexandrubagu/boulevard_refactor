defmodule GildedRose do
  @moduledoc false

  alias GildedRose.Item

  defstruct items: []

  @type t :: %__MODULE__{
          items: [Item.t()]
        }

  @spec new([Item.t()]) :: t
  def new(items), do: %__MODULE__{items: items}

  @spec update_quality(t) :: [Item.t()]
  def update_quality(%__MODULE__{items: items}) do
    for item <- items do
      item =
        cond do
          item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert" ->
            if item.quality > 0 do
              if item.name != "Sulfuras, Hand of Ragnaros" do
                %{item | quality: item.quality - 1}
              else
                item
              end
            else
              item
            end

          true ->
            cond do
              item.quality < 50 ->
                item = %{item | quality: item.quality + 1}

                cond do
                  item.name == "Backstage passes to a TAFKAL80ETC concert" ->
                    item =
                      cond do
                        item.sell_in < 11 ->
                          cond do
                            item.quality < 50 ->
                              %{item | quality: item.quality + 1}

                            true ->
                              item
                          end

                        true ->
                          item
                      end

                    cond do
                      item.sell_in < 6 ->
                        cond do
                          item.quality < 50 ->
                            %{item | quality: item.quality + 1}

                          true ->
                            item
                        end

                      true ->
                        item
                    end

                  true ->
                    item
                end

              true ->
                item
            end
        end

      item =
        cond do
          item.name != "Sulfuras, Hand of Ragnaros" ->
            %{item | sell_in: item.sell_in - 1}

          true ->
            item
        end

      cond do
        item.sell_in < 0 ->
          cond do
            item.name != "Aged Brie" ->
              cond do
                item.name != "Backstage passes to a TAFKAL80ETC concert" ->
                  cond do
                    item.quality > 0 ->
                      cond do
                        item.name != "Sulfuras, Hand of Ragnaros" ->
                          %{item | quality: item.quality - 1}

                        true ->
                          item
                      end

                    true ->
                      item
                  end

                true ->
                  %{item | quality: item.quality - item.quality}
              end

            true ->
              cond do
                item.quality < 50 ->
                  %{item | quality: item.quality + 1}

                true ->
                  item
              end
          end

        true ->
          item
      end
    end
  end
end
