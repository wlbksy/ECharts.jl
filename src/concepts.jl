set_data(d::Dict) = false


# macro to simplify concept declaration

const _supported_concept_symbols = Set(
    :data)

function _concept_set(d::Symbol, concepts::Symbol...)
    stmts = Expr[]
    for c in concepts
        if !(c in _supported_concept_symbols)
            error("Invalid concept name: $c")
        end

        fun = symbol(string("set_", string(c)))
        stmt = :( $(fun)(::$(d)) = true )
        push!(stmts, stmt)
    end
    Expr(:block, stmts...)
end

macro concept_set(d, concepts...)
    esc(_concept_set(d, concepts...))
end

# macro to check interface requirements

function _concept_check(d::Symbol, concepts::Symbol...)
    stmts = Expr[]
    for c in concepts
        if !(c in _supported_concept_symbols)
            error("Invalid concept name: $c")
        end
        
        fun = symbol(string("set_", string(c)))
        msg = "Require: $(c)."
        stmt = :( $(fun)($d) ? nothing : throw(ArgumentError($msg)))
        push!(stmts, stmt)
    end
    Expr(:block, stmts...)
end

macro concept_check(d, concepts...)
    esc(_concept_check(d, concepts...))
end
