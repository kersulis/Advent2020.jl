input_path = joinpath(@__DIR__, "../inputs/", "day01.txt")

ns = parse.(Int64, input_path |> readlines)
println(((i, j) for i in ns, j in ns if i + j == 2020) |> first |> prod)
println(((i, j, k) for i in ns, j in ns, k in ns if i + j + k == 2020) |> first |> prod)
