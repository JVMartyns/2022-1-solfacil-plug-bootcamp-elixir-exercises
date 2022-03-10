defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    # Please implement the daily_rate/1 function
    :erlang.float(hourly_rate * 8)
  end

  def apply_discount(before_discount, discount) do
    # Please implement the apply_discount/2 function
    before_discount - (before_discount/100 * discount)# = valor em porcentagem
  end

  def monthly_rate(hourly_rate, discount) do
    # Please implement the monthly_rate/2 function
    valor_mes = daily_rate(hourly_rate) * 22
    porcentagem = valor_mes/100 * discount
    ceil(valor_mes - porcentagem)
  end

  def days_in_budget(budget, hourly_rate, discount) do
    # Please implement the days_in_budget/3 function
    porcentagem = daily_rate(hourly_rate)/100 * discount
    Float.floor(budget / (daily_rate(hourly_rate) - porcentagem), 1)
  end
end
