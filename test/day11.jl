using Advent2020.Day11

input_path = joinpath(inputs_path, "day11.txt")

string2matrix(s) = hcat(map(l -> [c for c in l], split(s, '\n'))...) |> permutedims

path2matrix(path::String) = hcat(map(l -> [c for c in l], readlines(path))...) |> permutedims

@testset "Day 11" begin
    @testset "Part 1 dev" begin
        s = """L.LL.LL.LL
        LLLLLLL.LL
        L.L.L..L..
        LLLL.LL.LL
        L.LL.LL.LL
        L.LLLLL.LL
        ..L.L.....
        LLLLLLLLLL
        L.LLLLLL.L
        L.LLLLL.LL"""

        A = string2matrix(s)

        @test simulate_passengers(A) |> sum == 37
    end

    @testset "Part 1" begin
        A = path2matrix(input_path)

        @test simulate_passengers(A) |> sum == 2113
    end

    @testset "Part 2 dev" begin
        s = """.......#.
        ...#.....
        .#.......
        .........
        ..#L....#
        ....#....
        .........
        #........
        ...#....."""

        A = string2matrix(s)

        @test neighbors_los((5, 4), A) == 8

        s = """.............
        .L.L.#.#.#.#.
        ............."""

        A = string2matrix(s)

        @test neighbors_los((2, 2), A) == 0

        s = """.##.##.
        #.#.#.#
        ##...##
        ...L...
        ##...##
        #.#.#.#
        .##.##."""

        A = string2matrix(s)

        @test neighbors_los((4, 4), A) == 0

        s = """L.LL.LL.LL
        LLLLLLL.LL
        L.L.L..L..
        LLLL.LL.LL
        L.LL.LL.LL
        L.LLLLL.LL
        ..L.L.....
        LLLLLLLLLL
        L.LLLLLL.L
        L.LLLLL.LL"""

        A = string2matrix(s)

        @test count(simulate_los(A) .== '#') == 26
    end

    @testset "Part 2" begin
        A = path2matrix(input_path)
        @test count(simulate_los(A) .== '#') == 1865
    end
end
