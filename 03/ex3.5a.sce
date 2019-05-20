// ex3.5 updated



// A + B <=> C
// A + C <=> D

// A0
// B0
// K1
// K2

// calc
// A, B, C, D
// at eq



function eq = model(x)

    A = x(1)
    B = x(2)
    C = x(3) 
    D = x(4)

    eq(1) = A + C + 2*D - A0   // A balance 
    eq(2) = B + C + D - B0     // B balance 
    eq(3) = C - K1*A*B         // equilibrium 1
    eq(4) = D - K2*A*C         // equilibrium 2

endfunction


// #1

A0 = 2 // mol/L
B0 = 1 // mol/L
K1 = 1e4
K2 = 1e4

guess = [1; 1; 1; 1]

x = fsolve(guess, model)

A = x(1)
B = x(2)
C = x(3) 
D = x(4)

printf("Case: A0=%.1f mol/L B0=%.1f mol/L K1=%.1f K2=%.1f\n", A0,B0,K1,K2)
printf("A=%.4f mol/L\n", A)
printf("B=%.4f mol/L\n", B)
printf("C=%.4f mol/L\n", C)
printf("D=%.4f mol/L\n", D)


// #2

A0 = 1 // mol/L
B0 = 1 // mol/L
K1 = 1e4
K2 = 1e4

guess = [1; 1; 1; 1]

x = fsolve(guess, model)

A = x(1)
B = x(2)
C = x(3) 
D = x(4)

printf("Case: A0=%.1f mol/L B0=%.1f mol/L K1=%.1f K2=%.1f\n", A0,B0,K1,K2)
printf("A=%.4f mol/L\n", A)
printf("B=%.4f mol/L\n", B)
printf("C=%.4f mol/L\n", C)
printf("D=%.4f mol/L\n", D)


// #3

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

printf("Case*: A0=%.1f mol/L B0=%.1f mol/L K1=%.1f K2=%.1f\n", A0,B0,K1,K2)
printf("A=%.4f mol/L\n", A)
printf("B=%.4f mol/L\n", B)
printf("C=%.4f mol/L\n", C)
printf("D=%.4f mol/L\n", D)

