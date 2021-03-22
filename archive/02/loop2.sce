// tested on Scilab v. 6.0.1

i = 1
results=[]

// a parameter values
mylist = [2, 3, 4, 5]

// iteration through the values
for x = mylist
    
    // calculations
    y = x**2
    disp(x)
    disp(y)
    
    // store parameter x and the result y
    results(i,1) = x
    results(i,2) = y    
    i = i + 1
end

// outside calculations loop

disp(results)

// post-analysis e.g. plotting
plot(results(:,1), results(:,2), 'o')
