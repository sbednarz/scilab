// ex2.2

function eq = model(x)

    F2 = x(1)
    F3 = x(2) 

    eq(1) = F1 - F2 - F3                       // total material balance of the system
    eq(2) = x1a * F1 - x2a * F2 - x3a * F3     // acetone balance

endfunction


F1 = 20            // kmol/h
x1a = 2/100
x2a = 80/100
x3a = 0.08/100


guess = [5;5]

x = fsolve(guess, model)

F2 = x(1)
F3 = x(2) 

printf("F2=%.2f\n", F2)
printf("F2=%.2f\n", F3)


/*

Results:

F2=0.48
F2=19.52

*/

