using Advent2020.Day17

input_path = joinpath(inputs_path, "day17.txt")

@testset "Day 17" begin
    @testset "Part 1 dev" begin
        s = [".#.",
            "..#",
            "###"]
        A = hcat((map(c -> (c == '#') ? 1 : 0, collect(i)) for i in s)...) |> permutedims .|> Bool
        @test sum(conway_nd(A, 3, 6)) == 112
    end

    @testset "Part 1" begin
        @test sum(conway_nd(input_path, 3, 6)) == 301
    end

    @testset "Part 2" begin
        @test sum(conway_nd(input_path, 4, 6)) == 2424
    end
end
