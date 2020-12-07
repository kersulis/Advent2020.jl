module Day02

export valid_count, valid_position

"How many instances of `char` are in `str`?"
function num_in_str(char::Char, str::AbstractString)
    return count(x -> x == char, str)
end

"Parse a string of the form `a-b`, where `a` and `b` are integers."
function parse_a_dash_b(a_dash_b::AbstractString)
    a, b = split(a_dash_b, "-")
    return parse(Int64, a), parse(Int64, b)
end

"Parse a string of the form `a-b char: passwd`"
function parse_input_line(input_line::String)
    a_dash_b, char, passwd = split(input_line)
    char = first(char)
    a, b = parse_a_dash_b(a_dash_b)
    return a, b, char, passwd
end

"Are there between `a` and `b` instances of `char` in `passwd`?"
function valid_count(input_line::String)
    l, u, char, passwd = parse_input_line(input_line)
    return (l <= num_in_str(char, passwd) <= u)
end

function valid_position(input_line::String)
    pos1, pos2, char, passwd = parse_input_line(input_line)

    return xor(passwd[pos1] == char, passwd[pos2] == char)
end

end # module
