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


// iteration through values list (vector)

mylist = [1, 2, 55, 67, -4, 33.333]
for x = mylist
    disp(x)
end



// nested loops

for x = 1:1:3              // 1, 2, 3 (three times)
    for y = 2:5             // 2, 3, 4, 5 (four times
        printf( "x=%f y=%f \n", x, y) // 3x4 = 12 times
    end
end


