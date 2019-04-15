
// A => B, k1(T)
// B => C, k2(T)


function dy = model(t, y, T)
	A = y(1)
	B = y(2)
	C = y(2)

	R = 8.314e-3 // kJ/(mol*K)

	k01 = 1e11	// L/(mol*s)
	Ea1 = 85	  // kJ

	k02 = 1e11	// L/(mol*s)
	Ea2 = 88	  // kJ
 
	k1 = k01*exp(-Ea1/(R*T))
	k2 = k02*exp(-Ea2/(R*T))
	
	dAdt = -k1*A
	dBdt = k1*A - k2*B
	dCdt = k2*B

	dy=[dAdt, dBdt, dCdt]
endfunction


//

A0 = 2
B0 = 0
C0 = 0
y0 = [A0; B0; C0]
t0 = 0


t = linspace(0,3*3600)
y = ode(y0, t0, t, list(model, 280))



//A(t)
A=y(1,:)

//B(t)
B=y(2,:)

//C(t)
C=y(3,:)


Aend=A($) // $ - index of last vector element
Bend=B($)
Cend=C($)


Conv = 100*Aend/A0		// conversion 3h
Sel = Bend/(Cend + Bend)  // selectivity 3h

clf
plot(t/3600, A, '-or')
plot(t/3600, B, '.b')
plot(t/3600, C, '-g')
legend(['A'; 'B'; 'C'])
xlabel('Time, h')
ylabel('Concentration')



printf("conversion A after 3h: %.2f %%\n", Conv)
printf("selectivity B after 3h: %.2f %%", Sel)
