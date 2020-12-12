input_path = joinpath(@__DIR__, "../inputs/", "day03.txt")

lines = input_path |> readlines

ll = lines |> first |> length
nl = lines |> length

coords(dx, dy, ll, nl) = zip(mod1.(1:dx:(dx * nl), ll), 1:dy:nl)

trees(dx, dy) = count("#", join(string.(lines[x[2]][x[1]] for x in coords(dx, dy, ll, nl))))

# Part 1
trees(3, 1) |> println

# Part 2
map(trees, [1, 3, 5, 7, 1], [1, 1, 1, 1, 2]) |> prod |> println
