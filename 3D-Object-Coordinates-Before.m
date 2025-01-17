format short g
clc; clear all; close all;
% GIVEN DATA FOR LEFT AND RIGHT IMAGES 
line_offL=+002946.00;sample_offL=+002675.00;lat_offL=+15.78280000;long_offL=+032.50710000;H_offL=+0394.000;
line_scaL=+002947.00;sample_scaL=+002676.00;lat_scaL=+00.02680000;long_scaL=+000.02510000;H_scaL=+0064.000;
line_offR=+003002.00;sample_offR=+002678.00;lat_offR=+15.78230000;long_offR=+032.50710000;H_offR=+0394.000;
line_scaR=+003002.00;sample_scaR=+002679.00;lat_scaR=+00.02730000;long_scaR=+000.02510000;H_scaR=+0064.000;
% LOAD GROUND CONTROL POINTS, IMAGE COORDINATES, AND RPCS
Obs = load('I:\Tamer\IKONOS\WGS84_Obse.txt'); % Observed Ground Coordinates.
MIC_L = load('I:\Tamer\IKONOS\MIC_L.txt'); % Measured Image Coordinates (Left).
MIC_R = load('I:\Tamer\IKONOS\MIC_R.txt'); % Measured Image Coordinates (Right).
C = load('I:\Tamer\IKONOS\Coeff.txt'); % Polynomial Coefficients.
N = length(Obs);
% NORMALIZATION FOR CONTROL POINTS
for i = 1 : N;
XL(i)=(Obs(i,2)-long_offL)/long_scaL;
YL(i)=(Obs(i,3)-lat_offL)/lat_scaL;
ZL(i)=(Obs(i,4)-H_offL)/H_scaL;
XR(i)=(Obs(i,2)-long_offR)/long_scaR;
YR(i)=(Obs(i,3)-lat_offR)/lat_scaR;
ZR(i)=(Obs(i,4)-H_offR)/H_scaR;
xnL(i)=((MIC_L(i,2))-(sample_offL))/(sample_scaL);
ynL(i)=((MIC_L(i,3))-(line_offL))/(line_scaL);
xnR(i)=((MIC_R(i,2))-(sample_offR))/(sample_scaR);
ynR(i)=((MIC_R(i,3))-(line_offR))/(line_scaR);
end 
% THE POLYNOMIAL FORM IS AS FOLLOWS
for i = 1 : N;
F1(i) = ((C(2,1)-(ynL(i)*C(2,2)))*(XL(i)))+((C(3,1)-(ynL(i)*C(3,2)))*(YL(i)))+...
    ((C(4,1)-(ynL(i)*C(4,2)))*(ZL(i)))+((C(5,1)-(ynL(i)*C(5,2)))*(XL(i)*YL(i)))+...
    ((C(6,1)-(ynL(i)*C(6,2)))*(XL(i)*ZL(i)))+((C(7,1)-(ynL(i)*C(7,2)))*(YL(i)*ZL(i)))+...
    ((C(8,1)-(ynL(i)*C(8,2)))*(XL(i)*XL(i)))+((C(9,1)-(ynL(i)*C(9,2)))*(YL(i)*YL(i)))+...
    ((C(10,1)-(ynL(i)*C(10,2)))*(ZL(i)*ZL(i)))+((C(11,1)-(ynL(i)*C(11,2)))*(XL(i)*YL(i)*ZL(i)))+...
    ((C(12,1)-(ynL(i)*C(12,2)))*(XL(i)*XL(i)*XL(i)))+((C(13,1)-(ynL(i)*C(13,2)))*(XL(i)*YL(i)*YL(i)))+...
    ((C(14,1)-(ynL(i)*C(14,2)))*(XL(i)*ZL(i)*ZL(i)))+((C(15,1)-(ynL(i)*C(15,2)))*(YL(i)*XL(i)*XL(i)))+...
    ((C(16,1)-(ynL(i)*C(16,2)))*(YL(i)*YL(i)*YL(i)))+((C(17,1)-(ynL(i)*C(17,2)))*(YL(i)*ZL(i)*ZL(i)))+...
    ((C(18,1)-(ynL(i)*C(18,2)))*(XL(i)*XL(i)*ZL(i)))+((C(19,1)-(ynL(i)*C(19,2)))*(YL(i)*YL(i)*ZL(i)))+...
    ((C(20,1)-(ynL(i)*C(20,2)))*(ZL(i)*ZL(i)*ZL(i)));
