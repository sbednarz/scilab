// ex3.6
// https://en.wikipedia.org/wiki/Extent_of_reaction
// https://www.youtube.com/watch?v=fuk1zTdJifM

/*

2A <=> B + 3C

A0 >0
B0 >0
C0 >0
K

at eq
A, B, C

*/


function eq = model1(x)

    Xi = x(1) // extent of reaction 
    
    A = -2*Xi + A0
    B = 1*Xi + B0
    C = 3*Xi + C0
    
    eq(1) = B*C^3 - K*A^2
    
endfunction


A0 = 2   // mol/L
B0 = 1   // mol/L
C0 = 0 // mol/L

K = 79.734375

guess = [0.5]

x = fsolve(guess, model1)

Xi = x(1)
A = -2*Xi + A0
B = 1*Xi + B0
C = 3*Xi + C0

printf("Xi=%.3f\n", Xi)
printf("A=%.3f\n", A)
printf("B=%.3f\n", B)
printf("C=%.3f\n", C)

//-----------------------------------------------------

/*

A + B <=> C + D

A0 >0
B0 >0
C0 >0
D0 >0
K

at eq
A, B, C, D

*/


function eq = model2(x)

    Xi = x(1) // extent of reaction 
    
    A = -1*Xi + A0 
    B = -1*Xi + B0
    C = 1*Xi + C0
    D = 1*Xi + D0

    eq(1) = C*D - K*A*B
    
endfunction


// #1

A0 = 1   // mol/L
B0 = 1   // mol/L
C0 = 0 // mol/L 
D0 = 0 // mol/L

K = 1

guess = [0]
   
x = fsolve(guess, model2)

Xi = x(1)
A = -1*Xi + A0 
B = -1*Xi + B0
C = 1*Xi + C0
D = 1*Xi + D0

printf("\nCase: A0=%.1f mol/L B0=%.1f mol/L A0=%.1f mol/L B0=%.1f mol/L K=%.1f\n", A0,B0,C0,D0,K)
printf("Xi=%.3f\n", Xi)
printf("A=%.3f\n", A)
printf("B=%.3f\n", B)
printf("C=%.3f\n", C)
printf("D=%.3f\n", D)


// #2

A0 = 1   // mol/L
B0 = 1   // mol/L
C0 = 1 // mol/L 
D0 = 1 // mol/L

//
K = 1

guess = [0]
   
x = fsolve(guess, model2)

Xi = x(1)
A = -1*Xi + A0 
B = -1*Xi + B0
C = 1*Xi + C0
D = 1*Xi + D0

printf("\nCase: A0=%.1f mol/L B0=%.1f mol/L A0=%.1f mol/L B0=%.1f mol/L K=%.1f\n", A0,B0,C0,D0,K)
printf("Xi=%.3f\n", Xi)
printf("A=%.3f\n", A)
printf("B=%.3f\n", B)
printf("C=%.3f\n", C)
printf("D=%.3f\n", D)


// #3

A0 = 1   // mol/L
B0 = 1   // mol/L
C0 = 0.5 // mol/L 
D0 = 0.5 // mol/L

//
K = 1

guess = [0]
   
x = fsolve(guess, model2)

Xi = x(1)
A = -1*Xi + A0 
B = -1*Xi + B0
C = 1*Xi + C0
D = 1*Xi + D0

printf("\nCase: A0=%.1f mol/L B0=%.1f mol/L A0=%.1f mol/L B0=%.1f mol/L K=%.1f\n", A0,B0,C0,D0,K)
printf("Xi=%.3f\n", Xi)
printf("A=%.3f\n", A)
printf("B=%.3f\n", B)
printf("C=%.3f\n", C)
printf("D=%.3f\n", D)


// #4

A0 = 0   // mol/L
B0 = 0   // mol/L
C0 = 1 // mol/L 
D0 = 1 // mol/L

//
K = 1

guess = [0]
   
x = fsolve(guess, model2)

Xi = x(1)
A = -1*Xi + A0 
B = -1*Xi + B0
C = 1*Xi + C0
D = 1*Xi + D0

printf("\nCase: A0=%.1f mol/L B0=%.1f mol/L A0=%.1f mol/L B0=%.1f mol/L K=%.1f\n", A0,B0,C0,D0,K)
printf("Xi=%.3f\n", Xi)
printf("A=%.3f\n", A)
printf("B=%.3f\n", B)
printf("C=%.3f\n", C)
printf("D=%.3f\n", D)
