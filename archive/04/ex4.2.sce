
// A => B, k

// input: time tick and reagents concentrations
// output: vector of instantaneous rates

function dy = model(t, y)
	A = y(1) // order: A - 1, B - 2
	B = y(2)
	dAdt = -k*A
	dBdt = k*A
	dy=[dAdt, dBdt] // order
endfunction


//

A0 = 2
B0 = 0
y0 = [A0; B0] // order
t0 = 0

k = 1e-3

t = linspace(0,3600)
y = ode(y0, t0, t, model)



disp(t)
disp(y)

//A(t)
A=y(1,:)   // first row

//B(t)
B=y(2,:)  // second row


// instantaneous rates
// dA/dt

dAdt = k*A


clf
//
subplot(121)
plot(t, A, '-or')
plot(t, B, '-ob')
legend(['A'; 'B'])
xlabel('Time')
ylabel('Concentration')


//
subplot(122)
plot(t, dAdt, '-*b')
legend(['dA/dt'])
xlabel('Time')
ylabel('Rate')
