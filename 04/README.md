
---

### Computer Modelling in Chemical Technology: Scilab worked examples

#### Module 4. Chemical Kinetics

[Example 4.1](#example-41) | [Example 4.2](#example-42) | [Example 4.3](#example-43) | [Example 4.4](#example-44) | [Example 4.5](#example-45) 

---


##### Example 4.1

```scilab

// A => B, k
// A = A0*np.exp(-k*t)



// input: time tick (t)
// output: concentration of A(t)

function A = model(t)
    A = A0*exp(-k*t)
endfunction



A0 = 2    // mol/L
k = 1e-3  // 1/s


// #1

A122 = model(122)
printf("At 122 s [A]=%.2f mol/L\n",A122)




// #2


t = linspace(0,3600)
A = model(t)
XA = (1-A/A0)*100 // conversion of A

subplot(121)
plot(t,A,'ro')
xlabel('Time, s')
ylabel('Conc, mol/L')

subplot(122)
plot(t,XA,'go')
xlabel('Time, s')
ylabel('Conversion, %')


// disp(t)
// disp(A)

// (initial) rate

t0 = t(1)
t1 = t(2)

A0 = A(1)
A1 = A(2)


v0 = (A1-A0)/(t1-t0)

printf('Initial rate = %.3f mo/(L*s)\n',v0)
```

##### Example 4.2

```scilab

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



//disp(t)
//disp(y)

//A(t)
A=y(1,:)   // first row

//B(t)
B=y(2,:)  // second row


// rate (!)
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
```

##### Example 4.3

```scilab

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

```

##### Example 4.4

```scilab

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


```

##### Example 4.5

```scilab

// A => B k1
// B => C k2
//
// How to find reaction time when concentration of B reaches max.?




// kinetic model

function dy = model(t, y)
    A = y(1)
    B = y(2)
    C = y(3)
    dAdt = -k1*A
    dBdt = k1*A - k2*B
    dCdt = k2*B
    dy=[dAdt, dBdt, dCdt] // order
endfunction


// parameters & initial conditions

k1 = 5e-4 // 1/s
k2 = 1e-4 // 1/s

A0 = 2
B0 = 0
C0 = 0

//ic
y0 = [A0; B0; C0]
t0 = 0




// plot A(t), B(t), C(t)

t = linspace(0,5*3600) // seconds
y = ode(y0, t0, t, model)

clf
plot(t,y(1,:),'b-')
plot(t,y(2,:),'g-')
plot(t,y(3,:),'r-')
legend(['[A]';'[B]';'[C]'])
xlabel('Time, s')
ylabel('Concentration, mol/L')



// main calculations

function b = calc_b(t)
    y0 = [A0; B0; C0]
    t0 = 0
    y = ode(y0, t0, t, model)
    b = -y(2)    
endfunction

guess_time = [100]
[t_opt, max_b] = fminsearch(calc_b, guess_time) // find minimum (!) of function


// plot maxB
plot(t_opt, -max_b, 'mx')
printf("time optim: %.2f s, max B: %.3f mol/L", t_opt, -max_b)

```
