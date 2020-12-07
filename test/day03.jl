using Advent2020.Day03

input_path = joinpath(inputs_path, "day03.txt")

@testset "Day 3" begin
    input = readlines(input_path)

    @testset "Part 1" begin
        # Part 1 solution
        @test slope_path(input, 3, 1) |> count_trees == 189
    end

    @testset "Part 2" begin
        # Part 2
        dxx = (1, 3, 5, 7, 1)
        dyy = (1, 1, 1, 1, 2)

        tree_prod = 1

        for (dx, dy) in zip(dxx, dyy)
            tree_prod *= slope_path(input, dx, dy) |> count_trees
        end
        @test tree_prod == 1718180100
    end
end
