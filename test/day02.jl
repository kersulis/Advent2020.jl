using Advent2020.Day02

input_path = joinpath(inputs_path, "day02.txt")

@testset "Day 2" begin
    input = readlines(input_path)

    @testset "Part 1" begin
        # Part 1 solution
        @test valid_count.(input) |> sum == 580
    end

    @testset "Part 2" begin
        # Part 2 solution
        @test valid_position.(input) |> sum == 611
    end
end
