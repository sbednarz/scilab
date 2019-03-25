// ex3.6


/*

A + B <=> C + D

A0 = 1
B0 = 1
C0 = 0.1
D0 = 0.2

K = 10

at eq
A, B, C, D

*/


function eq = model(x)

    a = x(1) // conversion
    
    A = A0 - a*A0 + a*C0
    B = B0 - a*B0 + a*D0
    C = C0 - a*C0 + a*A0
    D = D0 - a*D0 + a*B0
    
    eq(1) = C*D - K*A*B
    
endfunction


A0 = 1   // mol/L
B0 = 1   // mol/L
C0 = 0.1 // mol/L
D0 = 0.2 // mol/L

K = 10

guess = [0.5]

x = fsolve(guess, model)

a = x(1)
A = A0 - a*A0 + a*C0
B = B0 - a*B0 + a*D0
C = C0 - a*C0 + a*A0
D = D0 - a*D0 + a*B0

printf("a=%.3f\n\n", a)
printf("A=%.3f\n", A)
printf("B=%.3f\n", B)
printf("C=%.3f\n", C)
printf("D=%.3f\n", D)

// How to check the results?
// Type under scilab console:
// A+B+C+D
// A0+B0+C0+D0


/*

Results:

a=0.849

A=0.236
B=0.321
C=0.864
D=0.879

*/

