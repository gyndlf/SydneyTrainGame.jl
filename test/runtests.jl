using SydneyTrainGame
using Test

@testset "SydneyTrainGame.jl" begin
    
    @test 2 + 3 == 5

    @test_throws DomainError solve_straight(12345)

    fail = solve_straight(1111)
    @test length(fail) == 0

    succeed = solve_straight(4321)
    @test length(succeed) == 3
    @test "4+3+2+1" in succeed
    @test "4x3-2/1" in succeed



end
