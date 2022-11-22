time = get(out, "tout");
b1 = get(out, "B1_ref"); 
b1_r = get(out, "B1_real");

b2 = get(out, "B2_ref");
b2_r = get(out, "B2_real"); 

g = get(out, "G_ref");
g_r = get(out, "G_real"); 

h = get(out, "H_ref"); 
h_r = get(out, "H_real"); 

i = get(out, "I_ref"); 
i_r = get(out, "I_real"); 

a = get(out, "A_ref");
a_r = get(out, "A_real"); 

B1_ref = rad2deg(b1(1, :)); 
B1_real = rad2deg(b1_r(1, :)); 
B2_ref = rad2deg(b2(1, :)); 
B2_real = rad2deg(b2_r(1, :)); 
G_ref = rad2deg(g(1, :)); 
G_real = rad2deg(g_r(1, :)); 
H_ref = rad2deg(h(1, :)); 
H_real = rad2deg(h_r(1, :)); 
I_ref = rad2deg(i(1, :)); 
I_real = rad2deg(i_r(1, :));
A_ref = rad2deg(a(1, :));
A_real = rad2deg(a_r(1, :)); 

% Plots
figure
plot(time, B1_ref); 
hold on
plot(time, B1_real);
xlabel('Time in seconds');
ylabel('Angle in degrees');
legend('HOG angle', 'Real angle')
title('Joint B1')
grid on;

figure
plot(time, B2_ref); 
hold on
plot(time, B2_real);
xlabel('Time in seconds');
ylabel('Angle in degrees');
legend('HOG angle', 'Real angle')
title('Joint B2')
grid on;

figure
plot(time, G_ref); 
hold on
plot(time, G_real);
xlabel('Time in seconds');
ylabel('Angle in degrees');
legend('HOG angle', 'Real angle')
title('Joint G')
grid on;

figure
plot(time, H_ref); 
hold on
plot(time, H_real);
xlabel('Time in seconds');
ylabel('Angle in degrees');
legend('HOG angle', 'Real angle')
title('Joint H')
grid on;

figure
plot(time, I_ref); 
hold on
plot(time, I_real);
xlabel('Time in seconds');
ylabel('Angle in degrees');
legend('HOG angle', 'Real angle')
title('Joint I'); 
grid on;

figure
plot(time, A_ref); 
hold on
plot(time, A_real);
xlabel('Time in seconds');
ylabel('Angle in degrees');
legend('HOG angle', 'Real angle')
title('Joint A'); 
grid on;

%% Errors
x_error = get(out, "x_error");
y_error = get(out, "y_error"); 
z_error = get(out, "z_error"); 
time = get(out, 'tout'); 

x_e = x_error(1, :); 
y_e = y_error(1, :); 
z_e = z_error(1, :); 

figure
plot(time, x_e, 'LineWidth', 1.5, 'Color', 'r'); 
xlabel('Time in seconds')
ylabel('Error in mm')

hold on
plot(2, x_e(881), 'bo', 'LineWidth', 2);
hold on
plot(4, x_e(1893), 'bo', 'LineWidth', 2);
hold on
plot(6, x_e(2308), 'bo', 'LineWidth', 2);
hold on
plot(8, x_e(3078), 'bo', 'LineWidth', 2);

legend('x error', 'Point 1', 'Point 2', 'Point 3', 'Point 4')
grid on

figure
plot(time, y_e, 'LineWidth', 1.5, 'Color', 'b'); 
xlabel('Time in seconds')
ylabel('Error in mm')
hold on
plot(2, y_e(881), 'ko', 'LineWidth', 2);
hold on
plot(4, y_e(1893), 'ko', 'LineWidth', 2);
hold on
plot(6, y_e(2308), 'ko', 'LineWidth', 2);
hold on
plot(8, y_e(3078), 'ko', 'LineWidth', 2);
legend('y error', 'Point 1', 'Point 2', 'Point 3', 'Point 4')
grid on

figure
plot(time, z_e, 'LineWidth', 1.5, 'Color', 'k')
xlabel('Time in seconds')
ylabel('Error in mm')

hold on
plot(2, z_e(881), 'ro', 'LineWidth', 2);
hold on
plot(4, z_e(1893), 'ro', 'LineWidth', 2);
hold on
plot(6, z_e(2308), 'ro', 'LineWidth', 2);
hold on
plot(8, z_e(3078), 'ro', 'LineWidth', 2);
legend('z error', 'Point 1', 'Point 2', 'Point 3', 'Point 4')
grid on

%% Angle errors

time1 = get(out, "tout");
l7 = get(out, "L7Angle"); 
l8 = get(out, "L8angle"); 

l7_hor_ang = l7(1, 3, :); 
l7_ang = l7_hor_ang(1, :); 
l8_ang = l8(1, :); 

figure
plot(time1, l8_ang, 'LineWidth', 1.5); 
grid on
xlabel('Time in seconds')
ylabel('Angle in degrees')
title('Angle of L8')

figure
plot(time1, l7_ang, 'LineWidth', 1.5);
grid on
xlabel('Time in seconds')
ylabel('Angle in degrees')
title('L7 Horizontal angle')

