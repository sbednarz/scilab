
---

### Computer Modelling in Chemical Technology: Scilab worked examples

#### Module 3. Chemical Equilibrium

[Example 3.1](#example-31)
[Example 3.2](#example-32)
[Example 3.3](#example-33)
[Example 3.4](#example-34)
[Example 3.5](#example-35)
[Example 3.6](#example-36)
[Example 3.7](#example-37)
[Example 3.8](#example-38)

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
// ex3.2


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


for A0 = linspace(0.1,10) 
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
end


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
// ex3.4 updated

/*

A + B <=> 2C + D

A0
B0
K

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
    eq(4) = C**2*D - K*A*B // K = (C^2*D)/(A*B)

endfunction


A0 = 1 // mol/L
B0 = 1 // mol/L
K = 1e5

guess = [1; 1; 1; 1]

x = fsolve(guess, model)

A = x(1)
B = x(2)
C = x(3) 
D = x(4)

printf("Case: A0=%.1f mol/L B0=%.1f mol/L K1=%.1f\n", A0,B0,K)
printf("A=%.2f\n", A)
printf("B=%.2f\n", B)
printf("C=%.2f\n", C)
printf("D=%.2f\n", D)


A0 = 1 // mol/L
B0 = 1 // mol/L
K = 10

guess = [1; 1; 1; 1]

x = fsolve(guess, model)

A = x(1)
B = x(2)
C = x(3) 
D = x(4)

printf("Case: A0=%.1f mol/L B0=%.1f mol/L K1=%.1f\n", A0,B0,K)
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
// ex3.5 updated

/*

A + B <=> C
A + C <=> D

A0
B0
K1
K2

calc
A, B, C, D
at eq

*/


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



```


##### Example 3.6


```scilab
// ex3.6
// https://en.wikipedia.org/wiki/Extent_of_reaction

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
```


##### Example 3.7


```scilab
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

    eq(1) = h*oh - Kw      // ion product for water Kw = 1e-14
    eq(2) = h - cl - oh    // Electroneutrality condition => solutions are electrically neutral  
    eq(3) = cHCl - cl     //  CL balance

endfunction


cHCl = 0.1 // analytical conc of HCl in mol/L
Kw = 1e-14

guess = [1e-5; 1e-5; 1-5]

x = fsolve(guess, model)

h = x(1)
oh = x(2)
cl = x(3) 

pH = -log10(h)

printf("For cHCl = %.2e mol/L\n", cHCl)
printf("[H+]=%.2e mol/L\n", h)
printf("[OH-]=%.2e mol/L\n", oh)
printf("[Cl-]=%.2e mol/L\n", cl)
printf("pH=%.2f\n", pH)



/*

Results:

For cHCl = 1.00e-01 mol/L
[H+]=1.00e-01 mol/L
[OH-]=1.00e-13 mol/L
[Cl-]=1.00e-01 mol/L
pH=1.00

*/

```


##### Example 3.8


```scilab
// ex3.8
//  Weak electrolyte equilibrium

/*

Calculate equilibrium concentrations of
H+, OH-, CH3COOH, and CH3COO- in 0.5 mo/L CH3COOH solution.


*/


function eq = model(x)

    h = x(1)
    oh = x(2)
    ch3cooh = x(3)
    ch3coo = x(4)
    
    eq(1) = h*oh - Kw                       // ion product for water Kw = 1e-14
    eq(2) = h - ch3coo - oh                 // Electroneutrality condition => solutions are electrically neutral  
    eq(3) = cCH3COOH - ch3cooh - ch3coo     //  CH3COOH balance
    eq(4) = ch3coo*h - Ka*ch3cooh           //  Ka def (dissociation)

endfunction


cCH3COOH = 0.5 // analytical conc of HCl in mol/L
Kw = 1e-14
Ka = 1.8e-5

guess = [1e-5; 1e-5; 1e-5; 1e-5]

x = fsolve(guess, model)

h = x(1)
oh = x(2)
ch3cooh = x(3)
ch3coo = x(4)

pH = -log10(h)

printf("For cCH3COOH = %.2e mol/L\n", cCH3COOH)
printf("[H+]=%.2e mol/L\n", h)
printf("[OH-]=%.2e mol/L\n", oh)
printf("[CH3COOH]=%.2e mol/L\n", ch3cooh)
printf("[CH3COO-]=%.2e mol/L\n", ch3coo)
printf("pH=%.2f\n", pH)


/*

Results:

For cCH3COOH = 5.00e-01 mol/L
[H+]=2.99e-03 mol/L
[OH-]=3.34e-12 mol/L
[CH3COOH]=4.97e-01 mol/L
[CH3COO-]=2.99e-03 mol/L
pH=2.52

*/

```

