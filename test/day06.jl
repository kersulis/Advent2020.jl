using Advent2020.Day06

input_path = joinpath(inputs_path, "day06.txt")

@testset "Day 6" begin
    input = input_path |> readlines

    @testset "Part 1" begin
        @test num_answered_by_any(input) |> sum == 6259
    end

    @testset "Part 2" begin
        @test num_answered_by_all(input) |> sum == 3178
    end
end
