
// 1
// some data
x = [1,2,3,4,5]
y = [2,4,6,8,10]

plot (x,y)

// clear 
clf


// 2
// some data
x = [1,2,3,4,5]
y = [2,4,6,8,10]

// try different arg: 'o' '-' 'o-' 'x' 'r' 'g' 'b' 'y'
plot (x,y,'o')

//
clf


// 3

// 0...10 (100 elements)
// try disp(x)
x = linspace(0,10)
y1 =  3*x**2 - 10*x + 1
y2 =  -3*x**2 - 10*x + 1
plot(x,y1,'.r')
plot(x,y2,'.g')
xlabel("X-axis");
ylabel("Y-axis");



// 4
// data in a matrix

m = [1,1; 2,4; 3,9; 4,16; 5,25]

//the matrix
disp(m)

//first column
disp(m(:,1))

//second column
disp(m(:,1))

clf
plot( m(:,1), m(:,2), '*r')

