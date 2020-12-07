# Advent2020.jl

Julia solutions to the [2020 Advent of Code](https://adventofcode.com/2020).

## Installing

At the REPL:
```julia
]dev https://github.com/kersulis/Advent2020.jl
```

Using `Pkg`:

```julia
using Pkg
Pkg.develop(url="https://github.com/kersulis/Advent2020.jl")
```

## Testing

At the REPL:

```julia
]test Advent2020
```

Using `Pkg`:
```julia
using Pkg
Pkg.test("Advent2020")
```

## Organization

Each day's module exports the function(s) needed to produce that day's solution. Using day 1 as an example:

```julia
using Advent2020.Day1

input = readlines("inputs/day01.txt")

numbers = parse.(Int64, input)

# Part 1 solution
x, y = two_that_sum_to_total(2020, numbers)
println(x * y) # 388075

# Part 2 solution
x, y, z = three_that_sum_to_total(2020, numbers)
println(x * y * z) # 293450526
```

See `test/` for code snippets which produce solutions for the other days.
