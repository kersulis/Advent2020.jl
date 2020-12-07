module Day05

export decode


function binary_partition(upper::Bool, x::UnitRange)
    m = round(Integer, length(x) / 2)
    return upper ? ((x[m] + 1):x[end]) : (x[1]:x[m])
end

function binary_partition(upper::Vector{Bool}, x::UnitRange)
    for u in upper
        x = binary_partition(u, x)
    end
    return x
end

function row(code::String, row_range::UnitRange=Int16(0):Int16(127))
    parts = [c == 'B' for c in code[1:7]]
    return binary_partition(parts, row_range) |> first
end

function col(code::String, col_range::UnitRange=Int16(0):Int16(7))
    parts = [c == 'R' for c in code[8:end]]
    return binary_partition(parts, col_range) |> first
end

id(r::Integer, c::Integer) = r * 8 + c

function decode(code::String)
    r = row(code)
    c = col(code)
    i = id(r, c)
    return r, c, i
end

end # module
