module Day07

export parse_rule, can_contain_gold, rule_lookup, count_bags

struct Rule
    color::String
    contents::Dict
end

get_color(r::Rule) = r.color
get_contents(r::Rule) = r.contents

function parse_rule(rule::AbstractString)
    color, contents = split(rule, " bags contain ")

    if occursin("no other bags", contents)
        return Rule(color, Dict())
    end

    contents = split(contents, ",")
    return Rule(color, parse_rule_contents(contents))
end

"Remove 'bags' and extra spaces."
isolate_count_color(s::AbstractString) = match(r"(\d.*) bag", s).captures |> first

"""
Given everything after " bags contain ", return a vector of (count, color)
tuples.
"""
function parse_rule_contents(contents::Vector)
    cc = (isolate_count_color.(c) for c in contents)
    return Dict(((x[1], x[2]) for x in parse_count_color.(cc)))
end

"""
Given a string like "4 dark green", return `(4, "dark green")``.
"""
function parse_count_color(s::AbstractString)
    i = findfirst(' ', s)
    n = parse(Int64, s[1:(i - 1)])
    c = s[(i + 1):end]
    return c, n
end

"`true` if Rule `r` indicates the bag can hold `c`-colored bags."
function can_contain(c::String, r::Rule)
    return c in keys(get_contents(r))
end

"Part 1: how many bags can hold shiny gold bags?"
function can_contain_gold(rules::Vector{Rule})

    # initialize set with shiny gold
    s = ["shiny gold"]
    n = 0

    # expand set
    while length(s) != n # stop when set stops expanding
        n = length(s) # update set size

        # add colors which can contain those already in the set
        for r in rules
            for c in s
                if can_contain(c, r)
                    s = union(s, [get_color(r)])
                end
            end
        end
    end

    # last step: remove shiny gold
    return setdiff(s, ["shiny gold"])
end

"Look up rule for given color."
function rule_lookup(c::AbstractString, rules::Vector{Rule})
    return filter(r -> get_color(r) == c, rules) |> first
end

"Recursive function for counting total number of bags."
function count_bags(rule::Rule, rules::Vector{Rule})
    bags = 1 # represents current bag
    for (c, q) in get_contents(rule)
        r = rule_lookup(c, rules)
        bags += q * count_bags(r, rules)
    end
    return bags
end

end # module
