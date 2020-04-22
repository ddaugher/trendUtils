defmodule Trendutils do
  @moduledoc """
  Documentation for `Trendutils`.
  """

  @doc ~S"""

  ## Examples

      iex> Trendutils.findTrend([])
      0.0

      iex> Trendutils.findTrend([90.0])
      0.0

      iex> Trendutils.findTrend([50.0, 50.0])
      0.0

      iex> Trendutils.findTrend([20.0, 60.0, 110.0])
      2.8333333333333335

  """
  def findTrend([]), do: 0.0
  def findTrend([_]), do: 0.0
  def findTrend(list), do: accumulateValue(list)

  defp accumulateValue(list) do
    Enum.zip(list, tl(list))
    |> Enum.map(fn {left, right} -> calculateTupleValue(left, right) end)
    |> Enum.sum
  end

  defp calculateTupleValue(left, right) do
    cond do
      left == 0.0 && right == 0.0 -> 0.0
      left == 0.0 && right > 0.0 -> 1.0
      true -> (right - left) / left
    end
  end
end
