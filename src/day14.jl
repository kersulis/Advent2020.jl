module Day14

export initialize, initialize2

function base10(value, base=2)
    return sum([value[k] * base^(k - 1) for k in 1:length(value)])
end

function apply_mask(value, mask)
    v = copy(value)
    v[findall([c == '1' for c in reverse(mask)])] .= 1
    v[findall([c == '0' for c in reverse(mask)])] .= 0
    return v
end

function initialize(lines)
    mask = join(fill('0', 36))
    mem = Dict()
    for line in lines
        if line[1:4] == "mask"
            mask = match(r"mask = (.*)", line).captures[1]
        else
            addr, value = match(r"mem\[(.*)\] = (.*)", line).captures
            addr = parse(Int64, addr)
            value = digits(parse(Int64, value); base=2, pad=36)
            mem[addr] = apply_mask(value, mask)
        end
    end

    n = 0
    for (k, v) in mem
        n += base10(v)
    end
    return n
end

function apply_mask_addr(addr, mask)
    a = digits(addr; base=2, pad=36)
    a[findall([c == '1' for c in reverse(mask)])] .= 1

    xpos = findall([c == 'X' for c in reverse(mask)])
    combos = digits.(0:(2^length(xpos) - 1); base=2, pad=length(xpos))
    addrs = []
    for c in combos
        b = copy(a)
        b[xpos] .= c
        push!(addrs, b)
    end
    return addrs
end

function initialize2(lines)
    mask = join(fill('0', 36))
    mem = Dict()
    for line in lines
        if line[1:4] == "mask"
            mask = match(r"mask = (.*)", line).captures[1]
        else
            addr, value = match(r"mem\[(.*)\] = (.*)", line).captures
            addr = parse(Int64, addr)
            value = parse(Int64, value) # digits(parse(Int64, value); base=2, pad=36)
            addrs = apply_mask_addr(addr, mask)
            for addr in addrs
                mem[addr] = value
            end
        end
    end

    n = 0
    for (k, v) in mem
        n += base10(v)
    end
    return n
end

end # module
