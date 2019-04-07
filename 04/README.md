
---

### Computer Modelling in Chemical Technology: Scilab worked examples

#### Module 4. Chemical Kinetics

[Example 4.2](#example-42) | [Example 4.4](#example-44) | [Example 4.5](#example-45) 

---


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
disp(y(1,:))   // first row

//B(t)
disp(y(2,:))   // second row

//
plot(t, y(1,:), '-or')
plot(t, y(2,:), '-ob')
legend(['A'; 'B'], [1;2])
xlabel('Time')
ylabel('Concentration')

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