F2(i) = ((C(2,3)-(xnL(i)*C(2,4)))*(XL(i)))+((C(3,3)-(xnL(i)*C(3,4)))*(YL(i)))+...
    ((C(4,3)-(xnL(i)*C(4,4)))*(ZL(i)))+((C(5,3)-(xnL(i)*C(5,4)))*(XL(i)*YL(i)))+...
    ((C(6,3)-(xnL(i)*C(6,4)))*(XL(i)*ZL(i)))+((C(7,3)-(xnL(i)*C(7,4)))*(YL(i)*ZL(i)))+...
    ((C(8,3)-(xnL(i)*C(8,4)))*(XL(i)*XL(i)))+((C(9,3)-(xnL(i)*C(9,4)))*(YL(i)*YL(i)))+...
    ((C(10,3)-(xnL(i)*C(10,4)))*(ZL(i)*ZL(i)))+((C(11,3)-(xnL(i)*C(11,4)))*(XL(i)*YL(i)*ZL(i)))+...
    ((C(12,3)-(xnL(i)*C(12,4)))*(XL(i)*XL(i)*XL(i)))+((C(13,3)-(xnL(i)*C(13,4)))*(XL(i)*YL(i)*YL(i)))+...
    ((C(14,3)-(xnL(i)*C(14,4)))*(XL(i)*ZL(i)*ZL(i)))+((C(15,3)-(xnL(i)*C(15,4)))*(YL(i)*XL(i)*XL(i)))+...
    ((C(16,3)-(xnL(i)*C(16,4)))*(YL(i)*YL(i)*YL(i)))+((C(17,3)-(xnL(i)*C(17,4)))*(YL(i)*ZL(i)*ZL(i)))+...
    ((C(18,3)-(xnL(i)*C(18,4)))*(XL(i)*XL(i)*ZL(i)))+((C(19,3)-(xnL(i)*C(19,4)))*(YL(i)*YL(i)*ZL(i)))+...
    ((C(20,3)-(xnL(i)*C(20,4)))*(ZL(i)*ZL(i)*ZL(i)));
F3(i) = ((C(2,5)-(ynR(i)*C(2,6)))*(XR(i)))+((C(3,5)-(ynR(i)*C(3,6)))*(YR(i)))+...
    ((C(4,5)-(ynR(i)*C(4,6)))*(ZR(i)))+((C(5,5)-(ynR(i)*C(5,6)))*(XR(i)*YR(i)))+...
    ((C(6,5)-(ynR(i)*C(6,6)))*(XR(i)*ZR(i)))+((C(7,5)-(ynR(i)*C(7,6)))*(YR(i)*ZR(i)))+...
    ((C(8,5)-(ynR(i)*C(8,6)))*(XR(i)*XR(i)))+((C(9,5)-(ynR(i)*C(9,6)))*(YR(i)*YR(i)))+...
    ((C(10,5)-(ynR(i)*C(10,6)))*(ZR(i)*ZR(i)))+((C(11,5)-(ynR(i)*C(11,6)))*(XR(i)*YR(i)*ZR(i)))+...
    ((C(12,5)-(ynR(i)*C(12,6)))*(XR(i)*XR(i)*XR(i)))+((C(13,5)-(ynR(i)*C(13,6)))*(XR(i)*YR(i)*YR(i)))+...
    ((C(14,5)-(ynR(i)*C(14,6)))*(XR(i)*ZR(i)*ZR(i)))+((C(15,5)-(ynR(i)*C(15,6)))*(YR(i)*XR(i)*XR(i)))+...
    ((C(16,5)-(ynR(i)*C(16,6)))*(YR(i)*YR(i)*YR(i)))+((C(17,5)-(ynR(i)*C(17,6)))*(YR(i)*ZR(i)*ZR(i)))+...
    ((C(18,5)-(ynR(i)*C(18,6)))*(XR(i)*XR(i)*ZR(i)))+((C(19,5)-(ynR(i)*C(19,6)))*(YR(i)*YR(i)*ZR(i)))+...
    ((C(20,5)-(ynR(i)*C(20,6)))*(ZR(i)*ZR(i)*ZR(i)));
