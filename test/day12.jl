using Advent2020.Day12

input_path = joinpath(inputs_path, "day12.txt")

@testset "Day 12" begin
    @testset "Part 1" begin
        instructions = readlines(input_path)
        pos = navigate(instructions)
        @test abs(real(pos)) + abs(imag(pos)) == 2879
    end

    @testset "Part 2" begin
        instructions = readlines(input_path)
        pos = navigate2(instructions)
        abs(real(pos)) + abs(imag(pos)) == 178986
    end
end
