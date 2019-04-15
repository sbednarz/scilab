
// A => B, k1(T)
// A => C, k2(T)


function dy = model(t, y, T)
	A = y(1)
	B = y(2)
    C = y(2)

    R = 8.314e-3 // kJ/(mol*K)

    k01 = 1e11    // L/(mol*s)
    Ea1 = 88      // kJ

    k02 = 1e11    // L/(mol*s)
    Ea2 = 88      // kJ
 
    k1 = k01*exp(-Ea1/(R*T))
    k2 = k02*exp(-Ea2/(R*T))
    
	dAdt = -k1*A -k2*A
	dBdt = k1*A
	dCdt = k2*A

	dy=[dAdt, dBdt, dCdt]
endfunction


//

A0 = 2
B0 = 0
C0 = 0
y0 = [A0; B0; C0]
t0 = 0


t = linspace(0,3*3600)
y = ode(y0, t0, t, list(model, 310))



//A(t)
A=y(1,:)

//B(t)
B=y(2,:)

//C(t)
C=y(3,:)



plot(t/3600, A, '-or')
plot(t/3600, B, '.b')
plot(t/3600, C, '-g')
legend(['A'; 'B'; 'C'])
xlabel('Time, h')
ylabel('Concentration')

