module Day16

export part1, part2

function parse_input(input_path::String)
    input = readlines(input_path)
    s1, s2 = findall(l -> l == "", input)

    rules = input[1:(s1 - 1)]
    ticket = input[(s1 + 2):(s2 - 1)] |> first
    nearby = input[(s2 + 2):end]

    return rules, ticket, nearby
end

function parse_rule(rule::AbstractString)
    field, a, b, c, d = match(r"(.*): (.*)-(.*) or (.*)-(.*)", rule).captures
    a, b, c, d = parse.(Int64, (a, b, c, d))
    return field, x -> (a <= x <= b) || (c <= x <= d)
end

parse_ticket(ticket::AbstractString) = parse.(Int64, split(ticket, ','))

validate(n::Integer, rules_dict) = any((check(n) for (field, check) in rules_dict))

function find_invalid(nearby, rules_dict)
    invalid_numbers = []
    invalid_tickets = []
    for (i, ticket) in enumerate(nearby)
        v = parse_ticket(ticket)
        for n in v
            if !validate(n, rules_dict)
                push!(invalid_numbers, n)
                push!(invalid_tickets, i)
            end
        end
    end
    return invalid_numbers, invalid_tickets
end


function part1(input_path)
    rules, ticket, nearby = parse_input(input_path)
    rules_dict = Dict((parse_rule(rule) for rule in rules))
    invalid_numbers, invalid_tickets = find_invalid(nearby, rules_dict)
    return sum(invalid_numbers)
end

function remove_position(pos::Integer, d::Dict)
    for (field, v) in d
        d[field] = setdiff(v, pos)
    end
end

function part2(input_path)
    rules, ticket, nearby = parse_input(input_path)
    ticket_parsed = parse_ticket(ticket)
    rules_dict = Dict((parse_rule(rule) for rule in rules))
    invalid_numbers, invalid_tickets = find_invalid(nearby, rules_dict)

    valid_tickets = setdiff(1:length(nearby), invalid_tickets)
    nearby_valid = nearby[valid_tickets]
    nearby_valid_parsed = [parse_ticket(ticket) for ticket in nearby_valid]

    potential_positions_dict = Dict{String, Vector{Int64}}()
    for (field, check) in rules_dict
        potential_positions = []
        for i in 1:length(parse_ticket(ticket))
            ns = [v[i] for v in nearby_valid_parsed]
            if all((check(n) for n in ns))
                push!(potential_positions, i)
            end
        end
        potential_positions_dict[field] = potential_positions
    end

    pos_final = Dict{String, Int64}()
    while length(keys(pos_final)) < length(keys(potential_positions_dict))
        for (field, potential_positions) in potential_positions_dict
            if length(potential_positions) == 1
                pos = potential_positions |> first
                pos_final[field] = pos
                remove_position(pos, potential_positions_dict)
            end
        end
    end


    out = 1
    for (field, pos) in pos_final
        if occursin("departure", field)
            out *= ticket_parsed[pos]
        end
    end
    return out
end

end # module
