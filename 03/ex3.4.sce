// ex3.4

/*

A + B <=> 2C + D

A0 = 1
B0 = 1
K = 10

at eq
A, B, C, D

*/


function eq = model(x)

    A = x(1)
    B = x(2)
    C = x(3) 
    D = x(4)

    eq(1) = A + 0.5*C - A0 // A balance 
    eq(2) = B + D - B0     // B balance 
    eq(3) = 0.5*C - D      // relations between C and D (stoichiometry)
    eq(4) = C**2*D - K*A*B // K = (B*C)/(A*B)

endfunction


A0 = 1 // mol/L
B0 = 1 // mol/L
K = 10

guess = [1; 1; 1; 1]

x = fsolve(guess, model)

A = x(1)
B = x(2)
C = x(3) 
D = x(4)

printf("A=%.2f\n", A)
printf("B=%.2f\n", B)
printf("C=%.2f\n", C)
printf("D=%.2f\n", D)



/*

Results:

A=0.34
B=0.34
C=1.32
D=0.66

*/

// How to check the results?

// A+B+0.5*C+D
// A0+B0
