using Advent2020.Day04

input_path = joinpath(inputs_path, "day04.txt")

@testset "Day 4" begin
    input = readlines(input_path)

    @testset "Part 1" begin
        # Part 1 solution
        passports = parse_batch(input)
        @test has_required_fields.(passports) |> count == 239
    end

    @testset "Validation" begin
        @test Day04.valid_byr("2002")
        @test !Day04.valid_byr("2003")

        @test Day04.valid_hgt("60in")
        @test Day04.valid_hgt("190cm")
        @test !Day04.valid_hgt("190in")
        @test !Day04.valid_hgt("190")

        @test Day04.valid_hcl("#123abc")
        @test !Day04.valid_hcl("#123abz")
        @test !Day04.valid_hcl("123abc")

        @test Day04.valid_ecl("brn")
        @test !Day04.valid_ecl("wat")

        @test Day04.valid_pid("000000001")
        @test !Day04.valid_pid("0123456789")
    end

    @testset "Part 2" begin
        passports = parse_batch(input)
        @test filter(passport -> has_required_fields(passport) && has_valid_fields(passport), passports) |> length == 188
    end
end
