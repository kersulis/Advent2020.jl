module Day12

export navigate, navigate2

const d_dir = Dict(
'E' => 1,
'W' => -1,
'N' => 1im,
'S' => -1im
)

const d_rot = Dict(
90 => 1im,
180 => -1,
270 => -1im
)

function navigate(instructions)
    dir = d_dir['E']
    pos = 0
    for i in instructions
        c, n = i[1], parse(Int64, i[2:end])

        if c == 'L'
            dir *= d_rot[n]
        elseif c == 'R'
            dir *= conj(d_rot[n])
        elseif c == 'F'
            pos += dir * n
        else
            pos += d_dir[c] * n
        end
    end
    return pos
end

function navigate2(instructions)
    wp = 10 + 1im
    pos = 0
    for i in instructions
        c, n = i[1], parse(Int64, i[2:end])

        if c == 'L'
            wp *= d_rot[n]
        elseif c == 'R'
            wp *= conj(d_rot[n])
        elseif c == 'F'
            pos += wp * n
        else
            wp += d_dir[c] * n
        end
    end
    return pos
end

end # module
