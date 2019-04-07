
// A => B, k
//
// A0 = 2
// B0 = 0
// y0 = [A0; B0]
// t0 = 0
// k = 1e-3
//
// How to calculate reaction time when [B] reaches 1.2 mol/L?


function dy = model(t, y)
	A = y(1)
	B = y(2)
	dAdt = -k*A
	dBdt = k*A
	dy=[dAdt, dBdt]
endfunction


// integrate ODE (model) until end_of_calculations(t, y) = 0

function z = end_of_calculations(t, y)
	A = y(1)
	B = y(2)
    z = B - 1.2 // B = 1.2 => B - 1.2 = 0
endfunction



A0 = 2
B0 = 0
y0 = [A0; B0]
t0 = 0
tend = 3600
k = 1e-3



// plot A(t), B(t)

t = linspace(0,3600) // seconds
y = ode(y0, t0, t, model)

clf
plot(t,y(1,:),'b-')
plot(t,y(2,:),'g-')
plot([0,3600], [1.2,1.2],'g--')
legend(['[A]';'[B]'])
xlabel('Time, s')
ylabel('Concentration, mol/L')




// main calculations

// integrate ODE (model) until end_of_calculations(t, y) = 0
// t = t0 .. t_optim
[y,rd] = ode("roots", y0, t0, tend, model, 1,end_of_calculations)

// results
t_optim = rd(1)
A_optim = y(1)
B_optim = y(2)

// report 
printf("At t=%.2f s [A]=%.3f mol/L [B]=%.3f mol/L", t_optim, A_optim, B_optim)    

//plot
plot(t_optim, B_optim,'mx')
plot([t_optim,t_optim], [0,B_optim],'m--')


