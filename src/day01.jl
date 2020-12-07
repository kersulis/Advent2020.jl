module Day1

export two_that_sum_to_total, three_that_sum_to_total

"Given an `input` vector of numbers, find two that sum to `total`"
function two_that_sum_to_total(total::Number, input::Vector)
    idx1 = [x in input for x in total .- input] |> findfirst

    isnothing(idx1) && return (0, 0)

    idx2 = findfirst(input .== total - input[idx1])

    return idx1, idx2
end

"Given an `input` vector of numbers, find three that sum to `total`."
function three_that_sum_to_total(total::Number, input::Vector)
    idx2, idx3 = 0, 0
    for idx1 in 1:length(input)
        idx2, idx3 = two_that_sum_to_total(2020 - input[idx1], input)
        if idx2 != 0
            return idx1, idx2, idx3
        end
    end
end

end # module
