defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    # Please implement the get_volume/1 function
    {_, vol} = volume_pair
    vol
  end

  def to_milliliter(volume_pair) do
    # Please implement the to_milliliter/1 functions
    {vol, val} = volume_pair

    cond do
      vol == :milliliter -> {:milliliter, val}
      vol == :cup -> {:milliliter, val * 240}
      vol == :fluid_ounce -> {:milliliter, val * 30}
      vol == :teaspoon -> {:milliliter, val * 5}
      vol == :tablespoon -> {:milliliter, val * 15}
    end
  end

  def from_milliliter(volume_pair, unit) do
    # Please implement the from_milliliter/2 functions
    {:milliliter, val} = volume_pair
    cond do
      unit == :milliliter -> {unit, val}
      unit == :cup -> {unit, val / 240}
      unit == :fluid_ounce -> {unit, val / 30}
      unit == :teaspoon -> {unit, val / 5}
      unit == :tablespoon -> {unit, val / 15}
    end
  end

  def convert(volume_pair, unit) do
    # Please implement the convert/2 function
    volume_pair
    |> to_milliliter()
    |> from_milliliter(unit)
  end
end
