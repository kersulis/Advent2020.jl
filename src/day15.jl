module Day15

export memory_game

function memory_game(v::Vector{Int64}, turns::Int64)
    d = Dict(((vi, [i]) for (vi, i) in zip(v, 1:length(v))))

    spoken = copy(v)
    turn = length(v)
    while length(spoken) < turns
        turn += 1
        last_spoken = last(spoken)

        if length(d[last_spoken]) == 1
            create_or_append(d, 0, turn)
            push!(spoken, 0)
        else
            age = d[last_spoken][end] - d[last_spoken][end - 1]
            push!(spoken, age)
            create_or_append(d, age, turn)
        end
    end
    return spoken |> last
end

function create_or_append(d::Dict, k, v)
    if !(k in keys(d))
        d[k] = [v]
    else
        push!(d[k], v)
    end
    return d
end

end # module
