module Day11

export simulate_passengers, neighbors_los, simulate_los

function simulate_passengers(A::Matrix{Char})
    R = CartesianIndices(A)
    Ifirst, Ilast = first(R), last(R)
    I1 = oneunit(Ifirst)

    B = falses(size(A)) # initial state
    N = zeros(Int64, size(A)) # neighbors
    S = findall(A .!= '.') # seat indices

    Bpre = trues(size(A))
    while B != Bpre
        Bpre = copy(B)
        for I in S
            N[I] = sum((B[J] for J in max(Ifirst, I - I1):min(Ilast, I + I1))) - B[I]
        end
        for I in S
            N[I] == 0 && (B[I] = 1)
            N[I] >= 4 && (B[I] = 0)
        end
    end
    return B
end

function look(pos::Tuple{Int64, Int64}, dir::Tuple{Int64, Int64}, A)
    m, n = size(A)
    i, j = pos
    dx, dy = dir

    x, y = i + dx, j + dy
    sighted = []
    while (1 <= x <= m) & (1 <= y <= n)
        push!(sighted, A[x, y])
        x += dx
        y += dy
    end
    return sighted
end

function neighbor_los(v::Vector)
    out = false
    for c in v
        if c == 'L'
            return false
        elseif c == '#'
            return true
        end
    end
    return out
end

function neighbors_los(pos::Tuple{Int64, Int64}, A::Matrix{Char})
    d = (-1, 0, 1)
    directions = deleteat!(vec(collect(Iterators.product(d, d))), 5)
    rays = [look(pos, dir, A) for dir in directions]
    return sum(neighbor_los.(rays))
end

function simulate_los(A::Matrix{Char})
    B = copy(A) # initial state
    N = zeros(Int64, size(A)) # neighbors
    S = findall(A .!= '.') # seat indices

    m, n = size(A)

    Bpre = fill('.', m, n)
    while B != Bpre
        Bpre = copy(B)

        for I in S
            N[I] = neighbors_los(Tuple(I), B)
        end
        for I in S
            N[I] == 0 && (B[I] = '#')
            N[I] >= 5 && (B[I] = 'L')
        end
    end
    return B
end

end # module
