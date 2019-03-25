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
    eq(2) = h - cl - oh    // Electroneutrality condition => solution are electrically neutral  
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

