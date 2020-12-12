using Advent2020.Day10

input_path = joinpath(inputs_path, "day10.txt")

@testset "Part 1" begin
    input = parse.(Int64, readlines(input_path))
    d = [diff(sort([input; 0])); 3]
    @test sum(d .== 1) * sum(d .== 3) == 1890
end

@testset "Part 2" begin
    input = parse.(Int64, readlines(input_path))
    v = [sort([input; 0]); maximum(input) + 3]
    d = diff(v)
    @test combos.(diff([0; findall(d .== 3)]) .- 1) |> prod == 49607173328384
end
