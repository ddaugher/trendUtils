# trend_utils

## Description
This algorithm is weighted towards non-zero values and numbers in the series that are changing.  A value of zero
and numbers in sequence that are the same value, are given less weight in the calculation.  The algorithm will be a summing of result

* This algorithm, will expect a list of numbers... whole numbers and/or decimals.
* if the supplied list is empty , then the trend calculator should return a value of zero (0).
* if the list contains only a single value, then the trend calculator should return a value of zero (0).
* the resulting trend will always start with a value of zero (0).
* the first pair will contain the first two numbers in the list
* the second pair will contain the second and third number in the list (and so on, until the list is completely processed).
* the final pair, will be the last two numbers in the list.
* the order of the list will be determined by the original order passed to the calculator.  No additional sorting will be required.
* The following calculation will be applied to each pair.  Pairs will be denoted as [p1, p2]
```
if p1 equals zero and p2 > 0, the value for the pair will be 1.0
```
```
if p1 equals p2, the value for the pair will be 0.0
```
```
otherwise, the value for the pair will be (p2-p1)/p1.
```

The result of each pair calculation will be summed, returning the trend value.

## Installation

[Available in Hex](https://hex.pm/packages/trend_utils), the package can be installed
by adding `trend_utils` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:trend_utils, "~> 0.1.0"}
  ]
end
```
