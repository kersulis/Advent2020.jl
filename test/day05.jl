using Advent2020.Day05

input_path = joinpath(inputs_path, "day05.txt")

@testset "Day 5" begin
    input = readlines(input_path)

    @testset "Given examples" begin
        @test decode("BFFFBBFRRR") == (70, 7, 567)
        @test decode("FFFBBBFRRR") == (14, 7, 119)
        @test decode("BBFFBBFRLL") == (102, 4, 820)
    end

    @testset "Part 1" begin
        ids = (x[end] for x in decode.(input))
        @test maximum(ids) == 896
    end

    @testset "Part 2" begin
        ids = (x[end] for x in decode.(input))
        id_first, id_last = minimum(ids), maximum(ids)
        @test setdiff(id_first:id_last, ids) |> first == 659
    end
end
