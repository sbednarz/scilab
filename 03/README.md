
---

### Computer Modelling in Chemical Technology: Scilab worked examples

#### Module 3. Chemical Equilibrium

[Example 3.1](#example-31)
[Example 3.2](#example-32)
[Example 3.3](#example-33)
[Example 3.4](#example-34)
[Example 3.5](#example-35)
[Example 3.6](#example-36)

---


##### Example 3.1


```scilab
// ex3.1


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


/*

Results:

A=0.24
B=0.24
C=0.76
D=0.76

*/

```


##### Example 3.2


```scilab
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


```


##### Example 3.3


```scilab
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


```


##### Example 3.4


```scilab
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
```


##### Example 3.5


```scilab
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

```


##### Example 3.6


```scilab
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

```

