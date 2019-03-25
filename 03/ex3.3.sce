// ex3.3


/*

A + B <=> C + D

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

    eq(1) = A + C - A0   // A balance 
    eq(2) = B + C - B0   // B balance 
    eq(3) = C - D        // 
    eq(4) = C*D - K*A*B  // K = (B*C)/(A*B)

endfunction


A0 = 1 // mol/L
B0 = 1 // mol/L
K = 10

N = 100
i=1

// zeros(rows, cols)
results=zeros(N,5)

for A0 = linspace(0.1, 10, N) 
    guess = [1; 1; 1; 1]
    x = fsolve(guess, model)
    A = x(1)
    B = x(2)
    C = x(3) 
    D = x(4)
    printf("\nA0=%.2f\n",A0)
    printf("A=%.2f\n", A)
    printf("B=%.2f\n", B)
    printf("C=%.2f\n", C)
    printf("D=%.2f\n", D)

    
    results(i,1) = A0
    results(i,2) = A
    results(i,3) = B
    results(i,4) = C
    results(i,5) = D
    i = i + 1
    
end

// inspect matrix results (Variable Browser)


// plot C vs. A0
xlabel('A0, mol/L')
ylabel('C, mol/L')
plot(results(:,1), results(:,4))


