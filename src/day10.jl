module Day10

export combos

function combos(consec_ones)
    (consec_ones == 0) && return 1
    (consec_ones == 1) && return 1
    (consec_ones == 2) && return 2
    (consec_ones == 3) && return 4
    (consec_ones == 4) && return 7
end

end # module