F4(i) = ((C(2,7)-(xnR(i)*C(2,8)))*(XR(i)))+((C(3,7)-(xnR(i)*C(3,8)))*(YR(i)))+...
    ((C(4,7)-(xnR(i)*C(4,8)))*(ZR(i)))+((C(5,7)-(xnR(i)*C(5,8)))*(XR(i)*YR(i)))+...
    ((C(6,7)-(xnR(i)*C(6,8)))*(XR(i)*ZR(i)))+((C(7,7)-(xnR(i)*C(7,8)))*(YR(i)*ZR(i)))+...
    ((C(8,7)-(xnR(i)*C(8,8)))*(XR(i)*XR(i)))+((C(9,7)-(xnR(i)*C(9,8)))*(YR(i)*YR(i)))+...
    ((C(10,7)-(xnR(i)*C(10,8)))*(ZR(i)*ZR(i)))+((C(11,7)-(xnR(i)*C(11,8)))*(XR(i)*YR(i)*ZR(i)))+...
    ((C(12,7)-(xnR(i)*C(12,8)))*(XR(i)*XR(i)*XR(i)))+((C(13,7)-(xnR(i)*C(13,8)))*(XR(i)*YR(i)*YR(i)))+...
    ((C(14,7)-(xnR(i)*C(14,8)))*(XR(i)*ZR(i)*ZR(i)))+((C(15,7)-(xnR(i)*C(15,8)))*(YR(i)*XR(i)*XR(i)))+...
    ((C(16,7)-(xnR(i)*C(16,8)))*(YR(i)*YR(i)*YR(i)))+((C(17,7)-(xnR(i)*C(17,8)))*(YR(i)*ZR(i)*ZR(i)))+...
    ((C(18,7)-(xnR(i)*C(18,8)))*(XR(i)*XR(i)*ZR(i)))+((C(19,7)-(xnR(i)*C(19,8)))*(YR(i)*YR(i)*ZR(i)))+...
    ((C(20,7)-(xnR(i)*C(20,8)))*(ZR(i)*ZR(i)*ZR(i)));   
end
for i = 1 : N;
% PARTIAL DERIVATIVES 
F1_X(i) = ((C(2,1)-((ynL(i))*C(2,2))))+(((C(5,1)-((ynL(i))*C(5,2))))*(YL(i)))+...
    (((C(6,1)-((ynL(i))*C(6,2))))*(ZL(i)))+((2*(C(8,1)-((ynL(i))*C(8,2)))*(XL(i))))+...
    (((C(11,1)-((ynL(i))*C(11,2)))*(YL(i)*ZL(i))))+((3*(C(12,1)-((ynL(i))*C(12,2)))*(XL(i)*XL(i))))+...
    (((C(13,1)-((ynL(i))*C(13,2)))*(YL(i)*YL(i))))+(((C(14,1)-((ynL(i))*C(14,2)))*(ZL(i)*ZL(i))))+...
    ((2*(C(15,1)-((ynL(i))*C(15,2)))*(XL(i)*YL(i))))+((2*(C(18,1)-((ynL(i))*C(18,2)))*(XL(i)*ZL(i))));
F1_Y(i) = ((C(3,1)-((ynL(i))*C(3,2))))+(((C(5,1)-((ynL(i))*C(5,2))))*(XL(i)))+...
    (((C(7,1)-((ynL(i))*C(7,2))))*(ZL(i)))+((2*(C(9,1)-((ynL(i))*C(9,2)))*(YL(i))))+...
    (((C(11,1)-((ynL(i))*C(11,2)))*(XL(i)*ZL(i))))+((2*(C(13,1)-((ynL(i))*C(13,2)))*(XL(i)*YL(i))))+...
    (((C(15,1)-((ynL(i))*C(15,2)))*(XL(i)*XL(i))))+((3*(C(16,1)-((ynL(i))*C(16,2)))*(YL(i)*YL(i))))+...
    (((C(17,1)-((ynL(i))*C(17,2)))*(ZL(i)*ZL(i))))+((2*(C(19,1)-((ynL(i))*C(19,2)))*(YL(i)*ZL(i)))); 
F1_Z(i) = ((C(4,1)-((ynL(i))*C(4,2))))+(((C(6,1)-((ynL(i))*C(6,2))))*(XL(i)))+...
    (((C(7,1)-((ynL(i))*C(7,2))))*(YL(i)))+((2*(C(10,1)-((ynL(i))*C(10,2)))*(ZL(i))))+...
    (((C(11,1)-((ynL(i))*C(11,2)))*(XL(i)*YL(i))))+((2*(C(14,1)-((ynL(i))*C(14,2)))*(XL(i)*ZL(i))))+...
    ((2*(C(17,1)-((ynL(i))*C(17,2)))*(YL(i)*ZL(i))))+(((C(18,1)-((ynL(i))*C(18,2)))*(XL(i)*XL(i))))+...
    (((C(19,1)-((ynL(i))*C(19,2)))*(YL(i)*YL(i))))+((3*(C(20,1)-((ynL(i))*C(20,2)))*(ZL(i)*ZL(i))));
