// ex3.5

/*

A + B <=> C
A + C <=> D

A0 = 1
B0 = 1
K1 = 10
K2 = 10

at eq
A, B, C, D

*/


function eq = model(x)

    A = x(1)
    B = x(2)
    C = x(3) 
    D = x(4)

    eq(1) = A + C + D - A0 // A balance 
    eq(2) = B + C - B0     // B balance 
    eq(3) = C - K1*A*B     // equilibrium 1
    eq(4) = D - K2*A*C     // equilibrium 2

endfunction


A0 = 1 // mol/L
B0 = 1 // mol/L
K1 = 10
K2 = 10

guess = [1; 1; 1; 1]

x = fsolve(guess, model)

A = x(1)
B = x(2)
C = x(3) 
D = x(4)

printf("A=%.2f mol/L\n", A)
printf("B=%.2f mol/L\n", B)
printf("C=%.2f mol/L\n", C)
printf("D=%.2f mol/L\n", D)



/*

Results:

A=0.09 mol/L
B=0.52 mol/L
C=0.48 mol/L
D=0.43 mol/L


*/

