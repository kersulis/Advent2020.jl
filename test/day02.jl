using Advent2020.Day2

input = readlines(joinpath(inputs_path, "day02.txt"))

@testset "Day 2" begin
    # Part 1 solution
    @test valid_count.(input) |> sum == 580

    # Part 2 solution
    @test valid_position.(input) |> sum == 611
end
