input_path = joinpath(@__DIR__, "../inputs/", "day02.txt")

function parse_line(l)
    a, b, c, p = match(r"(.*)-(.*) (.): (.*)", l).captures
    parse.(Int64, (a, b))..., c, p
end

# Part 1
input_path |> readlines .|> parse_line .|> (x -> x[1] <= count(x[3], x[4]) <= x[2]) |> sum |> println

# Part 2
input_path |> readlines .|> parse_line .|> (x -> xor(x[4][x[1]] == x[3][1], x[4][x[2]] == x[3][1])) |> sum |> println
