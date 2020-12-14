using Advent2020.Day13

input_path = joinpath(inputs_path, "day13.txt")

@testset "Day 13" begin
    @testset "Part 1 dev" begin
        t = 939
        lines = [7, 13, 59, 31, 19]

        d, i = findmin(lines .- mod.(t, lines))
        @test d * lines[i] == 295
    end

    @testset "Part 1" begin
        t, lines, _ = parse_input(input_path)
        d, i = findmin(lines .- mod.(t, lines))
        @test d * lines[i] == 3246
    end

    @testset "Part 2 dev" begin
        lines = [17, 13, 19]
        delta = [0, 2, 3]
        @test earliest_timestamp(lines, delta) == 3417
    end

    @testset "Part 2" begin
        t, lines, delta = parse_input(input_path)
        @test earliest_timestamp(lines, delta) == 1010182346291467
    end
end
