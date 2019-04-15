
// A => B, k(T)


function dy = model(t, y, T)
	A = y(1)
	B = y(2)

    k0 = 1e11    // L/(mol*s)
    R = 8.314e-3 // kJ/(mol*K)
    Ea = 78      // kJ
 
    k = k0*exp(-Ea/(R*T))
	dAdt = -k*A
	dBdt = k*A
	dy=[dAdt, dBdt]
endfunction


//

A0 = 2
B0 = 0
y0 = [A0; B0] // order
t0 = 0


t = linspace(0,300)
y = ode(y0, t0, t, list(model, 310))



//A(t)
A=y(1,:)   // first row

//B(t)
B=y(2,:)  // second row


plot(t, A, '-or')
plot(t, B, '-ob')
legend(['A'; 'B'])
xlabel('Time')
ylabel('Concentration')

