defmodule TrendutilsTest do
  use ExUnit.Case
  doctest Trendutils

  test "should return null when list is empty" do
    assert Trendutils.findTrend() == []
  end
end

