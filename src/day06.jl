module Day06

using Advent2020.Day04: split_batch

export num_answered_by_any, num_answered_by_all

remove_space(v) = setdiff(v, ' ')

function num_answered_by_any(input)
    return input |> split_batch .|> unique .|> remove_space .|> length
end

function num_answered_by_all(input)
    return input |> split_batch .|> split .|> x -> intersect(x...) |> length
end

end # module
