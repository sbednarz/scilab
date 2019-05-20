// ex3.5b
// reaction extent approach



// A + B <=> C
// A + C <=> D

// given:
// A0
// B0
// K1
// K2

// calc
// A, B, C, D
// at eq

function eq = model(x)

    Xi1 = x(1)
    Xi2 = x(2)
    
    A = A0 - Xi1 - Xi2
    B = B0 - Xi1
    C = C0 + Xi1 - Xi2 
    D = D0 + Xi2
    
    eq(1) = C - K1*A*B
    eq(2) = D - K2*A*C
       
endfunction


// #1

A0 = 1 // mol/L
B0 = 1 // mol/L
C0 = 0
D0 = 0
K1 = 10
K2 = 10

guess = [0; 0]

x = fsolve(guess, model)

Xi1 = x(1)
Xi2 = x(2)

A = A0 - Xi1 - Xi2
B = B0 - Xi1
C = C0 + Xi1 - Xi2 
D =  Xi2


printf("Case*: A0=%.1f mol/L B0=%.1f mol/L K1=%.1f K2=%.1f\n", A0,B0,K1,K2)
printf("A=%.4f mol/L\n", A)
printf("B=%.4f mol/L\n", B)
printf("C=%.4f mol/L\n", C)
printf("D=%.4f mol/L\n", D)


//https://www.youtube.com/watch?v=QkgDHssj-3w
