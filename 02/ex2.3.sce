// ex2.3

function eq = model(x)

    F3 = x(1)
    F4 = x(2)
    x3o = x(3)
    x4o = x(4)

    eq(1) = F1 + F2 - F3 - F4                   // total material balance of the system
    eq(2) = x3o - K*x4o                         // partition coefficient def
    eq(3) = F1*x1o - F3*x3o - F4*x4o            // the oil balance
    eq(4) = F2 - F3*(1-x3o)                     // the solvent balance

endfunction


F1 = 2 // kg/h
F2 = 0.1 // kg/h
x1o = 0.01
K = 35

guess = [1;1;0.1;0.1]

x = fsolve(guess, model)

F3 = x(1)
F4 = x(2) 
x3o = x(3)
x4o = x(4)


printf("F2=%.4f\n", F2)
printf("F3=%.4f\n", F3)
printf("x3o=%.4f\n", x3o)
printf("x4o=%.4f\n", x4o)


// calculations of the recovery factor

o1 = F1*x1o
o2 = F3*x3o
r = 100*o2/o1

printf("Total oil in the feed: %.4f kg/h\n",o1)
printf("The amount of the oil extracted   : %.4f kg/h\n",o2)
printf("The recovery: %.2f %%\n",r)





// Results:
// F2=0.1000 kg/h
// F3=0.1133 kg/h
// x3o=0.1176
// x4o=0.0034
// Total oil in the feed: 0.0200 kg/h
// The amount of the oil extracted: 0.0133 kg/h
// The recovery: 66.63 %



