using Advent2020.Day15

input_path = joinpath(inputs_path, "day15.txt")


@testset "Part 1" begin
    v = parse.(Int64, split(readline(input_path), ','))
    @test memory_game(v, 2020) == 639
end

@testset "Part 2" begin
    v = parse.(Int64, split(readline(input_path), ','))
    @test memory_game(v, 30000000) == 266
end
