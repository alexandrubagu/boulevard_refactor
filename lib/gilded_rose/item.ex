defmodule GildedRose.Item do
  @moduledoc false

  defstruct name: nil, sell_in: nil, quality: nil

  @type t :: %__MODULE__{
          name: binary(),
          sell_in: integer(),
          quality: non_neg_integer()
        }

  def new(name, sell_in, quality) do
    %__MODULE__{name: name, sell_in: sell_in, quality: quality}
  end
end
