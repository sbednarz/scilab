
// 6.1

function dy = model(t, y)
	V = y(1)
    dVdt = 0.01 // 0.1 L/s
	dy=[dVdt]
endfunction


// initial conditions
V0 = 10 //L
A0 = 2 // mol
y0 = [V0]

t0 = 0

t = linspace(0,600)       // time in seconds
y = ode(y0, t0, t, model)



//V(t) total profile
V=y(1,:)   // first row


plot(t, V, '-or')
legend(['V'])
xlabel('Time, s')
ylabel('Volume,      L')

