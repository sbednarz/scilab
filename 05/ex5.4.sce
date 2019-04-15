
// A => B, k(T)


function dy = model(t, y)
	T = y(1)
    A = y(2)
	B = y(3)

    k0 = 1e11    // L/(mol*s)
    R = 8.314e-3 // kJ/(mol*K)
    Ea = 78      // kJ
 
    k = k0*exp(-Ea/(R*T))
	dAdt = -k*A
	dBdt = k*A
    dTdt = 0.1 // <---rate of heating/cooling K/s
	dy=[dTdt, dAdt, dBdt]
endfunction


// initial conditions
T0 = 300 //K
A0 = 2
B0 = 0
y0 = [T0; A0; B0] // order

t0 = 0

t = linspace(0,300) // time in seconds
y = ode(y0, t0, t, model)



//T(t) temperature profile
T=y(1,:)   // first row

//A(t)
A=y(2,:)   // first row

//B(t)
B=y(3,:)  // second row


plot(t, A, '-or')
plot(t, B, '-ob')
legend(['A'; 'B'])
xlabel('Time')
ylabel('Concentration')

