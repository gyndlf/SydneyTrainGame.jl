# The basic operations that the solver is allowed to use
# d8259
#


function add(x::Rational, y::Rational)::Rational
    return x+y
end


function subtract(x::Rational, y::Rational)::Rational
    return x-y
end


function multiply(x::Rational, y::Rational)::Rational
    if abs(x) == Inf || abs(y) == Inf
        return Inf
    end
    return x*y
end


function divide(x::Rational, y::Rational)::Rational
    if y == 0
        return Inf
    end
    return x//y
end


function exponentiate(x::Rational, y::Rational)::Rational
    return x^y
end


lookup = Dict(
    add => "+",
    subtract => "-",
    multiply => "x",
    divide => "/",
    exponentiate => "^"
)

