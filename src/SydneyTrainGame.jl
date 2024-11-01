# Solver for the Sydney train game
#
# d8259
#
# How the game works:
# - Each Sydney train carriage has a unique 4-digit number. Using only +,-,*,/ and if needed ^ can you use all the numbers once to get 10?
# - Bonus points if you can do it without moving the numbers out of order
# - Brackets of any kind are allowed. (All groupings are ok)

module SydneyTrainGame

using Combinatorics 

N = 4  # number of digits to play with
T = 10  # target to sum to

include("operations.jl")

operations = [add, subtract, multiply, divide]  # basic operations (use // instead of /)
extra_operations = [exponentiate]  # if we can't solve it retry with this


function solve_straight(x:: Int)::Vector
    """Solve the train game by forcing the numbers to be in the order as written"""
    d = Rational.(digits(x) |> reverse)
    if length(d) != N
        throw(DomainError(length(d), "Must be four digits long"))
    end

    # Solve the problem where we cannot permute the number's order 
    #for ops in permutations(operations, N-1)
    solutions = []
    for ops in Iterators.product(Iterators.repeated(operations, N-1)...)
        if ops[3](ops[2](ops[1](d[1], d[2]), d[3]), d[4]) == T
            x_str = string(x)

            sol = x_str[1] * lookup[ops[1]] * x_str[2] * lookup[ops[2]] * x_str[3] * lookup[ops[3]] * x_str[4]

            # Inject brackets (?)
            if (typeof(ops[2]) == multiply || typeof(ops[2]) == divide) && (typeof(ops[1]) == add || typeof(ops[1]) == subtract)
                # Need brackets around first set
                sol = "(" * sol[1:3] * ")" * sol[4:end]
            end
            push!(solutions, sol)
        end
    end
    return solutions
end



function solve(x::Int)::Vector
    """Solve the Sydney Train game. Assumes that rearrangment is ok."""
    return []
end


export solve, solve_straight
end
