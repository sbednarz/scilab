// fsolve



// The “fsolve” function solves systems of n nonlinear equations and
// n unknowns.




// lets solve an equation:
// -2*x**3 + 5*x**2 + x = 2


// todo: plot eq x=<-1,3>
// Where are roots approx?



function y = problem(x)

    y = -2*x**3 + 5*x**2 + x - 2            // note the form: -2*x**3 + 5*x**2 + x - 2 = 0

endfunction


// a guess value: try 2000, 100, 10, 1, -1, -100
x0 = 10

// main calculations
solution = fsolve(x0, problem)

// a minimalistic report
disp(solution)






// lets solve a system of 2 equations and 2 unknowns:
// {p+q=10, p**2-q=4}


// all expression on left side, 0 on right side
// {p+q-10=0, p**2-q-4=0}


// todo: plot eq p=<-10,10>


function eq = problem(x)
    p = x(1)
    q = x(2)
    eq(1) = p+q-10
    eq(2) = p**2-q-4
endfunction


// guess values try different pairs
guess = [1; 1] // semicolon here (NOT comma)

// main calculations
solution = fsolve(guess, problem)

// a minimalistic report
disp(solution)




/* ANS:

   first pair of solutions:

   3.2749172
   6.7250828

  second pair of solutions:

 -4.2749172
  14.274917

*/



