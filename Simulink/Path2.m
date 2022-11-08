clear; close all; clc; 

% Positions

%Path Coordinates
x = [2, 2, 1.6, 1.6, 2];
y = [0.5, -0.5, 0.5, 0, 0.5]; 
z = [1.6, 1.6, 0.9, 0.9, 1.6]; 
t = [0, 1, 2, 3, 4]; 


t_init = 0;
t_step = 1e-2; 

AA = zeros(18, 18); 
BB = zeros(18,1); 
CC = zeros(18,1); 
DD = zeros(18,1);

%Column 1 (1:5)
AA(1, 1:5) = F4(t(1)); 
AA(2, 1:5) = F4Dot(t(1));
AA(3,1:5) = F4DotDot(t(1));
AA(4,1:5) = F4(t(2));
AA(5,1:5) = F4(t(2));
AA(6,1:5) = F4Dot(t(2));
AA(7,1:5) = F4DotDot(t(2));

% Column 2 (6:9)
AA(5,6:9) = -F3(t(2));
AA(6,6:9) = -F3Dot(t(2));
AA(7,6:9) = -F3DotDot(t(2));
AA(8,6:9) = F3(t(3));
AA(9,6:9) = F3(t(3));
AA(10,6:9) = F3Dot(t(3));
AA(11,6:9) = F3DotDot(t(3));

% Column 3 (10:13)
AA(9, 10:13) = -F3(t(3));
AA(10, 10:13) = -F3Dot(t(3));
AA(11, 10:13) = -F3DotDot(t(3));
AA(12, 10:13) = F3(t(4));
AA(13, 10:13) = F3(t(4));
AA(14, 10:13) = F3Dot(t(4));
AA(15, 10:13) = F3DotDot(t(4));

% Column 4 (14:18)
AA(13, 14:18) = -F4(t(4));
AA(14, 14:18) = -F4Dot(t(4));
AA(15, 14:18) = -F4DotDot(t(4));
AA(16, 14:18) = F4(t(5));
AA(17, 14:18) = F4Dot(t(5));
AA(18, 14:18) = F4DotDot(t(5));

% Populate B vector
BB(1) = y(1);
BB(4) = y(2);
BB(8) = y(3);
BB(12) = y(4);
BB(16) = y(5); 


coef =  AA\BB; 

a = coef(1:5);
b = coef(6:9);
c = coef(10:13);
d = coef(14:18); 

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

function[out] = F5(t)
out = [1 t t.^2 t.^3 t.^4 t.^5];
end 

function[out] = F5Dot(t)
out = [0 1 2*t 3*t.^2 4*t.^3 5*t.^4];
end 

function[out] = F5DotDot(t)
out = [0 0 2 6*t 12*t.^2 20*t^3;];
end 

function [out] = F4(t) 
out =   [1   t    t.^2    t.^3     t.^4];
end

function [out] = F4Dot(t)
out =   [0   1    2*t    3*t.^2   4*t.^3];
end

function [out] = F4DotDot(t)
out = [0   0    2      6*t     12*t.^2];
end

function [out] = F3(t) 
out =   [1   t    t.^2    t.^3];
end

function [out] = F3Dot(t)
out =   [0   1    2*t    3*t.^2];
end

function [out] = F3DotDot(t)
out = [0   0    2      6*t];
end
