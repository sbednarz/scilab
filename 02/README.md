## Computer Modelling in Chemical Technology: Scilab worked examples

### Module 2. Mass balance

[Example 2.1](#example-21)
[Example 2.2](#example-22)
[Example 2.3](#example-23)
[Example 2.4](#example-24


#### Example 2.1

A 20% w/w solution of MeOH (F1) is mixed with pure water (F2) to get 5% w/w MeOH (F3). Calculate
flow rate of water (F2) and the diluted solution (F3), knowing that F1 = 1234 kg/h and the process is under steady-state.

![scheme](0201_mass_balance.svg "")


```scilab

// mass_balance_01.sce

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


F1 = 1234            // kg/h
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



/*

Results:

x1H2O=0.80
F2=3702.00
F2=4936.00
x3H2O=0.95

*/

```

#### Example 2.2
#### Example 2.3
#### Example 2.4


