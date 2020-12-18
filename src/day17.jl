module Day17

export conway_nd

function parse_input(input_path::String)
    input = readlines(input_path)
    return hcat((map(c -> (c == '#') ? 1 : 0, collect(i)) for i in input)...) |> permutedims .|> Bool
end

function conway_nd(A::BitArray, ndim::Integer, ncycles::Integer)
    m, n = size(A)
    platform_shape = (size(A)..., ones(Int64, ndim - ndims(A))...)
    B = zeros(Bool, platform_shape .+ 2 * ncycles)

    idx_start = fill(1 + ncycles, ndim)
    idx_platform = (UnitRange(x...) for x in zip(idx_start, platform_shape .+ ncycles))

    B[idx_platform...] = A

    R = CartesianIndices(B)
    Ifirst, Ilast = first(R), last(R)
    I1 = oneunit(Ifirst)

    C = copy(B)
    for cycle in 1:ncycles
        for I in R
            n = sum((B[J]) for J in max(Ifirst, I - I1):min(Ilast, I + I1)) - B[I]

            (!(B[I] && (n == 2 || n == 3))) && (C[I] = false)
            (!B[I] && (n == 3)) && (C[I] = true)
        end
        B = copy(C)
    end
    return B
end

conway_nd(input_path::String, ndim::Integer, ncycles::Integer) = conway_nd(parse_input(input_path), ndim, ncycles)

end # module
