using Advent2020.Day07

input_path = joinpath(inputs_path, "day07.txt")

@testset "Day 7" begin
    rules = input_path |> readlines .|> parse_rule

    @testset "Part 1" begin
        @test length(can_contain_gold(rules)) == 233
    end

    @testset "Part 2 dev" begin
        s = """
        shiny gold bags contain 2 dark red bags.
        dark red bags contain 2 dark orange bags.
        dark orange bags contain 2 dark yellow bags.
        dark yellow bags contain 2 dark green bags.
        dark green bags contain 2 dark blue bags.
        dark blue bags contain 2 dark violet bags.
        dark violet bags contain no other bags."""

        rules = parse_rule.(split(s, "\n"))
        golden_rule = rule_lookup("shiny gold", rules)
        @test count_bags(golden_rule, rules) - 1 == 126
    end

    @testset "Part 2" begin
        rules = input_path |> readlines .|> parse_rule
        golden_rule = rule_lookup("shiny gold", rules)
        @test count_bags(golden_rule, rules) - 1 == 421550
    end
end
