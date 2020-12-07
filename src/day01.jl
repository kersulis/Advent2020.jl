module Day01

export two_that_sum_to_total, three_that_sum_to_total


"Given a vector of numbers, find two that sum to `total`"
function two_that_sum_to_total(total::Number, numbers::Vector)
    candidates = filter(x -> x in numbers, total .- numbers)
    isempty(candidates) && return (nothing, nothing)
    return candidates[1], candidates[2]
end


"Given a vector of numbers, find three that sum to `total`."
function three_that_sum_to_total(total::Number, numbers::Vector)
    for x in numbers
        y, z = two_that_sum_to_total(2020 - x, numbers)
        if !isnothing(y)
            return x, y, z
        end
    end
end

end # module
