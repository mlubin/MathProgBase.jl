using Base.Test
using MathProgBase
using MathProgBase.MathProgSolverInterface

function quadprogtest(solver=MathProgBase.defaultQPsolver)
    println("Testing quadprog with solver ", string(typeof(solver)))

    sol = quadprog([0., 0., 0.],[2. 1. 0.; 1. 2. 1.; 0. 1. 2.],[1. 2. 3.; 1. 1. 0.],[4., 1.],Inf,-Inf,Inf,solver)
    @test sol.status == :Optimal
    @test_approx_eq_eps sol.objval 130/70 1e-6
    @test_approx_eq_eps norm(sol.sol[1:3] - [0.5714285714285715,0.4285714285714285,0.8571428571428572]) 0.0 1e-6

    m = model(solver)
    loadproblem!(m, [1. 2. 3.; 1. 1. 0.],[-Inf,-Inf,-Inf],[Inf,Inf,Inf],[0.,0.,0.],[4., 1.],[Inf,Inf], :Min)

    setquadobj!(m,diagm([10.0,10.0,10.0]))
    rows = [1, 2, 2, 2, 3, 3, 3]
    cols = [1, 1, 1, 2, 2, 3, 3]
    vals = Float64[2, 0.5, 0.5, 2, 1, 1, 1]
    setquadobj!(m,rows,cols,vals)
    optimize!(m)
    stat = status(m)
    @test stat == :Optimal
    @test_approx_eq_eps getobjval(m) 130/70 1e-6
    @test_approx_eq_eps norm(getsolution(m) - [0.5714285714285715,0.4285714285714285,0.8571428571428572]) 0.0 1e-6
 


    println("Done")
end