
// A => B k1
// B => C k2
//
// How to find reaction time when concentration of B reaches max.?




// kinetic model

function dy = model(t, y)
    A = y(1)
    B = y(2)
    C = y(3)
    dAdt = -k1*A
    dBdt = k1*A - k2*B
    dCdt = k2*B
    dy=[dAdt, dBdt, dCdt] // order
endfunction


// parameters & initial conditions

k1 = 5e-4 // 1/s
k2 = 1e-4 // 1/s

A0 = 2
B0 = 0
C0 = 0

//ic
y0 = [A0; B0; C0]
t0 = 0




// plot A(t), B(t), C(t)

t = linspace(0,5*3600) // seconds
y = ode(y0, t0, t, model)

clf
plot(t,y(1,:),'b-')
plot(t,y(2,:),'g-')
plot(t,y(3,:),'r-')
legend(['[A]';'[B]';'[C]'])
xlabel('Time, s')
ylabel('Concentration, mol/L')



// main calculations

function b = calc_b(t)
    y0 = [A0; B0; C0]
    t0 = 0
    y = ode(y0, t0, t, model)
    b = -y(2)    
endfunction

guess_time = [100]
[t_opt, max_b] = fminsearch(calc_b, guess_time) // find minimum (!) of function


// plot maxB
plot(t_opt, -max_b, 'mx')
printf("time optim: %.2f s, max B: %.3f mol/L", t_opt, -max_b)

