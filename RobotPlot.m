
x_error = get(out, "x_error");
y_error = get(out, "y_error"); 
z_error = get(out, "z_error"); 
time = get(out, 'tout'); 

x_e = x_error(1, :) * 10^3; 
y_e = y_error(1, :) * 10^3; 
z_e = z_error(1, :) * 10^3; 

figure
plot(time, x_e); 

figure
plot(time, y_e); 

figure
plot(time, z_e)





