module Day13

export parse_input, earliest_timestamp

check(n, lines, delta) = all((mod(n + d, l) == 0) for (l, d) in zip(lines, delta))

function parse_input(input_path)
    t, l = readlines(input_path)

    t = parse(Int64, t)

    lines = []
    delta = []
    for (i, li) in enumerate(split(l, ','))
        try
            push!(lines, parse(Int64, li))
            push!(delta, i - 1)
        catch
        end
    end
    return t, lines, delta
end

function earliest_timestamp(lines, delta)
    n = lines[1]
    increment = lines[1]
    for i in 2:length(lines)
        l, d = lines[i], delta[i]
        while !check(n, lines[1:i], delta[1:i])
            n += increment
        end
        increment = lcm(lines[1:i]...)
    end
    return n
end

end # module
