module Day09

export find_bad, find_range

function find_bad(v::Vector, l::Integer)
    bad = zeros(Bool, length(v))
    for i in (l + 1):length(v)
        last5 = v[(i - l):(i - 1)]
        bad[i] = isempty((j, k) for j in last5, k in last5 if (j + k == v[i]) && j != k)
    end
    return v[findfirst(bad)]
end

function find_range(v::Vector, n::Number)
    for i in 2:length(v)
        x = [(j, i) for j in 1:(i - 1) if sum(v[j:i]) == n]
        !isempty(x) && return x[1]
    end
end

end # module
