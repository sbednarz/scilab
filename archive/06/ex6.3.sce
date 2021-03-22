
// ex.6.3

// solvent enters to the tank with flow of 0.1 L/s
// A + B -> C, k

// accu = in - out + prod

function dy = model(t, y)
	
    // instantaneous values:
    V = y(1)
    nA = y(2)
    nB = y(3)
    nC = y(4)
    
    // instant concentrations
    A = nA/V
    B = nB/V
    C = nC/V
    
    //rates:
    dVdt = 0.1 // 0.1 L/s
    dnAdt = -k*A*B*V
    dnBdt = -k*A*B*V
    dnCdt = k*A*B*V

    dy=[dVdt, dnAdt, dnBdt, dnCdt]
endfunction


// initial conditions
V0 = 10 //L
nA0 = 2.0 // mol
nB0 = 1.5 // mol
nC0 = 0 // mol

k = 1e-2

y0 = [V0; nA0; nB0; nC0]

t0 = 0

t = linspace(0,3600)       // time in seconds
y = ode(y0, t0, t, model)



//V(t) total profile
V=y(1,:)

nA=y(2,:)
nB=y(3,:)
nC=y(4,:)

A = nA ./ V // ./ ==> element-by-element division
B = nB ./ V // ./ ==> element-by-element division
C = nC ./ V // ./ ==> element-by-element division



clf
plot(t, nA, '-or')
plot(t, nB, '-ob')
plot(t, nC, '-og')
legend(['A'])
xlabel('Time, s')
ylabel('Concentration, mol/L')