F2_X(i) = ((C(2,3)-((xnL(i))*C(2,4))))+(((C(5,3)-((xnL(i))*C(5,4))))*(YL(i)))+...
    (((C(6,3)-((xnL(i))*C(6,4))))*(ZL(i)))+((2*(C(8,3)-((xnL(i))*C(8,4)))*(XL(i))))+...
    (((C(11,3)-((xnL(i))*C(11,4)))*(YL(i)*ZL(i))))+((3*(C(12,3)-((xnL(i))*C(12,4)))*(XL(i)*XL(i))))+...
    (((C(13,3)-((xnL(i))*C(13,4)))*(YL(i)*YL(i))))+(((C(14,3)-((xnL(i))*C(14,4)))*(ZL(i)*ZL(i))))+...
    ((2*(C(15,3)-((xnL(i))*C(15,4)))*(XL(i)*YL(i))))+((2*(C(18,3)-((xnL(i))*C(18,4)))*(XL(i)*ZL(i))));
F2_Y(i) = ((C(3,3)-((xnL(i))*C(3,4))))+(((C(5,3)-((xnL(i))*C(5,4))))*(XL(i)))+...
    (((C(7,3)-((xnL(i))*C(7,4))))*(ZL(i)))+((2*(C(9,3)-((xnL(i))*C(9,4)))*(YL(i))))+...
    (((C(11,3)-((xnL(i))*C(11,4)))*(XL(i)*ZL(i))))+((2*(C(13,3)-((xnL(i))*C(13,4)))*(XL(i)*YL(i))))+...
    (((C(15,3)-((xnL(i))*C(15,4)))*(XL(i)*XL(i))))+((3*(C(16,3)-((xnL(i))*C(16,4)))*(YL(i)*YL(i))))+...
    (((C(17,3)-((xnL(i))*C(17,4)))*(ZL(i)*ZL(i))))+((2*(C(19,3)-((xnL(i))*C(19,4)))*(YL(i)*ZL(i))));
F2_Z(i) = ((C(4,3)-((xnL(i))*C(4,4))))+(((C(6,3)-((xnL(i))*C(6,4))))*(XL(i)))+...
    (((C(7,3)-((xnL(i))*C(7,4))))*(YL(i)))+((2*(C(10,3)-((xnL(i))*C(10,4)))*(ZL(i))))+...
    (((C(11,3)-((xnL(i))*C(11,4)))*(XL(i)*YL(i))))+((2*(C(14,3)-((xnL(i))*C(14,4)))*(XL(i)*ZL(i))))+...
    ((2*(C(17,3)-((xnL(i))*C(17,4)))*(YL(i)*ZL(i))))+(((C(18,3)-((xnL(i))*C(18,4)))*(XL(i)*XL(i))))+...
    (((C(19,3)-((xnL(i))*C(19,4)))*(YL(i)*YL(i))))+((3*(C(20,3)-((xnL(i))*C(20,4)))*(ZL(i)*ZL(i))));
F3_X(i) = ((C(2,5)-((ynR(i))*C(2,6))))+(((C(5,5)-((ynR(i))*C(5,6))))*(YR(i)))+...
    (((C(6,5)-((ynR(i))*C(6,6))))*(ZR(i)))+((2*(C(8,5)-((ynR(i))*C(8,6)))*(XR(i))))+...
    (((C(11,5)-((ynR(i))*C(11,6)))*(YR(i)*ZR(i))))+((3*(C(12,5)-((ynR(i))*C(12,6)))*(XR(i)*XR(i))))+...
    (((C(13,5)-((ynR(i))*C(13,6)))*(YR(i)*YR(i))))+(((C(14,5)-((ynR(i))*C(14,6)))*(ZR(i)*ZR(i))))+...
    ((2*(C(15,5)-((ynR(i))*C(15,6)))*(XR(i)*YR(i))))+((2*(C(18,5)-((ynR(i))*C(18,6)))*(XR(i)*ZR(i))));
