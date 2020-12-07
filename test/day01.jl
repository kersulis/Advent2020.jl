using Advent2020.Day1

input = parse.(Int64, readlines(joinpath(inputs_path, "day01.txt")))

@testset "Day 1" begin
    # Part 1 solution
    idx1, idx2 = two_that_sum_to_total(2020, input)
    @test input[idx1] * input[idx2] == 388075

    # Part 2 solution
    idx1, idx2, idx3 = three_that_sum_to_total(2020, input)
    @test input[idx1] * input[idx2] * input[idx3] == 293450526
end
