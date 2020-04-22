defmodule TrendUtils do
  @moduledoc """
  Documentation for `TrendUtils`.
  """

  @doc ~S"""

  ## Examples

      iex> TrendUtils.find_trend([])
      0.0

      iex> TrendUtils.find_trend([90.0])
      0.0

      iex> TrendUtils.find_trend([50.0, 50.0])
      0.0

      iex> TrendUtils.find_trend([20.0, 60.0, 110.0])
      2.8333333333333335

  """
  def find_trend([]), do: 0.0
  def find_trend([_]), do: 0.0
  def find_trend(list), do: accumulate_value(list)

  defp accumulate_value(list) do
    Enum.zip(list, tl(list))
    |> Enum.map(fn {left, right} -> calculate_tuple_value(left, right) end)
    |> Enum.sum
  end

  defp calculate_tuple_value(0.0, 0.0), do: 0.0
  defp calculate_tuple_value(0.0, _right), do: 1.0
  defp calculate_tuple_value(left, right), do: (right - left) / left
end