F3_Y(i) = ((C(3,5)-((ynR(i))*C(3,6))))+(((C(5,5)-((ynR(i))*C(5,6))))*(XR(i)))+...
    (((C(7,5)-((ynR(i))*C(7,6))))*(ZR(i)))+((2*(C(9,5)-((ynR(i))*C(9,6)))*(YR(i))))+...
    (((C(11,5)-((ynR(i))*C(11,6)))*(XR(i)*ZR(i))))+((2*(C(13,5)-((ynR(i))*C(13,6)))*(XR(i)*YR(i))))+...
    (((C(15,5)-((ynR(i))*C(15,6)))*(XR(i)*XR(i))))+((3*(C(16,5)-((ynR(i))*C(16,6)))*(YR(i)*YR(i))))+...
    (((C(17,5)-((ynR(i))*C(17,6)))*(ZR(i)*ZR(i))))+((2*(C(19,5)-((ynR(i))*C(19,6)))*(YR(i)*ZR(i)))); 
F3_Z(i) = ((C(4,5)-((ynR(i))*C(4,6))))+(((C(6,5)-((ynR(i))*C(6,6))))*(XR(i)))+...
    (((C(7,5)-((ynR(i))*C(7,6))))*(YR(i)))+((2*(C(10,5)-((ynR(i))*C(10,6)))*(ZR(i))))+...
    (((C(11,5)-((ynR(i))*C(11,6)))*(XR(i)*YR(i))))+((2*(C(14,5)-((ynR(i))*C(14,6)))*(XR(i)*ZR(i))))+...
    ((2*(C(17,5)-((ynR(i))*C(17,6)))*(YR(i)*ZR(i))))+(((C(18,5)-((ynR(i))*C(18,6)))*(XR(i)*XR(i))))+...
    (((C(19,5)-((ynR(i))*C(19,6)))*(YR(i)*YR(i))))+((3*(C(20,5)-((ynR(i))*C(20,6)))*(ZR(i)*ZR(i))));
F4_X(i) = ((C(2,7)-((xnR(i))*C(2,8))))+(((C(5,7)-((xnR(i))*C(5,8))))*(YR(i)))+...
    (((C(6,7)-((xnR(i))*C(6,8))))*(ZR(i)))+((2*(C(8,7)-((xnR(i))*C(8,8)))*(XR(i))))+...
    (((C(11,7)-((xnR(i))*C(11,8)))*(YR(i)*ZR(i))))+((3*(C(12,7)-((xnR(i))*C(12,8)))*(XR(i)*XR(i))))+...
    (((C(13,7)-((xnR(i))*C(13,8)))*(YR(i)*YR(i))))+(((C(14,7)-((xnR(i))*C(14,8)))*(ZR(i)*ZR(i))))+...
    ((2*(C(15,7)-((xnR(i))*C(15,8)))*(XR(i)*YR(i))))+((2*(C(18,7)-((xnR(i))*C(18,8)))*(XR(i)*ZR(i))));
F4_Y(i) = ((C(3,7)-((xnR(i))*C(3,8))))+(((C(5,7)-((xnR(i))*C(5,8))))*(XR(i)))+...
    (((C(7,7)-((xnR(i))*C(7,8))))*(ZR(i)))+((2*(C(9,7)-((xnR(i))*C(9,8)))*(YR(i))))+...
    (((C(11,7)-((xnR(i))*C(11,8)))*(XR(i)*ZR(i))))+((2*(C(13,7)-((xnR(i))*C(13,8)))*(XR(i)*YR(i))))+...
    (((C(15,7)-((xnR(i))*C(15,8)))*(XR(i)*XR(i))))+((3*(C(16,7)-((xnR(i))*C(16,8)))*(YR(i)*YR(i))))+...
    (((C(17,7)-((xnR(i))*C(17,8)))*(ZR(i)*ZR(i))))+((2*(C(19,7)-((xnR(i))*C(19,8)))*(YR(i)*ZR(i))));
F4_Z(i) = ((C(4,7)-((xnR(i))*C(4,8))))+(((C(6,7)-((xnR(i))*C(6,8))))*(XR(i)))+...
    (((C(7,7)-((xnR(i))*C(7,8))))*(YR(i)))+((2*(C(10,7)-((xnR(i))*C(10,8)))*(ZR(i))))+...
    (((C(11,7)-((xnR(i))*C(11,8)))*(XR(i)*YR(i))))+((2*(C(14,7)-((xnR(i))*C(14,8)))*(XR(i)*ZR(i))))+...
    ((2*(C(17,7)-((xnR(i))*C(17,8)))*(YR(i)*ZR(i))))+(((C(18,7)-((xnR(i))*C(18,8)))*(XR(i)*XR(i))))+...
    (((C(19,7)-((xnR(i))*C(19,8)))*(YR(i)*YR(i))))+((3*(C(20,7)-((xnR(i))*C(20,8)))*(ZR(i)*ZR(i))));
