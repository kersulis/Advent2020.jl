using Advent2020.Day01

input_path = joinpath(inputs_path, "day01.txt")

@testset "Day 1" begin
    input = readlines(input_path)

    numbers = parse.(Int64, input)

    @testset "Part 1" begin
        # Part 1 solution
        x, y = two_that_sum_to_total(2020, numbers)
        @test x * y == 388075
    end

    @testset "Part 2" begin
        # Part 2 solution
        x, y, z = three_that_sum_to_total(2020, numbers)
        @test x * y * z == 293450526
    end
end
