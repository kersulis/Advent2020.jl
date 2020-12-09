using Advent2020.Day09

input_path = joinpath(inputs_path, "day09.txt")

@testset "Day 9" begin
    @testset "Part 1 dev" begin
        s = """
        35
        20
        15
        25
        47
        40
        62
        55
        65
        95
        102
        117
        150
        182
        127
        219
        299
        277
        309
        576"""

        v = parse.(Int64, split(s, '\n'))
        @test find_bad(v, 5) == 127
    end

    @testset "Part 1" begin
        v = parse.(Int64, readlines(input_path))
        @test find_bad(v, 25) == 85848519
    end

    @testset "Part 2 dev" begin
        s = """
        35
        20
        15
        25
        47
        40
        62
        55
        65
        95
        102
        117
        150
        182
        127
        219
        299
        277
        309
        576"""

        v = parse.(Int64, split(s, '\n'))
        n = find_bad(v, 5)
        i, j = find_range(v, n)
        @test v[i] == 15 && v[j] == 40
    end

    @testset "Part 2" begin
        v = parse.(Int64, readlines(input_path))
        n = find_bad(v, 25)
        i, j = find_range(v, n)
        @test v[i:j] |> extrema |> sum == 13414198
    end
end
