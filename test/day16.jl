using Advent2020.Day16

input_path = joinpath(inputs_path, "day16.txt")

@testset "Day 16" begin
    @testset "Part 1" begin
        @test part1(input_path) == 25788
    end

    @testset "Part 2" begin
        @test part2(input_path) == 3902565915559
    end
end
