clear; close all; clc;

%Path Coordinates
P1 = [2 0.5 1.6];
P2 = [2 -0.5 1.6];
P3 = [1.6 0.5 0.9];
P4 = [1.6 0 0.9];
P5 = [2 0.5 1.6]; 

%3D plot of the points
scatter3(2, 0.5, 1.6); 
hold on
scatter3(2, -0.5, 1.6);
hold on
scatter3(1.6, 0.5, 0.9);
hold on
scatter3(1.6, 0, 0.9); 
hold on
scatter3(2, 0.5, 1.6); 
legend('P1', 'P2', 'P3', 'P4', 'P5'); 
grid on

%Position, velocity and acceleration
%P1
x1 = P1(1, 1); %meters
x1Dot = 0.0; % No velocity
x1DotDot = 0.0; % No acceleration -> robot is stationary in rest position

y1 = P1(1, 2);
y1Dot = 0.0;
y1DotDot = 0.0;

z1 = P1(1, 3);
z1Dot = 0.0;
z1DotDot = 0.0;

%P2
x2 = P2(1,1);
x2Dot = 0.1;
x2DotDot = 0.05; 

y2 = P2(1,2);
y2Dot = 0.3;
y2DotDot = 0.05; 

z2 = P2(1,3);
z2Dot = 0.1;
z2DotDot = 0.05; 

%P3
x3 = P3(1,1);
x3Dot = -0.1;
x3DotDot = -0.01;

y3 = P3(1,2);
y3Dot = 0.2;
y3DotDot = 0.05; 

z3 = P3(1,3);
z3Dot = 0.05;
z3DotDot = 0.02;

% P4
x4 = P4(1,1);
x4Dot = 0.1;
x4DotDot = 0.01;

y4 = P4(1,2);
y4Dot = 0.1;
y4DotDot = 0.01;

z4 = P4(1,3);
z4Dot = 0.1;
z4DotDot = 0.01;

%P5
x5 = P5(1,1); 
x5Dot = 0.0;
x5DotDot = 0.0;

y5 = P5(1,2);
y5Dot = 0.0;
y5DotDot = 0.0;

z5 = P5(1,3);
z5Dot = 0.0;
z5DotDot = 0.0; 

%Arbitary Constants (Timestamps for each point, t1, t2...)
T1 = 0;
T2 = 1;
T3 = 2;
T4 = 3;
T5 = 4; 

%Timeintervals for the piecewise curve fitting
dt = 0.01;

t1 = [T1:dt:T2];
t2 = [T2:dt:T3]; 
t3 = [T3:dt:T4]; 
t4 = [T4:dt:T5]; 

%Column vectors for the position, velocity and acceleration for each point
%including arbitary constants. Arbitary constants indicate position and
%velocity at the endpoint of each curve, i.e. position and velocity at the
%next point. For the last point, acceleration must also be included to make
%the robot stop as accurately as possible. 

%P1(t1) -> P1(t2)
X1 = [x1; x1Dot; x1DotDot; x2; x2Dot];
Y1 = [y1; y1Dot; y1DotDot; y2; y2Dot]; 
Z1 = [z1; z1Dot; z1DotDot; z2; z2Dot]; 

%P2(t2) -> P2(t3)
X2 = [x2; x2Dot; x2DotDot; x3; x3Dot];
Y2 = [y2; y2Dot; y2DotDot; y3; y3Dot]; 
Z2 = [z2; z2Dot; z2DotDot; z3; z3Dot];

%P3(t3) -> P3(t4)
X3 = [x3; x3Dot; x3DotDot; x4; x4Dot];
Y3 = [y3; y3Dot; y3DotDot; y4; y4Dot]; 
Z3 = [z3; z3Dot; z3DotDot; z4; z4Dot];

%P4(t4) -> P4(t5)
X4 = [x4; x4Dot; x4DotDot; x5; x5Dot; x5DotDot];
Y4 = [y4; y4Dot; y4DotDot; y5; y5Dot; y5DotDot]; 
Z4 = [z4; z4Dot; z4DotDot; z5; z5Dot; z5DotDot];

%Adding the matrices including the polynomials for each curve w/ its
%derivatives

F_1 = [1 T1 T1.^2 T1.^3 T1.^4;
       0 1 2*T1 3*T1.^2 4*T1.^3;
       0 0 2 6*T1 12*T1.^2;
       1 T2 T2.^2 T2.^3 T2.^4;
       0 1 2*T2 3*T2.^2 4*T2.^3]; 
   
