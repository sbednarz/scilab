// https://www.wolframalpha.com/input/?i=x%5E2%3D16


clf // to clear the plot area

// x^2 = 16

// prepare data for the plot
x=linspace(-10,10)
y=x^2


// plot the function (red line)
plot(x,y,'r')


// plot a point (marker) at x1,y1
// plot(x1, y1, 'o')
plot(-4,16, 'ro')
plot(4,16, 'ro')


// draw line from x1,y1 to x2,y2
// plot([x1,x2], [y1,y2])
plot([-10,10], [16,16], 'b')




