using Advent2020.Day14

input_path = joinpath(inputs_path, "day14.txt")

@testset "Day 14" begin
    input = readlines(input_path)

    @testset "Part 1 dev" begin
        s = """mask = XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X
        mem[8] = 11
        mem[7] = 101
        mem[8] = 0"""
        lines = split(s, '\n')

        @test initialize(lines) == 165
    end

    @testset "Part 1" begin
        @test initialize(readlines(input_path)) == 14553106347726
    end

    @testset "Part 2" begin
        @test initialize2(readlines(input_path)) == 2737766154126
    end
end
