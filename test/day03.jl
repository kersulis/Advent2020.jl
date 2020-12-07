using Advent2020.Day03

input = joinpath(inputs_path, "day03.txt") |> readlines

@testset "Day 3" begin
    # Part 1 solution
    @test slope_path(input, 3, 1) |> count_trees == 189

    # Part 2
    dxx = (1, 3, 5, 7, 1)
    dyy = (1, 1, 1, 1, 2)

    tree_prod = 1

    for (dx, dy) in zip(dxx, dyy)
        tree_prod *= slope_path(input, dx, dy) |> count_trees
    end
    @test tree_prod == 1718180100
end
