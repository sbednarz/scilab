// ex 7.10
// [Myers, Seider, 1976]

function eq = model(u)
    
    F2 = u(1)
    x21 = u(2)
    x22 = u(3)
    x23 = u(4)
    x24 = u(5)
    x25 = u(6)
    
    F1 = 100.0
    x11 = 0.220
    x12 = 0.685
    x14 = 0.012
    x15 = 0.020
    x13 = 1.0 - x11 - x12 - x14 - x15
    Keq = 0.2
    
    eq(1) = Keq - x23**2/(x21*x22**3)
    eq(2) = 1 - x21 - x22 - x23 - x24 - x25
    eq(3) = 2*F1*x11 + F1*x13 - 2*F2*x21 - F2*x23
    eq(4) = 2*F1*x12 + 3*F1*x13 - 2*F2*x22 - 3*F2*x23
    eq(5) = F1*x14 - F2*x24
    eq(6) = F1*x15 - F2*x25
    
endfunction

guess = [100; 0.5; 0.5; 0.5; 0.5; 0.5]
[x,v,i] = fsolve(guess, model)
disp(x)
disp(v)
disp(i)
