// ex2.1 loop
// TODO: plot F2 = f(F1)

function eq = model(x)

    x1H2O = x(1)
    F2 = x(2)
    F3 = x(3) 
    x3H2O = x(4)

    eq(1) = F1 + F2 - F3                                // material balance of the system
    eq(2) = x1MeOH * F1 + x2MeOH * F2 - x3MeOH * F3     // MeOH balance
    eq(3) = x1MeOH + x1H2O - 1                          // mass fraction constraint
    eq(4) = x3MeOH + x3H2O - 1                          // mass fraction constraint

endfunction



i = 1
results = []

F1vals = [100,200,500,1000,2000,5000]
for F1 = F1vals
    x1MeOH = 0.2
    x2MeOH = 0
    x2H2O = 1.0
    x3MeOH = 0.05

    guess = [0.1; 100; 100; 0.1]

    x = fsolve(guess, model)

    x1H2O = x(1)
    F2 = x(2)
    F3 = x(3) 
    x3H2O = x(4)

    printf("x1H2O=%.2f\n", x1H2O)
    printf("F2=%.2f\n", F2)
    printf("F2=%.2f\n", F3)
    printf("x3H2O=%.2f\n", x3H2O)

    // collecting data
    results(i,1) = F1
    results(i,2) = F2
    i = i + 1

end


plot(results(:,1), results(:,2))
    