F_2 = [1 T2 T2.^2 T2.^3 T2.^4;
       0 1 2*T2 3*T2.^2 4*T2.^3;
       0 0 2 6*T2 12*T2.^2;
       1 T3 T3.^2 T3.^3 T3.^4;
       0 1 2*T3 3*T3.^2 4*T3.^3]; 
   
F_3 = [1 T3 T3.^2 T3.^3 T3.^4;
       0 1 2*T3 3*T3.^2 4*T3.^3;
       0 0 2 6*T3 12*T3.^2;
       1 T4 T4.^2 T4.^3 T4.^4;
       0 1 2*T4 3*T4.^2 4*T4.^3];
   
F_4 = [1 T4 T4.^2 T4.^3 T4.^4 T4.^5;
       0 1 2*T4 3*T4.^2 4*T4.^3 5*T4.^4;
       0 0 2 6*T4 12*T4.^2 20*T4^3;
       1 T5 T5.^2 T5.^3 T5.^4 T5.^5;
       0 1 2*T5 3*T5.^2 4*T5.^3 5*T5^4;
       0 0 2 6*T4 12*T4.^2 20*T5.^3]; 
   
% Finding matrices of the unknowns for each point

AX1 = inv(F_1)*X1; 
AY1 = inv(F_1)*Y1;
AZ1 = inv(F_1)*Z1; 

BX2 = inv(F_2)*X2;
BY2 = inv(F_2)*Y2;
BZ2 = inv(F_2)*Z2;

CX3 = inv(F_3)*X3;
CY3 = inv(F_3)*Y3;
CZ3 = inv(F_3)*Z3;

DX4 = inv(F_4)*X4;
DY4 = inv(F_4)*Y4;
DZ4 = inv(F_4)*Z4; 

% Setting up the polynomial equations for each point in XYZ
%P1 at t = t1
X_p1 = AX1(1) + AX1(2)*t1 + AX1(3)*t1.^2 + AX1(4)*t1.^3 + AX1(5)*t1.^4; 
Y_p1 = AY1(1) + AY1(2)*t1 + AY1(3)*t1.^2 + AY1(4)*t1.^3 + AY1(5)*t1.^4; 
Z_p1 = AZ1(1) + AZ1(2)*t1 + AZ1(3)*t1.^2 + AZ1(4)*t1.^3 + AZ1(5)*t1.^4; 

%P2 at t = t2
X_p2 = BX2(1) + BX2(2)*t2 + BX2(3)*t2.^2 + BX2(4)*t2.^3 + BX2(5)*t2.^4; 
Y_p2 = BY2(1) + BY2(2)*t2 + BY2(3)*t2.^2 + BY2(4)*t2.^3 + BY2(5)*t2.^4; 
Z_p2 = BZ2(1) + BZ2(2)*t2 + BZ2(3)*t2.^2 + BZ2(4)*t2.^3 + BZ2(5)*t2.^4; 

% P3 at t = t3
X_p3 = CX3(1) + CX3(2)*t3 + CX3(3)*t3.^2 + CX3(4)*t3.^3 + CX3(5)*t3.^4; 
Y_p3 = CY3(1) + CY3(2)*t3 + CY3(3)*t3.^2 + CY3(4)*t3.^3 + CY3(5)*t3.^4; 
Z_p3 = CZ3(1) + CZ3(2)*t3 + CZ3(3)*t3.^2 + CZ3(4)*t3.^3 + CZ3(5)*t3.^4;

% P4 at t = t4
X_p4 = DX4(1) + DX4(2)*t4 + DX4(3)*t4.^2 + DX4(4)*t4.^3 + DX4(5)*t4.^4 + DX4(6)*t4.^5; 
Y_p4 = DY4(1) + DY4(2)*t4 + DY4(3)*t4.^2 + DY4(4)*t4.^3 + DY4(5)*t4.^4 + DY4(6)*t4.^5; 
Z_p4 = DZ4(1) + DZ4(2)*t4 + DZ4(3)*t4.^2 + DZ4(4)*t4.^3 + DZ4(5)*t4.^4 + DZ4(6)*t4.^5; 

figure
plot3(X_p1, Y_p1, Z_p1);
hold on
plot3(X_p2, Y_p2, Z_p2); 
hold on
plot3(X_p3, Y_p3, Z_p3);
hold on
plot3(X_p4, Y_p4, Z_p4); 
grid on
legend('P1(t)', 'P2(t)', 'P3(t)', 'P4(t)'); 
