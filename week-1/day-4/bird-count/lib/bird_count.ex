defmodule BirdCount do
  # Please implement the today/1 function
  def today([]), do: nil

  # Please implement the today/1 function
  def today(list), do: hd(list)

  # Please implement the increment_day_count/1 function
  def increment_day_count([]), do: [1]

  # Please implement the increment_day_count/1 function
  def increment_day_count(list), do: [hd(list) + 1] ++ tl(list)

  # Please implement the has_day_without_birds?/1 function
  def has_day_without_birds?(list), do: 0 in list

  # Please implement the total/1 function
  def total(list), do: Enum.sum(list)

  # Please implement the busy_days/1 function
  def busy_days(list) do
    Enum.count(list, fn number -> number > 4 end)
  end
end
