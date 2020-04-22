defmodule TrendutilsTest do
  use ExUnit.Case
  doctest Trendutils

  test "should return zero when list is empty" do
    assert Trendutils.find_trend([]) == 0.0
  end

  test "should return zero when list of only one number" do
    assert Trendutils.find_trend([90.0]) == 0.0
  end

  test "should return 0.0 when list of two numbers equal to each other" do
    assert Trendutils.find_trend([50.0, 50.0]) == 0.0
  end

  test "should return proper percentage when list of two numbers increasing" do
    assert Trendutils.find_trend([90.0, 100.0]) == 0.1111111111111111
  end

  test "should return proper percentage when list of three numbers increasing" do
    assert Trendutils.find_trend([90.0, 100.0, 110.0]) == 0.2111111111111111
  end

  test "should return proper percentage when list of three different numbers increasing" do
    assert Trendutils.find_trend([20.0, 60.0, 110.0]) == 2.8333333333333335
  end

  test "should return proper value when list of four different numbers increasing" do
    assert Trendutils.find_trend([20.0, 60.0, 110.0, 150.0]) == 3.1969696969696972
  end

  test "should return proper value when list of two numbers decreasing" do
    assert Trendutils.find_trend([100.0, 90.0]) == -0.1
  end

  test "should return proper value when list of three numbers descreasing" do
    assert Trendutils.find_trend([110.0, 100.0, 90.0]) == -0.19090909090909092
  end

  test "should return proper value when first number is zero and second is positive" do
    assert Trendutils.find_trend([0.0, 50.0]) == 1.0
  end

  test "should return proper value when first number is zero and second number is zero" do
    assert Trendutils.find_trend([0.0, 0.0]) == 0.0
  end

  test "should return zero when both numbers are equal" do
    assert Trendutils.find_trend([10.0, 10.0]) == 0.0
  end

  test "should return proper value when first number is zero" do
    assert Trendutils.find_trend([0.0, 50.0, 60.0]) == 1.2
  end

  test "should return proper value when all zeroes" do
    assert Trendutils.find_trend([0.0, 0.0, 0.0]) == 0.0
  end

  test "should when fluxuation up and down" do
    assert Trendutils.find_trend([10.0, 20.0, 10.0]) == 0.5
  end

  test "should handle real world example" do
    assert Trendutils.find_trend([2556.0, 1160.0, 1050.0, 369.0]) == -1.2895648989723782
  end

  test "should handle another real world example" do
    assert Trendutils.find_trend([876.0, 920.0, 920.0, 920.0]) == 0.0502283105022831
  end

  test "should handle real world example 3" do
    assert Trendutils.find_trend([0.35530768392370576, 0.38223999999999997, 0.38223999999999997]) == 0.07579998208560361
  end
end