end
% STRUCTURE OF JACOBIAN MATRIX OR B-MATRIX
r = 4*N-3*N;
B = zeros(4*N,3*N);
K = zeros(4*N,1);
a = 1;
for i = 1 : 4 : 4*N
    a = a;
    B(i:i+3,i:i+2) = [F1_X(a) F1_Y(a) F1_Z(a);
                      F2_X(a) F2_Y(a) F2_Z(a);
                      F3_X(a) F3_Y(a) F3_Z(a);
                      F4_X(a) F4_Y(a) F4_Z(a);];
    K(i:i+3,1) =     [(ynL(a)-C(1,1))-F1(a);
                      (xnL(a)-C(1,3))-F2(a);
                      (ynR(a)-C(1,5))-F3(a);
                      (xnR(a)-C(1,7))-F4(a);];
    a = a+1;
end
f = 4 : 4 : (4*N - 1);
B(:,f) = [];
K(:,1+(4*N):4:4) = [];
DX = (inv(B'*B))*(B'*K);
Vs = B*DX - K;
dx = DX(1:3:end);
dy = DX(2:3:end);
dz = DX(3:3:end);
dxyz = [dx dy dz];
% ENHANCED COORDINATES 
for i = 1 : N;
X_GPS(i) = Obs(i,2);
Y_GPS(i) = Obs(i,3);
Z_GPS(i) = Obs(i,4);
XL_Enh(i)= XL(i)+dx(i);
YL_Enh(i)= YL(i)+dy(i);
ZL_Enh(i)= ZL(i)+dz(i);
XR_Enh(i)= XR(i)+dx(i);
YR_Enh(i)= YR(i)+dy(i);
ZR_Enh(i)= ZR(i)+dz(i);
XL_act(i)=(XL_Enh(i)*(long_scaL))+long_offL;
YL_act(i)=(YL_Enh(i)*(lat_scaL))+lat_offL;
ZL_act(i)=(ZL_Enh(i)*(H_scaL))+H_offL;
XR_act(i)=(XR_Enh(i)*(long_scaR))+long_offR;
YR_act(i)=(YR_Enh(i)*(lat_scaR))+lat_offR;
ZR_act(i)=(ZR_Enh(i)*(H_scaR))+H_offR;
X_act(i)= (XL_act(i) + XR_act(i))/2;
Y_act(i)= (YL_act(i) + YR_act(i))/2;
Z_act(i)= (ZL_act(i) + ZR_act(i))/2;
residual_X(i) = (X_GPS(i)-X_act(i));
residual_Y(i) = (Y_GPS(i)-Y_act(i));
residual_Z(i) = (Z_GPS(i)-Z_act(i));
end 
X_Ref = X_act';
Y_Ref = Y_act';
Z_Ref = Z_act';
XYZ = [X_Ref Y_Ref Z_Ref];
rX = residual_X';
rY = residual_Y';
rZ = residual_Z';
residuals = [rX rY rZ];
RMSE_X = (sqrt(sum(rX'*rX)/N))*60*60*30;
RMSE_Y = (sqrt(sum(rY'*rY)/N))*60*60*30;
RMSE_Z = sqrt(sum(rZ'*rZ)/N);
RMSE_XYZ = [RMSE_X RMSE_Y RMSE_Z]
figure;
plot(Z_GPS','r+');hold on;
plot(Z_Ref,'b+');hold on;
xlabel 'GCPs', ylabel 'Elevation in (meters)';
legend('true value','Bias');
sX = std(rX)*60*60*30;
sY = std(rY)*60*60*30;
sZ = std(rZ);
stan_de = [sX sY sZ];
X_G = X_GPS'*60*60*30;
Y_G = Y_GPS'*60*60*30;
figure;
quiver(X_G,Y_G,(rX*60*60*30),(rY*60*60*30),'b','LineWidth',1,'AutoScaleFactor',1);
hold on; plot(X_G, Y_G,'ro');hold off;
xlabel 'X-Coordinate (meters)', ylabel 'Y-Coordinate (meters)';
legend('Bias','true value');

