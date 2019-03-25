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
    eq(2) = h - ch3coo - oh                 // Electroneutrality condition => solution are electrically neutral  
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

