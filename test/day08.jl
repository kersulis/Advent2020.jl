using Advent2020.Day08

input_path = joinpath(inputs_path, "day08.txt")

@testset "Day 8" begin
    @testset "Part 1 dev" begin
        s = """
        nop +0
        acc +1
        jmp +4
        acc +3
        jmp -3
        acc -99
        acc +1
        jmp -4
        acc +6"""
        instructions = split(s, "\n")
        @test run_instructions(instructions) == (5, false)
    end

    @testset "Part 1" begin
        input_path = joinpath(inputs_path, "day08.txt")
        instructions = readlines(input_path)
        @test run_instructions(instructions) == (1489, false)
    end

    @testset "Part 2 dev" begin
        s = """
        nop +0
        acc +1
        jmp +4
        acc +3
        jmp -3
        acc -99
        acc +1
        jmp -4
        acc +6"""
        instructions = split(s, "\n")

        @test identify_incorrect_instruction(instructions) == (8, 8)
    end

    @testset "Part 2" begin
        instructions = readlines(input_path)
        @test identify_incorrect_instruction(instructions) == (1539, 395)
    end
end
