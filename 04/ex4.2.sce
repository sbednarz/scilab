
// A => B, k

function dy = model(t, y)
	k = 1e-3
	A = y(1) // order: A - 1, B - 2
	B = y(2)
	dAdt = -k*A
	dBdt = k*A
    dy=[dAdt, dBdt] // order
endfunction

A0 = 2
B0 = 0
y0 = [A0, B0] // order

t = linspace(0,3600)
y = ode([2; 0], 0, t, model)

disp(t)
disp(y)

//A(t)
disp(y(:,1))

//B(t)
disp(y(:,2))

//
plot(t, y(1,:), '-or')
plot(t, y(2,:), '-ob')
legend(['A'; 'B'], [1;2])
xlabel('Time')
ylabel('Concentration')

