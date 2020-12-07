module Day03

export slope_path, count_trees

function slope_path(input::Vector{String}, dx::Integer, dy::Integer)
    rows = input[1:dy:end]

    nrows = length(rows)
    row_length = length(input[1])

    xx = cumsum([1; fill(dx, nrows)])
    xx_wrap = mod1.(xx, row_length)

    path = (r[x] for (r, x) in zip(rows, xx_wrap))
end

count_trees(path) = count(x -> x == '#', path)

end # module
