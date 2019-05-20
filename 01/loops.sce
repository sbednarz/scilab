// loops

// from 1 to 10
for x = 1:10
    disp(x)
end

// start : step : end
for x = 1:2:10
    disp(x)
end

for x = 10:-1:1
    disp(x)
end


// iteration through values of a list (a vector)

mylist = [1, 2, 55, 67, -4, 33.333]
for x = mylist
    disp(x)
end



// nested loops

for x = 1:1:3                         // 1, 2, 3 (three times)
    for y = 2:5                       // 2, 3, 4, 5 (four times)
        printf( "x=%f y=%f \n", x, y) // 3x4 = 12 times
    end
end




// loops & calculations

// index varible set to a first matrix element
i = 1

// room for our results
results=[]

// a parameter values
mylist = [2, 3, 4, 5]

// iteration through the values
for x = mylist
    
    // calculations
    y = x**2
    disp(x)
    disp(y)
    
    // store the parameter x and the result y
    results(i,1) = x
    results(i,2) = y    
    i = i + 1
end

// outside calculations loop

disp(results)

// post-analysis e.g. plotting
//plot(results(:,1), results(:,2), 'o')

