// ex3.7
// Strong electrolyte equilibrium

/*

Calculate equilibrium concentrations of
H+, OH- and Cl- in 0.1 mo/L and 1e-7 mol/L HCL solution.


*/


function eq = model(x)

    h = x(1)
    oh = x(2)
    cl = x(3) 

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


*/

