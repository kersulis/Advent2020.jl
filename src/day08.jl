module Day08

export run_instructions, identify_incorrect_instruction

function parse_instruction(instruction)
    cmd, num = split(instruction)
    return cmd, parse(Int64, num)
end

function run_instruction(line, acc, instructions)
    cmd, num = parse_instruction(instructions[line])
    next_line = (cmd == "nop" || cmd == "acc") ? line + 1 : line + num
    next_acc = (cmd == "acc") ? acc + num : acc
    return next_line, next_acc
end

"Return `acc, false` if infinite loop detected, `acc, true` otherwise."
function run_instructions(instructions; silent=true)
    executed_lines = []
    next_line = 1
    acc = 0

    while true
        line = next_line
        next_line, acc = run_instruction(line, acc, instructions)
        if next_line in executed_lines
            !silent && @info "Infinite loop detected; acc before = $acc"
            return acc, false
        end
        if next_line == length(instructions) + 1
            !silent && @info "Successfully terminated with acc = $acc"
            return acc, true
        end
        push!(executed_lines, line)
    end
end

function switch_nop_jmp(idx, instructions)
    instructions_changed = copy(instructions)
    cmd = instructions[idx][1:3]
    if cmd == "nop"
        instructions_changed[idx] = "jmp" * instructions[idx][4:end]
    elseif cmd == "jmp"
        instructions_changed[idx] = "nop" * instructions[idx][4:end]
    end
    return instructions_changed
end

function identify_incorrect_instruction(instructions)
    nop_jmp_idx = findall(line -> line[1:3] in ["nop", "jmp"], instructions)

    terminated = false # no successful termination
    for idx in nop_jmp_idx
        acc, terminated = run_instructions(switch_nop_jmp(idx, instructions))
        if terminated
            return acc, idx
        end
    end
end

end # module
