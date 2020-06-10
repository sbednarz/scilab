### Computer Modelling in Chemical Technology, 2020 Edition

## Mass balance under non-steady-state conditions, 8 Jun - 14 Jun

#### Introduction

We have already learnt about different the use cases of well-known material balace equation: 

accumulation = in - out ± reaction.

Class03 - accumulation was equal to 0, there was no reaction, so we used the equation in a simplified, algebraic form: 

0 = in - out

Class06 - there was reaction(s) and accumulation was not equal to 0, but the system was closed (in, out = 0), so we used the equation in a form: 

accumulation = ± reaction 

(note: accumulation means e.g. rate of production of a reaction product P, dP/dt).

This module focuses on mass balance under non-steady-state conditions without reaction, i.e. accumulation, in, out ≠ 0:

accumulation = in - out

#### Example 1

```scilab
function dy = model(t, y)
	V = y(1)
    dVdt = 0.01 // 0.1 L/h - filling rate
	dy=[dVdt]
endfunction

// initial conditions
V0 = 10 //L
A0 = 2 // mol
y0 = [V0]
t0 = 0

t = linspace(0,600)       // time in hours
y = ode(y0, t0, t, model)

//V(t)
V=y(1,:)   // first row

plot(t, V, '-r')
legend(['V'])
xlabel('Time, h')
ylabel('Volume,L')
```
