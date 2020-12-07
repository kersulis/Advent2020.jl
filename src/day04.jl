module Day04

export parse_batch, has_required_fields, has_valid_fields


function split_batch(input::Vector{String})
    passports_str = []
    passport_str = ""
    for line in input
        if line != ""
            passport_str *= line * " "
        else
            push!(passports_str, passport_str[1:(end - 1)])
            passport_str = ""
        end
    end

    # append last passport
    push!(passports_str, passport_str[1:(end - 1)])
    return passports_str
end


function parse_passport_str(passport_str::String)
    passport = Dict()
    for kv_str in split(passport_str)
        k, v = split(kv_str, ':')
        passport[k] = v
    end
    return passport
end

"Return one Dict per passport"
function parse_batch(input::Vector{String})
    passports_str = split_batch(input)
    return parse_passport_str.(passports_str)
end


"""
A valid passport must have all of the following:

- `byr` (Birth Year)
- `iyr` (Issue Year)
- `eyr` (Expiration Year)
- `hgt` (Height)
- `hcl` (Hair Color)
- `ecl` (Eye Color)
- `pid` (Passport ID)
- `cid` (Country ID)

`cid` is optional.
"""
function has_required_fields(passport::Dict)
    required_fields = [
        "byr",
        "iyr",
        "eyr",
        "hgt",
        "hcl",
        "ecl",
        "pid",
        # "cid"
    ]

    return prod((field in keys(passport) for field in required_fields))
end


function valid_byr(byr::AbstractString)
    try
        @assert length(byr) == 4
        @assert parse(Int64, byr) in 1920:2002
    catch
        return false
    end
    return true
end
valid_byr(p::Dict) = valid_byr(p["byr"])

function valid_iyr(iyr::AbstractString)
    try
        @assert length(iyr) == 4
        @assert parse(Int64, iyr) in 2010:2020
    catch
        return false
    end
    return true
end
valid_iyr(p::Dict) = valid_iyr(p["iyr"])

function valid_eyr(eyr::AbstractString)
    try
        @assert length(eyr) == 4
        @assert parse(Int64, eyr) in 2020:2030
    catch
        return false
    end
    return true
end
valid_eyr(p::Dict) = valid_eyr(p["eyr"])

function valid_hgt(hgt::AbstractString)
    try
        @assert length(hgt) > 2
        num = parse(Int64, hgt[1:(end - 2)])
        unit = hgt[(end - 1):end]

        if unit == "cm"
            @assert 150 <= num <= 193
        elseif unit == "in"
            @assert 59 <= num <= 76
        else
            return false
        end
    catch
        return false
    end
    return true
end
valid_hgt(p::Dict) = valid_hgt(p["hgt"])

function valid_hcl(hcl::AbstractString)
    try
        @assert first(hcl) == '#'
        for c in hcl[2:end]
            @assert c in 'a':'f' || c in '0':'9'
        end
    catch
        return false
    end
    return true
end
valid_hcl(p::Dict) = valid_hcl(p["hcl"])

function valid_ecl(ecl::AbstractString)
    try
        @assert ecl in ("amb", "blu", "brn", "gry", "grn", "hzl", "oth")
    catch
        return false
    end
    return true
end
valid_ecl(p::Dict) = valid_ecl(p["ecl"])

function valid_pid(pid::AbstractString)
    try
        @assert length(pid) == 9
        for c in pid
            @assert c in '0':'9'
        end
    catch
        return false
    end
    return true
end
valid_pid(p::Dict) = valid_pid(p["pid"])

function has_valid_fields(passport::Dict)
    try
        @assert valid_byr(passport)
        @assert valid_iyr(passport)
        @assert valid_eyr(passport)
        @assert valid_hgt(passport)
        @assert valid_hcl(passport)
        @assert valid_ecl(passport)
        @assert valid_pid(passport)
    catch
        return false
    end
    return true
end

end # module
