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

A tank is filled at a flow rate of Fin = 10 L/min. Volumetric flow rate from the tank is Fout = 1 L/min. Plot
volume of a liquid in the tank versus time from 0 to 60 min assuming that densities of inlet and outlet flows
are the same and initially the tank is empty.

```scilab


function dy = model(t, y)
	V = y(1)
    dVdt = Fin - Fout
	dy=[dVdt]
endfunction

// initial conditions
V0 = 0 //L - empty tank
y0 = [V0]
t0 = 0

//other process parameters
Fin=10 //L/min
Fout=1 //L/min

t = linspace(0,60) // time span in minutes

y = ode(y0, t0, t, model) // numerical integration of ODE

//results post-processing

//V(t)
V=y(1,:)   // first row

plot(t, V, '-r')
legend(['V'])
xlabel('Time, min')
ylabel('Volume,L')
```
