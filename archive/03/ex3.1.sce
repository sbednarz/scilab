// ex3.1




// A + B <=> C + D
// 
// A0 = 1
// B0 = 1
// K = 10

// at eq
// A, B, C, D



function eq = model(x)

    A = x(1)
    B = x(2)
    C = x(3) 
    D = x(4)

    eq(1) = A + C - A0  // A balance 
    eq(2) = B + C - B0  // B balance 
    eq(3) = C - D       // stoichiometry
    eq(4) = C*D - K*A*B // K = (B*C)/(A*B)

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

// How to check the results?
// Type under scilab console:
// A+B+C+D
// A0+B0



// Results:

// A=0.24
// B=0.24
// C=0.76
// D=0.76


