
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
