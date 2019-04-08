
// second order reaction
// A + B => C, k


function dy = model(t, y)
    A = y(1) // A,B,C
    B = y(2)
    C = y(3)
    dAdt = -k*A*B
    dBdt = -k*A*B
    dCdt = k*A*B
    dy=[dAdt, dBdt, dCdt] // A,B,C
endfunction


//

A0 = 2
B0 = 1
C0 = 0
y0 = [A0; B0; C0] // A,B,C
t0 = 0

k = 3e-3 // L/(mol*s)

// time span
t = linspace(0,3600)
y = ode(y0, t0, t, model)



//disp(t)
//disp(y)

//A(t)
A=y(1,:)   // first row

//B(t)
B=y(2,:)   // second row

//C(t)
C=y(3,:)   // second row


// clear plot area
clf

//
subplot(211)
plot(t, A, '-or') //A(t)
plot(t, B, '-ob') //B(t)
plot(t, C, '-og') //C(t)
legend(['A'; 'B'; 'C'])
xlabel('Time')
ylabel('Concentration')


subplot(212)
plot(t, A + C, '-+r')
plot(t, B + C, '-+p')
legend(['A+C';'B+C'])





// equilibria
// 2A => B, k1
// B => 2A, k2

function dy = model(t, y)
    A = y(1) // A,B
    B = y(2)
    dAdt = -2*k1*A*A + 2*k2*B
    dBdt = k1*A*A - k2*B
    dy=[dAdt, dBdt] //
endfunction


k1 = 1e-3
k2 = 1e-4
A0 = 0.6
B0 = 0
y0 = [A0; B0]

//t = linspace(0,20000)
//y = ode(y0, t0, t, model)

//clf
//A=y(1,:)   // first row
//B=y(2,:)   // second row
//plot(t,A,'-b')
//plot(t,B,'--g')

