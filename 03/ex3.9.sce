// 1) N2+O2 <=> 2NO
// 2) CO+0.5O2 <=> CO2
// K1=8.26e-3
// K2=0.7

function eq = model(x)

    x1 = x(1)
    x2 = x(2)

    nN2 = 1.88-x1
    nO2 = 0.5-0.5*x2-x1
    nCO = 1-x2
    nCO2 =  x2
    nNO = 2*x1
    
    nTOTAL = nN2 + nO2 + nCO + nCO2 + nNO
    
    XN2 = nN2/nTOTAL
    XO2 = nO2/nTOTAL
    XCO = nCO/nTOTAL
    XCO2 = nCO2/nTOTAL
    XNO = nNO/nTOTAL
    
    eq(1) = XNO**2 - K1*XN2*XO2
    eq(2) = XCO2 - K2*XCO*XO2**0.5

endfunction


K1 = 8.26e-3
K2 = 0.7
c0N2=1.88
c0O2=0.5
c0CO=1
c0CO2=0
c0NO=0


guess = [1;1]

x = fsolve(guess, model)

x1 = x(1)
x2 = x(2)

nN2 = 1.88-x1
nO2 = 0.5-0.5*x2-x1
nCO = 1-x2
nCO2 =  x2
nNO = 2*x1

nTOTAL = nN2 + nO2 + nCO + nCO2 + nNO

XN2 = nN2/nTOTAL
XO2 = nO2/nTOTAL
XCO = nCO/nTOTAL
XCO2 = nCO2/nTOTAL
XNO = nNO/nTOTAL

disp(x1)
disp(x2)

disp('----')

disp(XN2)
disp(XO2)
disp(XCO)
disp(XCO2)
disp(XNO)

/*
output

 0.0374052

   0.1897558

 ----

   0.5608908

   0.111934

   0.2466405

   0.0577622

   0.0227725

*/
