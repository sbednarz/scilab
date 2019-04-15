
---

### Computer Modelling in Chemical Technology: Scilab worked examples

#### Module 5. Thermal effects

[Example 5.1](#example-51) | [Example 5.2](#example-52) | [Example 5.3](#example-53) | [Example 5.4](#example-54)

---


##### Example 5.1

```scilab

// A => B, k(T)


function dy = model(t, y, T)
	A = y(1)
	B = y(2)

    k0 = 1e11    // L/(mol*s)
    R = 8.314e-3 // kJ/(mol*K)
    Ea = 78      // kJ
 
    k = k0*exp(-Ea/(R*T))
	dAdt = -k*A
	dBdt = k*A
	dy=[dAdt, dBdt]
endfunction


//

A0 = 2
B0 = 0
y0 = [A0; B0] // order
t0 = 0


t = linspace(0,300)
y = ode(y0, t0, t, list(model, 310))



//A(t)
A=y(1,:)   // first row

//B(t)
B=y(2,:)  // second row


plot(t, A, '-or')
plot(t, B, '-ob')
legend(['A'; 'B'])
xlabel('Time')
ylabel('Concentration')

```

##### Example 5.2

```scilab

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

```

##### Example 5.3

```scilab

// A => B, k1(T)
// B => C, k2(T)


function dy = model(t, y, T)
	A = y(1)
	B = y(2)
    C = y(2)

    R = 8.314e-3 // kJ/(mol*K)

    k01 = 1e11    // L/(mol*s)
    Ea1 = 85      // kJ

    k02 = 1e11    // L/(mol*s)
    Ea2 = 88      // kJ
 
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


Aend=A($)
Bend=B($)
Cend=C($)


Conv = 100*Aend/A0        // conversion 3h
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
```

##### Example 5.4

```scilab

// A => B, k(T)


function dy = model(t, y)
	T = y(1)
    A = y(2)
	B = y(3)

    k0 = 1e11    // L/(mol*s)
    R = 8.314e-3 // kJ/(mol*K)
    Ea = 78      // kJ
 
    k = k0*exp(-Ea/(R*T))
	dAdt = -k*A
	dBdt = k*A
    dTdt = 0.1 // <---rate of heating/cooling K/s
	dy=[dTdt, dAdt, dBdt]
endfunction


// initial conditions
T0 = 300 //K
A0 = 2
B0 = 0
y0 = [T0; A0; B0] // order

t0 = 0

t = linspace(0,300) // time in seconds
y = ode(y0, t0, t, model)



//T(t) temperature profile
T=y(1,:)   // first row

//A(t)
A=y(2,:)   // first row

//B(t)
B=y(3,:)  // second row


plot(t, A, '-or')
plot(t, B, '-ob')
legend(['A'; 'B'])
xlabel('Time')
ylabel('Concentration')

```
