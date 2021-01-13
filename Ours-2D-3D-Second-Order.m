format short g
clc; clear all; close all;
% GIVEN DATA FOR LEFT AND RIGHT IMAGE 
line_offL=+002946.00;sample_offL=+002675.00;lat_offL=+15.78280000;long_offL=+032.50710000;H_offL=+0394.000;
line_scaL=+002947.00;sample_scaL=+002676.00;lat_scaL=+00.02680000;long_scaL=+000.02510000;H_scaL=+0064.000;
line_offR=+003002.00;sample_offR=+002678.00;lat_offR=+15.78230000;long_offR=+032.50710000;H_offR=+0394.000;
line_scaR=+003002.00;sample_scaR=+002679.00;lat_scaR=+00.02730000;long_scaR=+000.02510000;H_scaR=+0064.000;
% LOAD GCPS & ICS AND COEFF
Obs = load('I:\Tamer\IK\WGS84_Obse.txt'); % Observed Ground Coordinates.
MIC_L = load('I:\Tamer\IK\MIC_L.txt'); % Measured Image Coordinates (Left).
MIC_R = load('I:\Tamer\IK\MIC_R.txt'); % Measured Image Coordinates (Right).
C = load('I:\Tamer\IK\Coeff.txt'); % Polynomial Coefficients.
N = length(Obs);% NORMALIZATION FOR GCPs
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
% The Polynomial form is as follows 
for i = 1 : N;
P1L(i)= C(1,1)+C(2,1)*XL(i)+C(3,1)*YL(i)+C(4,1)*ZL(i)+C(5,1)*XL(i)*YL(i)+C(6,1)*XL(i)*ZL(i)+C(7,1)*YL(i)*ZL(i)+C(8,1)*XL(i)*XL(i)+C(9,1)*YL(i)*YL(i)+C(10,1)*ZL(i)*ZL(i)+C(11,1)*XL(i)*YL(i)*ZL(i)+C(12,1)*XL(i)*XL(i)*XL(i)+C(13,1)*XL(i)*YL(i)*YL(i)+C(14,1)*XL(i)*ZL(i)*ZL(i)+C(15,1)*YL(i)*XL(i)*XL(i)+C(16,1)*YL(i)*YL(i)*YL(i)+C(17,1)*YL(i)*ZL(i)*ZL(i)+C(18,1)*XL(i)*XL(i)*ZL(i)+C(19,1)*YL(i)*YL(i)*ZL(i)+C(20,1)*ZL(i)*ZL(i)*ZL(i);
P2L(i)= C(1,2)+C(2,2)*XL(i)+C(3,2)*YL(i)+C(4,2)*ZL(i)+C(5,2)*XL(i)*YL(i)+C(6,2)*XL(i)*ZL(i)+C(7,2)*YL(i)*ZL(i)+C(8,2)*XL(i)*XL(i)+C(9,2)*YL(i)*YL(i)+C(10,2)*ZL(i)*ZL(i)+C(11,2)*XL(i)*YL(i)*ZL(i)+C(12,2)*XL(i)*XL(i)*XL(i)+C(13,2)*XL(i)*YL(i)*YL(i)+C(14,2)*XL(i)*ZL(i)*ZL(i)+C(15,2)*YL(i)*XL(i)*XL(i)+C(16,2)*YL(i)*YL(i)*YL(i)+C(17,2)*YL(i)*ZL(i)*ZL(i)+C(18,2)*XL(i)*XL(i)*ZL(i)+C(19,2)*YL(i)*YL(i)*ZL(i)+C(20,2)*ZL(i)*ZL(i)*ZL(i);
P3L(i)= C(1,3)+C(2,3)*XL(i)+C(3,3)*YL(i)+C(4,3)*ZL(i)+C(5,3)*XL(i)*YL(i)+C(6,3)*XL(i)*ZL(i)+C(7,3)*YL(i)*ZL(i)+C(8,3)*XL(i)*XL(i)+C(9,3)*YL(i)*YL(i)+C(10,3)*ZL(i)*ZL(i)+C(11,3)*XL(i)*YL(i)*ZL(i)+C(12,3)*XL(i)*XL(i)*XL(i)+C(13,3)*XL(i)*YL(i)*YL(i)+C(14,3)*XL(i)*ZL(i)*ZL(i)+C(15,3)*YL(i)*XL(i)*XL(i)+C(16,3)*YL(i)*YL(i)*YL(i)+C(17,3)*YL(i)*ZL(i)*ZL(i)+C(18,3)*XL(i)*XL(i)*ZL(i)+C(19,3)*YL(i)*YL(i)*ZL(i)+C(20,3)*ZL(i)*ZL(i)*ZL(i);
P4L(i)= C(1,4)+C(2,4)*XL(i)+C(3,4)*YL(i)+C(4,4)*ZL(i)+C(5,4)*XL(i)*YL(i)+C(6,4)*XL(i)*ZL(i)+C(7,4)*YL(i)*ZL(i)+C(8,4)*XL(i)*XL(i)+C(9,4)*YL(i)*YL(i)+C(10,4)*ZL(i)*ZL(i)+C(11,4)*XL(i)*YL(i)*ZL(i)+C(12,4)*XL(i)*XL(i)*XL(i)+C(13,4)*XL(i)*YL(i)*YL(i)+C(14,4)*XL(i)*ZL(i)*ZL(i)+C(15,4)*YL(i)*XL(i)*XL(i)+C(16,4)*YL(i)*YL(i)*YL(i)+C(17,4)*YL(i)*ZL(i)*ZL(i)+C(18,4)*XL(i)*XL(i)*ZL(i)+C(19,4)*YL(i)*YL(i)*ZL(i)+C(20,4)*ZL(i)*ZL(i)*ZL(i);
P1R(i)= C(1,5)+C(2,5)*XR(i)+C(3,5)*YR(i)+C(4,5)*ZR(i)+C(5,5)*XR(i)*YR(i)+C(6,5)*XR(i)*ZR(i)+C(7,5)*YR(i)*ZR(i)+C(8,5)*XR(i)*XR(i)+C(9,5)*YR(i)*YR(i)+C(10,5)*ZR(i)*ZR(i)+C(11,5)*XR(i)*YR(i)*ZR(i)+C(12,5)*XR(i)*XR(i)*XR(i)+C(13,5)*XR(i)*YR(i)*YR(i)+C(14,5)*XR(i)*ZR(i)*ZR(i)+C(15,5)*YR(i)*XR(i)*XR(i)+C(16,5)*YR(i)*YR(i)*YR(i)+C(17,5)*YR(i)*ZR(i)*ZR(i)+C(18,5)*XR(i)*XR(i)*ZR(i)+C(19,5)*YR(i)*YR(i)*ZR(i)+C(20,5)*ZR(i)*ZR(i)*ZR(i);
P2R(i)= C(1,6)+C(2,6)*XR(i)+C(3,6)*YR(i)+C(4,6)*ZR(i)+C(5,6)*XR(i)*YR(i)+C(6,6)*XR(i)*ZR(i)+C(7,6)*YR(i)*ZR(i)+C(8,6)*XR(i)*XR(i)+C(9,6)*YR(i)*YR(i)+C(10,6)*ZR(i)*ZR(i)+C(11,6)*XR(i)*YR(i)*ZR(i)+C(12,6)*XR(i)*XR(i)*XR(i)+C(13,6)*XR(i)*YR(i)*YR(i)+C(14,6)*XR(i)*ZR(i)*ZR(i)+C(15,6)*YR(i)*XR(i)*XR(i)+C(16,6)*YR(i)*YR(i)*YR(i)+C(17,6)*YR(i)*ZR(i)*ZR(i)+C(18,6)*XR(i)*XR(i)*ZR(i)+C(19,6)*YR(i)*YR(i)*ZR(i)+C(20,6)*ZR(i)*ZR(i)*ZR(i);
P3R(i)= C(1,7)+C(2,7)*XR(i)+C(3,7)*YR(i)+C(4,7)*ZR(i)+C(5,7)*XR(i)*YR(i)+C(6,7)*XR(i)*ZR(i)+C(7,7)*YR(i)*ZR(i)+C(8,7)*XR(i)*XR(i)+C(9,7)*YR(i)*YR(i)+C(10,7)*ZR(i)*ZR(i)+C(11,7)*XR(i)*YR(i)*ZR(i)+C(12,7)*XR(i)*XR(i)*XR(i)+C(13,7)*XR(i)*YR(i)*YR(i)+C(14,7)*XR(i)*ZR(i)*ZR(i)+C(15,7)*YR(i)*XR(i)*XR(i)+C(16,7)*YR(i)*YR(i)*YR(i)+C(17,7)*YR(i)*ZR(i)*ZR(i)+C(18,7)*XR(i)*XR(i)*ZR(i)+C(19,7)*YR(i)*YR(i)*ZR(i)+C(20,7)*ZR(i)*ZR(i)*ZR(i);
P4R(i)= C(1,8)+C(2,8)*XR(i)+C(3,8)*YR(i)+C(4,8)*ZR(i)+C(5,8)*XR(i)*YR(i)+C(6,8)*XR(i)*ZR(i)+C(7,8)*YR(i)*ZR(i)+C(8,8)*XR(i)*XR(i)+C(9,8)*YR(i)*YR(i)+C(10,8)*ZR(i)*ZR(i)+C(11,8)*XR(i)*YR(i)*ZR(i)+C(12,8)*XR(i)*XR(i)*XR(i)+C(13,8)*XR(i)*YR(i)*YR(i)+C(14,8)*XR(i)*ZR(i)*ZR(i)+C(15,8)*YR(i)*XR(i)*XR(i)+C(16,8)*YR(i)*YR(i)*YR(i)+C(17,8)*YR(i)*ZR(i)*ZR(i)+C(18,8)*XR(i)*XR(i)*ZR(i)+C(19,8)*YR(i)*YR(i)*ZR(i)+C(20,8)*ZR(i)*ZR(i)*ZR(i);
lnL(i)=P1L(i)/P2L(i);
snL(i)=P3L(i)/P4L(i);
lnR(i)=P1R(i)/P2R(i);
snR(i)=P3R(i)/P4R(i);
end
n = 7;
d = n + 1;
Chk = N - n;
m = 24;
r = 4*n-m;
NP = 6;
A = zeros(4*n,(((NP-1)*4)+4));
a = 1;
for i = 1 : 4 : 4*n
    a = a;
    A(i:i+3,:) = [1 lnL(a) snL(a) lnL(a)*lnL(a) lnL(a)*snL(a) snL(a)*snL(a) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 1 snL(a) lnL(a) snL(a)*snL(a) snL(a)*lnL(a) lnL(a)*lnL(a) 0 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 1 lnR(a) snR(a) lnR(a)*lnR(a) lnR(a)*snR(a) snR(a)*snR(a) 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 snR(a) lnR(a) snR(a)*snR(a) snR(a)*lnR(a) lnR(a)*lnR(a);];
    L(i:i+3,1)=[lnL(a)-ynL(a);
                snL(a)-xnL(a);
                lnR(a)-ynR(a);
                snR(a)-xnR(a);];
    a = a+1;
end
A(:,1+(4*n):4:4) = [];
L(:,1+(4*n):4:4) = [];
X0 = (inv(A'*A))*(A'*L);
V = A*X0 - L;
VyL = V(1:4:end)*line_scaL;
VxL = V(2:4:end)*sample_scaL;
VyR = V(3:4:end)*line_scaR;
VxR = V(4:4:end)*sample_scaR;
SyL = sqrt(sum(VyL'*VyL)/r);
SxL = sqrt(sum(VxL'*VxL)/r);
SyR = sqrt(sum(VyR'*VyR)/r);
SxR = sqrt(sum(VxR'*VxR)/r);
St_d = [SxL SyL SxR SyR];
% Refinement 
for i = d : N; 
Dl_L(i) = (X0(1)+X0(2)*ynL(i)+X0(3)*xnL(i)+X0(4)*ynL(i)*ynL(i)+X0(5)*xnL(i)*ynL(i)+X0(6)*xnL(i)*xnL(i));
Ds_L(i) = (X0(7)+X0(8)*xnL(i)+X0(9)*ynL(i)+X0(10)*xnL(i)*xnL(i)+X0(11)*ynL(i)*xnL(i)+X0(12)*ynL(i)*ynL(i));
Dl_R(i) = (X0(13)+X0(14)*ynR(i)+X0(15)*xnR(i)+X0(16)*ynR(i)*ynR(i)+X0(17)*xnR(i)*ynR(i)+X0(18)*xnR(i)*xnR(i));
Ds_R(i) = (X0(19)+X0(20)*xnR(i)+X0(21)*ynR(i)+X0(22)*xnR(i)*xnR(i)+X0(23)*ynR(i)*xnR(i)+X0(24)*ynR(i)*ynR(i));
cnL(i)= P1L(i)/P2L(i);
rnL(i)= P3L(i)/P4L(i);
cnR(i)= P1R(i)/P2R(i);
rnR(i)= P3R(i)/P4R(i);
cDL(i)=((cnL(i)*line_scaL)+line_offL) - (Dl_L(i)*line_scaL);
rDL(i)=((rnL(i)*sample_scaL)+sample_offL) - (Ds_L(i)*sample_scaL);
cDR(i)=((cnR(i)*line_scaR)+line_offR) - (Dl_R(i)*line_scaR);
rDR(i)=((rnR(i)*sample_scaR)+sample_offR) - (Ds_R(i)*sample_scaR);
xDL(i)= MIC_L(i,2);
yDL(i)= MIC_L(i,3);
xDR(i)= MIC_R(i,2);
yDR(i)= MIC_R(i,3);
residual_yL(i) = (cDL(i) - yDL(i));
residual_xL(i) = (rDL(i) - xDL(i));
residual_yR(i) = (cDR(i) - yDR(i));
residual_xR(i) = (rDR(i) - xDR(i));
end
rxL = residual_xL';
ryL = residual_yL';
rxR = residual_xR';
ryR = residual_yR';
Resid = [rxL ryL rxR ryR];
RMSE_xL = (sqrt(sum(rxL'*rxL)/Chk));
RMSE_yL = (sqrt(sum(ryL'*ryL)/Chk));
RMSE_xR = (sqrt(sum(rxR'*rxR)/Chk));
RMSE_yR = (sqrt(sum(ryR'*ryR)/Chk));
RMSE = [RMSE_xL RMSE_yL RMSE_xR RMSE_yR];
% Refinement for object coordinates (X,Y,Z)
for i = 1 : N
F1(i) = ((C(1,1)-(Dl_L(i)*C(1,2)))-(ynL(i)*C(1,2)))+(((C(2,1)-(Dl_L(i)*C(2,2)))-(ynL(i)*C(2,2)))*(XL(i)))+(((C(3,1)-(Dl_L(i)*C(3,2)))-(ynL(i)*C(3,2)))*(YL(i)))+(((C(4,1)-(Dl_L(i)*C(4,2)))-(ynL(i)*C(4,2)))*(ZL(i)))+(((C(5,1)-(Dl_L(i)*C(5,2)))-(ynL(i)*C(5,2)))*(XL(i)*YL(i)))+(((C(6,1)-(Dl_L(i)*C(6,2)))-(ynL(i)*C(6,2)))*(XL(i)*ZL(i)))+(((C(7,1)-(Dl_L(i)*C(7,2)))-(ynL(i)*C(7,2)))*(YL(i)*ZL(i)))+(((C(8,1)-(Dl_L(i)*C(8,2)))-(ynL(i)*C(8,2)))*(XL(i)*XL(i)))+(((C(9,1)-(Dl_L(i)*C(9,2)))-(ynL(i)*C(9,2)))*(YL(i)*YL(i)))+(((C(10,1)-(Dl_L(i)*C(10,2)))-(ynL(i)*C(10,2)))*(ZL(i)*ZL(i)))+(((C(11,1)-(Dl_L(i)*C(11,2)))-(ynL(i)*C(11,2)))*(XL(i)*YL(i)*ZL(i)))+(((C(12,1)-(Dl_L(i)*C(12,2)))-(ynL(i)*C(12,2)))*(XL(i)*XL(i)*XL(i)))+(((C(13,1)-(Dl_L(i)*C(13,2)))-(ynL(i)*C(13,2)))*(XL(i)*YL(i)*YL(i)))+(((C(14,1)-(Dl_L(i)*C(14,2)))-(ynL(i)*C(14,2)))*(XL(i)*ZL(i)*ZL(i)))+(((C(15,1)-(Dl_L(i)*C(15,2)))-(ynL(i)*C(15,2)))*(YL(i)*XL(i)*XL(i)))+(((C(16,1)-(Dl_L(i)*C(16,2)))-(ynL(i)*C(16,2)))*(YL(i)*YL(i)*YL(i)))+(((C(17,1)-(Dl_L(i)*C(17,2)))-(ynL(i)*C(17,2)))*(YL(i)*ZL(i)*ZL(i)))+(((C(18,1)-(Dl_L(i)*C(18,2)))-(ynL(i)*C(18,2)))*(XL(i)*XL(i)*ZL(i)))+(((C(19,1)-(Dl_L(i)*C(19,2)))-(ynL(i)*C(19,2)))*(YL(i)*YL(i)*ZL(i)))+(((C(20,1)-(Dl_L(i)*C(20,2)))-(ynL(i)*C(20,2)))*(ZL(i)*ZL(i)*ZL(i)));
F2(i) = ((C(1,3)-(Ds_L(i)*C(1,4)))-(xnL(i)*C(1,4)))+(((C(2,3)-(Ds_L(i)*C(2,4)))-(xnL(i)*C(2,4)))*(XL(i)))+(((C(3,3)-(Ds_L(i)*C(3,4)))-(xnL(i)*C(3,4)))*(YL(i)))+(((C(4,3)-(Ds_L(i)*C(4,4)))-(xnL(i)*C(4,4)))*(ZL(i)))+(((C(5,3)-(Ds_L(i)*C(5,4)))-(xnL(i)*C(5,4)))*(XL(i)*YL(i)))+(((C(6,3)-(Ds_L(i)*C(6,4)))-(xnL(i)*C(6,4)))*(XL(i)*ZL(i)))+(((C(7,3)-(Ds_L(i)*C(7,4)))-(xnL(i)*C(7,4)))*(YL(i)*ZL(i)))+(((C(8,3)-(Ds_L(i)*C(8,4)))-(xnL(i)*C(8,4)))*(XL(i)*XL(i)))+(((C(9,3)-(Ds_L(i)*C(9,4)))-(xnL(i)*C(9,4)))*(YL(i)*YL(i)))+(((C(10,3)-(Ds_L(i)*C(10,4)))-(xnL(i)*C(10,4)))*(ZL(i)*ZL(i)))+(((C(11,3)-(Ds_L(i)*C(11,4)))-(xnL(i)*C(11,4)))*(XL(i)*YL(i)*ZL(i)))+(((C(12,3)-(Ds_L(i)*C(12,4)))-(xnL(i)*C(12,4)))*(XL(i)*XL(i)*XL(i)))+(((C(13,3)-(Ds_L(i)*C(13,4)))-(xnL(i)*C(13,4)))*(XL(i)*YL(i)*YL(i)))+(((C(14,3)-(Ds_L(i)*C(14,4)))-(xnL(i)*C(14,4)))*(XL(i)*ZL(i)*ZL(i)))+(((C(15,3)-(Ds_L(i)*C(15,4)))-(xnL(i)*C(15,4)))*(YL(i)*XL(i)*XL(i)))+(((C(16,3)-(Ds_L(i)*C(16,4)))-(xnL(i)*C(16,4)))*(YL(i)*YL(i)*YL(i)))+(((C(17,3)-(Ds_L(i)*C(17,4)))-(xnL(i)*C(17,4)))*(YL(i)*ZL(i)*ZL(i)))+(((C(18,3)-(Ds_L(i)*C(18,4)))-(xnL(i)*C(18,4)))*(XL(i)*XL(i)*ZL(i)))+(((C(19,3)-(Ds_L(i)*C(19,4)))-(xnL(i)*C(19,4)))*(YL(i)*YL(i)*ZL(i)))+(((C(20,3)-(Ds_L(i)*C(20,4)))-(xnL(i)*C(20,4)))*(ZL(i)*ZL(i)*ZL(i)));
F3(i) = ((C(1,5)-(Dl_R(i)*C(1,6)))-(ynR(i)*C(1,6)))+(((C(2,5)-(Dl_R(i)*C(2,6)))-(ynR(i)*C(2,6)))*(XR(i)))+(((C(3,5)-(Dl_R(i)*C(3,6)))-(ynR(i)*C(3,6)))*(YR(i)))+(((C(4,5)-(Dl_R(i)*C(4,6)))-(ynR(i)*C(4,6)))*(ZR(i)))+(((C(5,5)-(Dl_R(i)*C(5,6)))-(ynR(i)*C(5,6)))*(XR(i)*YR(i)))+(((C(6,5)-(Dl_R(i)*C(6,6)))-(ynR(i)*C(6,6)))*(XR(i)*ZR(i)))+(((C(7,5)-(Dl_R(i)*C(7,6)))-(ynR(i)*C(7,6)))*(YR(i)*ZR(i)))+(((C(8,5)-(Dl_R(i)*C(8,6)))-(ynR(i)*C(8,6)))*(XR(i)*XR(i)))+(((C(9,5)-(Dl_R(i)*C(9,6)))-(ynR(i)*C(9,6)))*(YR(i)*YR(i)))+(((C(10,5)-(Dl_R(i)*C(10,6)))-(ynR(i)*C(10,6)))*(ZR(i)*ZR(i)))+(((C(11,5)-(Dl_R(i)*C(11,6)))-(ynR(i)*C(11,6)))*(XR(i)*YR(i)*ZR(i)))+(((C(12,5)-(Dl_R(i)*C(12,6)))-(ynR(i)*C(12,6)))*(XR(i)*XR(i)*XR(i)))+(((C(13,5)-(Dl_R(i)*C(13,6)))-(ynR(i)*C(13,6)))*(XR(i)*YR(i)*YR(i)))+(((C(14,5)-(Dl_R(i)*C(14,6)))-(ynR(i)*C(14,6)))*(XR(i)*ZR(i)*ZR(i)))+(((C(15,5)-(Dl_R(i)*C(15,6)))-(ynR(i)*C(15,6)))*(YR(i)*XR(i)*XR(i)))+(((C(16,5)-(Dl_R(i)*C(16,6)))-(ynR(i)*C(16,6)))*(YR(i)*YR(i)*YR(i)))+(((C(17,5)-(Dl_R(i)*C(17,6)))-(ynR(i)*C(17,6)))*(YR(i)*ZR(i)*ZR(i)))+(((C(18,5)-(Dl_R(i)*C(18,6)))-(ynR(i)*C(18,6)))*(XR(i)*XR(i)*ZR(i)))+(((C(19,5)-(Dl_R(i)*C(19,6)))-(ynR(i)*C(19,6)))*(YR(i)*YR(i)*ZR(i)))+(((C(20,5)-(Dl_R(i)*C(20,6)))-(ynR(i)*C(20,6)))*(ZR(i)*ZR(i)*ZR(i)));
F4(i) = ((C(1,7)-(Ds_R(i)*C(1,8)))-(xnR(i)*C(1,8)))+(((C(2,7)-(Ds_R(i)*C(2,8)))-(xnR(i)*C(2,8)))*(XR(i)))+(((C(3,7)-(Ds_R(i)*C(3,8)))-(xnR(i)*C(3,8)))*(YR(i)))+(((C(4,7)-(Ds_R(i)*C(4,8)))-(xnR(i)*C(4,8)))*(ZR(i)))+(((C(5,7)-(Ds_R(i)*C(5,8)))-(xnR(i)*C(5,8)))*(XR(i)*YR(i)))+(((C(6,7)-(Ds_R(i)*C(6,8)))-(xnR(i)*C(6,8)))*(XR(i)*ZR(i)))+(((C(7,7)-(Ds_R(i)*C(7,8)))-(xnR(i)*C(7,8)))*(YR(i)*ZR(i)))+(((C(8,7)-(Ds_R(i)*C(8,8)))-(xnR(i)*C(8,8)))*(XR(i)*XR(i)))+(((C(9,7)-(Ds_R(i)*C(9,8)))-(xnR(i)*C(9,8)))*(YR(i)*YR(i)))+(((C(10,7)-(Ds_R(i)*C(10,8)))-(xnR(i)*C(10,8)))*(ZR(i)*ZR(i)))+(((C(11,7)-(Ds_R(i)*C(11,8)))-(xnR(i)*C(11,8)))*(XR(i)*YR(i)*ZR(i)))+(((C(12,7)-(Ds_R(i)*C(12,8)))-(xnR(i)*C(12,8)))*(XR(i)*XR(i)*XR(i)))+(((C(13,7)-(Ds_R(i)*C(13,8)))-(xnR(i)*C(13,8)))*(XR(i)*YR(i)*YR(i)))+(((C(14,7)-(Ds_R(i)*C(14,8)))-(xnR(i)*C(14,8)))*(XR(i)*ZR(i)*ZR(i)))+(((C(15,7)-(Ds_R(i)*C(15,8)))-(xnR(i)*C(15,8)))*(YR(i)*XR(i)*XR(i)))+(((C(16,7)-(Ds_R(i)*C(16,8)))-(xnR(i)*C(16,8)))*(YR(i)*YR(i)*YR(i)))+(((C(17,7)-(Ds_R(i)*C(17,8)))-(xnR(i)*C(17,8)))*(YR(i)*ZR(i)*ZR(i)))+(((C(18,7)-(Ds_R(i)*C(18,8)))-(xnR(i)*C(18,8)))*(XR(i)*XR(i)*ZR(i)))+(((C(19,7)-(Ds_R(i)*C(19,8)))-(xnR(i)*C(19,8)))*(YR(i)*YR(i)*ZR(i)))+(((C(20,7)-(Ds_R(i)*C(20,8)))-(xnR(i)*C(20,8)))*(ZR(i)*ZR(i)*ZR(i)));   
end
for i = 1 : N;
% Partial derivatives F1, F2, F3, F4 w.r.t X,Y,Z
F1_X(i) = (((C(2,1)-(Dl_L(i)*C(2,2)))-((ynL(i))*C(2,2))))+((((C(5,1)-(Dl_L(i)*C(5,2)))-((ynL(i))*C(5,2))))*(YL(i)))+((((C(6,1)-(Dl_L(i)*C(6,2)))-((ynL(i))*C(6,2))))*(ZL(i)))+((2*((C(8,1)-(Dl_L(i)*C(8,2)))-((ynL(i))*C(8,2)))*(XL(i))))+((((C(11,1)-(Dl_L(i)*C(11,2)))-((ynL(i))*C(11,2)))*(YL(i)*ZL(i))))+((3*((C(12,1)-(Dl_L(i)*C(12,2)))-((ynL(i))*C(12,2)))*(XL(i)*XL(i))))+((((C(13,1)-(Dl_L(i)*C(13,2)))-((ynL(i))*C(13,2)))*(YL(i)*YL(i))))+((((C(14,1)-(Dl_L(i)*C(14,2)))-((ynL(i))*C(14,2)))*(ZL(i)*ZL(i))))+((2*((C(15,1)-(Dl_L(i)*C(15,2)))-((ynL(i))*C(15,2)))*(XL(i)*YL(i))))+((2*((C(18,1)-(Dl_L(i)*C(18,2)))-((ynL(i))*C(18,2)))*(XL(i)*ZL(i))));
F1_Y(i) = (((C(3,1)-(Dl_L(i)*C(3,2)))-((ynL(i))*C(3,2))))+((((C(5,1)-(Dl_L(i)*C(5,2)))-((ynL(i))*C(5,2))))*(XL(i)))+((((C(7,1)-(Dl_L(i)*C(7,2)))-((ynL(i))*C(7,2))))*(ZL(i)))+((2*((C(9,1)-(Dl_L(i)*C(9,2)))-((ynL(i))*C(9,2)))*(YL(i))))+((((C(11,1)-(Dl_L(i)*C(11,2)))-((ynL(i))*C(11,2)))*(XL(i)*ZL(i))))+((2*((C(13,1)-(Dl_L(i)*C(13,2)))-((ynL(i))*C(13,2)))*(XL(i)*YL(i))))+((((C(15,1)-(Dl_L(i)*C(15,2)))-((ynL(i))*C(15,2)))*(XL(i)*XL(i))))+((3*((C(16,1)-(Dl_L(i)*C(16,2)))-((ynL(i))*C(16,2)))*(YL(i)*YL(i))))+((((C(17,1)-(Dl_L(i)*C(17,2)))-((ynL(i))*C(17,2)))*(ZL(i)*ZL(i))))+((2*((C(19,1)-(Dl_L(i)*C(19,2)))-((ynL(i))*C(19,2)))*(YL(i)*ZL(i))));        
F1_Z(i) = (((C(4,1)-(Dl_L(i)*C(4,2)))-((ynL(i))*C(4,2))))+((((C(6,1)-(Dl_L(i)*C(6,2)))-((ynL(i))*C(6,2))))*(XL(i)))+((((C(7,1)-(Dl_L(i)*C(7,2)))-((ynL(i))*C(7,2))))*(YL(i)))+((2*((C(10,1)-(Dl_L(i)*C(10,2)))-((ynL(i))*C(10,2)))*(ZL(i))))+((((C(11,1)-(Dl_L(i)*C(11,2)))-((ynL(i))*C(11,2)))*(XL(i)*YL(i))))+((2*((C(14,1)-(Dl_L(i)*C(14,2)))-((ynL(i))*C(14,2)))*(XL(i)*ZL(i))))+((2*((C(17,1)-(Dl_L(i)*C(17,2)))-((ynL(i))*C(17,2)))*(YL(i)*ZL(i))))+((((C(18,1)-(Dl_L(i)*C(18,2)))-((ynL(i))*C(18,2)))*(XL(i)*XL(i))))+((((C(19,1)-(Dl_L(i)*C(19,2)))-((ynL(i))*C(19,2)))*(YL(i)*YL(i))))+((3*((C(20,1)-(Dl_L(i)*C(20,2)))-((ynL(i))*C(20,2)))*(ZL(i)*ZL(i))));
F2_X(i) = (((C(2,3)-(Ds_L(i)*C(2,4)))-((xnL(i))*C(2,4))))+((((C(5,3)-(Ds_L(i)*C(5,4)))-((xnL(i))*C(5,4))))*(YL(i)))+((((C(6,3)-(Ds_L(i)*C(6,4)))-((xnL(i))*C(6,4))))*(ZL(i)))+((2*((C(8,3)-(Ds_L(i)*C(8,4)))-((xnL(i))*C(8,4)))*(XL(i))))+((((C(11,3)-(Ds_L(i)*C(11,4)))-((xnL(i))*C(11,4)))*(YL(i)*ZL(i))))+((3*((C(12,3)-(Ds_L(i)*C(12,4)))-((xnL(i))*C(12,4)))*(XL(i)*XL(i))))+((((C(13,3)-(Ds_L(i)*C(13,4)))-((xnL(i))*C(13,4)))*(YL(i)*YL(i))))+((((C(14,3)-(Ds_L(i)*C(14,4)))-((xnL(i))*C(14,4)))*(ZL(i)*ZL(i))))+((2*((C(15,3)-(Ds_L(i)*C(15,4)))-((xnL(i))*C(15,4)))*(XL(i)*YL(i))))+((2*((C(18,3)-(Ds_L(i)*C(18,4)))-((xnL(i))*C(18,4)))*(XL(i)*ZL(i))));
F2_Y(i) = (((C(3,3)-(Ds_L(i)*C(3,4)))-((xnL(i))*C(3,4))))+((((C(5,3)-(Ds_L(i)*C(5,4)))-((xnL(i))*C(5,4))))*(XL(i)))+((((C(7,3)-(Ds_L(i)*C(7,4)))-((xnL(i))*C(7,4))))*(ZL(i)))+((2*((C(9,3)-(Ds_L(i)*C(9,4)))-((xnL(i))*C(9,4)))*(YL(i))))+((((C(11,3)-(Ds_L(i)*C(11,4)))-((xnL(i))*C(11,4)))*(XL(i)*ZL(i))))+((2*((C(13,3)-(Ds_L(i)*C(13,4)))-((xnL(i))*C(13,4)))*(XL(i)*YL(i))))+((((C(15,3)-(Ds_L(i)*C(15,4)))-((xnL(i))*C(15,4)))*(XL(i)*XL(i))))+((3*((C(16,3)-(Ds_L(i)*C(16,4)))-((xnL(i))*C(16,4)))*(YL(i)*YL(i))))+((((C(17,3)-(Ds_L(i)*C(17,4)))-((xnL(i))*C(17,4)))*(ZL(i)*ZL(i))))+((2*((C(19,3)-(Ds_L(i)*C(19,4)))-((xnL(i))*C(19,4)))*(YL(i)*ZL(i))));
F2_Z(i) = (((C(4,3)-(Ds_L(i)*C(4,4)))-((xnL(i))*C(4,4))))+((((C(6,3)-(Ds_L(i)*C(6,4)))-((xnL(i))*C(6,4))))*(XL(i)))+((((C(7,3)-(Ds_L(i)*C(7,4)))-((xnL(i))*C(7,4))))*(YL(i)))+((2*((C(10,3)-(Ds_L(i)*C(10,4)))-((xnL(i))*C(10,4)))*(ZL(i))))+((((C(11,3)-(Ds_L(i)*C(11,4)))-((xnL(i))*C(11,4)))*(XL(i)*YL(i))))+((2*((C(14,3)-(Ds_L(i)*C(14,4)))-((xnL(i))*C(14,4)))*(XL(i)*ZL(i))))+((2*((C(17,3)-(Ds_L(i)*C(17,4)))-((xnL(i))*C(17,4)))*(YL(i)*ZL(i))))+((((C(18,3)-(Ds_L(i)*C(18,4)))-((xnL(i))*C(18,4)))*(XL(i)*XL(i))))+((((C(19,3)-(Ds_L(i)*C(19,4)))-((xnL(i))*C(19,4)))*(YL(i)*YL(i))))+((3*((C(20,3)-(Ds_L(i)*C(20,4)))-((xnL(i))*C(20,4)))*(ZL(i)*ZL(i))));
F3_X(i) = (((C(2,5)-(Dl_R(i)*C(2,6)))-((ynR(i))*C(2,6))))+((((C(5,5)-(Dl_R(i)*C(5,6)))-((ynR(i))*C(5,6))))*(YR(i)))+((((C(6,5)-(Dl_R(i)*C(6,6)))-((ynR(i))*C(6,6))))*(ZR(i)))+((2*((C(8,5)-(Dl_R(i)*C(8,6)))-((ynR(i))*C(8,6)))*(XR(i))))+((((C(11,5)-(Dl_R(i)*C(11,6)))-((ynR(i))*C(11,6)))*(YR(i)*ZR(i))))+((3*((C(12,5)-(Dl_R(i)*C(12,6)))-((ynR(i))*C(12,6)))*(XR(i)*XR(i))))+((((C(13,5)-(Dl_R(i)*C(13,6)))-((ynR(i))*C(13,6)))*(YR(i)*YR(i))))+((((C(14,5)-(Dl_R(i)*C(14,6)))-((ynR(i))*C(14,6)))*(ZR(i)*ZR(i))))+((2*((C(15,5)-(Dl_R(i)*C(15,6)))-((ynR(i))*C(15,6)))*(XR(i)*YR(i))))+((2*((C(18,5)-(Dl_R(i)*C(18,6)))-((ynR(i))*C(18,6)))*(XR(i)*ZR(i))));
F3_Y(i) = (((C(3,5)-(Dl_R(i)*C(3,6)))-((ynR(i))*C(3,6))))+((((C(5,5)-(Dl_R(i)*C(5,6)))-((ynR(i))*C(5,6))))*(XR(i)))+((((C(7,5)-(Dl_R(i)*C(7,6)))-((ynR(i))*C(7,6))))*(ZR(i)))+((2*((C(9,5)-(Dl_R(i)*C(9,6)))-((ynR(i))*C(9,6)))*(YR(i))))+((((C(11,5)-(Dl_R(i)*C(11,6)))-((ynR(i))*C(11,6)))*(XR(i)*ZR(i))))+((2*((C(13,5)-(Dl_R(i)*C(13,6)))-((ynR(i))*C(13,6)))*(XR(i)*YR(i))))+((((C(15,5)-(Dl_R(i)*C(15,6)))-((ynR(i))*C(15,6)))*(XR(i)*XR(i))))+((3*((C(16,5)-(Dl_R(i)*C(16,6)))-((ynR(i))*C(16,6)))*(YR(i)*YR(i))))+((((C(17,5)-(Dl_R(i)*C(17,6)))-((ynR(i))*C(17,6)))*(ZR(i)*ZR(i))))+((2*((C(19,5)-(Dl_R(i)*C(19,6)))-((ynR(i))*C(19,6)))*(YR(i)*ZR(i))));        
F3_Z(i) = (((C(4,5)-(Dl_R(i)*C(4,6)))-((ynR(i))*C(4,6))))+((((C(6,5)-(Dl_R(i)*C(6,6)))-((ynR(i))*C(6,6))))*(XR(i)))+((((C(7,5)-(Dl_R(i)*C(7,6)))-((ynR(i))*C(7,6))))*(YR(i)))+((2*((C(10,5)-(Dl_R(i)*C(10,6)))-((ynR(i))*C(10,6)))*(ZR(i))))+((((C(11,5)-(Dl_R(i)*C(11,6)))-((ynR(i))*C(11,6)))*(XR(i)*YR(i))))+((2*((C(14,5)-(Dl_R(i)*C(14,6)))-((ynR(i))*C(14,6)))*(XR(i)*ZR(i))))+((2*((C(17,5)-(Dl_R(i)*C(17,6)))-((ynR(i))*C(17,6)))*(YR(i)*ZR(i))))+((((C(18,5)-(Dl_R(i)*C(18,6)))-((ynR(i))*C(18,6)))*(XR(i)*XR(i))))+((((C(19,5)-(Dl_R(i)*C(19,6)))-((ynR(i))*C(19,6)))*(YR(i)*YR(i))))+((3*((C(20,5)-(Dl_R(i)*C(20,6)))-((ynR(i))*C(20,6)))*(ZR(i)*ZR(i))));
F4_X(i) = (((C(2,7)-(Ds_R(i)*C(2,8)))-((xnR(i))*C(2,8))))+((((C(5,7)-(Ds_R(i)*C(5,8)))-((xnR(i))*C(5,8))))*(YR(i)))+((((C(6,7)-(Ds_R(i)*C(6,8)))-((xnR(i))*C(6,8))))*(ZR(i)))+((2*((C(8,7)-(Ds_R(i)*C(8,8)))-((xnR(i))*C(8,8)))*(XR(i))))+((((C(11,7)-(Ds_R(i)*C(11,8)))-((xnR(i))*C(11,8)))*(YR(i)*ZR(i))))+((3*((C(12,7)-(Ds_R(i)*C(12,8)))-((xnR(i))*C(12,8)))*(XR(i)*XR(i))))+((((C(13,7)-(Ds_R(i)*C(13,8)))-((xnR(i))*C(13,8)))*(YR(i)*YR(i))))+((((C(14,7)-(Ds_R(i)*C(14,8)))-((xnR(i))*C(14,8)))*(ZR(i)*ZR(i))))+((2*((C(15,7)-(Ds_R(i)*C(15,8)))-((xnR(i))*C(15,8)))*(XR(i)*YR(i))))+((2*((C(18,7)-(Ds_R(i)*C(18,8)))-((xnR(i))*C(18,8)))*(XR(i)*ZR(i))));
F4_Y(i) = (((C(3,7)-(Ds_R(i)*C(3,8)))-((xnR(i))*C(3,8))))+((((C(5,7)-(Ds_R(i)*C(5,8)))-((xnR(i))*C(5,8))))*(XR(i)))+((((C(7,7)-(Ds_R(i)*C(7,8)))-((xnR(i))*C(7,8))))*(ZR(i)))+((2*((C(9,7)-(Ds_R(i)*C(9,8)))-((xnR(i))*C(9,8)))*(YR(i))))+((((C(11,7)-(Ds_R(i)*C(11,8)))-((xnR(i))*C(11,8)))*(XR(i)*ZR(i))))+((2*((C(13,7)-(Ds_R(i)*C(13,8)))-((xnR(i))*C(13,8)))*(XR(i)*YR(i))))+((((C(15,7)-(Ds_R(i)*C(15,8)))-((xnR(i))*C(15,8)))*(XR(i)*XR(i))))+((3*((C(16,7)-(Ds_R(i)*C(16,8)))-((xnR(i))*C(16,8)))*(YR(i)*YR(i))))+((((C(17,7)-(Ds_R(i)*C(17,8)))-((xnR(i))*C(17,8)))*(ZR(i)*ZR(i))))+((2*((C(19,7)-(Ds_R(i)*C(19,8)))-((xnR(i))*C(19,8)))*(YR(i)*ZR(i))));
F4_Z(i) = (((C(4,7)-(Ds_R(i)*C(4,8)))-((xnR(i))*C(4,8))))+((((C(6,7)-(Ds_R(i)*C(6,8)))-((xnR(i))*C(6,8))))*(XR(i)))+((((C(7,7)-(Ds_R(i)*C(7,8)))-((xnR(i))*C(7,8))))*(YR(i)))+((2*((C(10,7)-(Ds_R(i)*C(10,8)))-((xnR(i))*C(10,8)))*(ZR(i))))+((((C(11,7)-(Ds_R(i)*C(11,8)))-((xnR(i))*C(11,8)))*(XR(i)*YR(i))))+((2*((C(14,7)-(Ds_R(i)*C(14,8)))-((xnR(i))*C(14,8)))*(XR(i)*ZR(i))))+((2*((C(17,7)-(Ds_R(i)*C(17,8)))-((xnR(i))*C(17,8)))*(YR(i)*ZR(i))))+((((C(18,7)-(Ds_R(i)*C(18,8)))-((xnR(i))*C(18,8)))*(XR(i)*XR(i))))+((((C(19,7)-(Ds_R(i)*C(19,8)))-((xnR(i))*C(19,8)))*(YR(i)*YR(i))))+((3*((C(20,7)-(Ds_R(i)*C(20,8)))-((xnR(i))*C(20,8)))*(ZR(i)*ZR(i))));        
end
% Structure of B matrix (Jacobian matrix)
red = 4*N-3*N;
B = zeros(4*N,3*N);
K = zeros(4*N,1);
a = 1;
for i = 1 : 4 : 4*N
    a = a;
    B(i:i+3,i:i+2) = [F1_X(a) F1_Y(a) F1_Z(a);
                      F2_X(a) F2_Y(a) F2_Z(a);
                      F3_X(a) F3_Y(a) F3_Z(a);
                      F4_X(a) F4_Y(a) F4_Z(a);];
    K(i:i+3,1) =     [-F1(a);
                      -F2(a);
                      -F3(a);
                      -F4(a);];
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
% Enhanced Coordinates. 
for i = d : N;
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
RMSE_X = (sqrt(sum(rX'*rX)/Chk))*60*60*30;
RMSE_Y = (sqrt(sum(rY'*rY)/Chk))*60*60*30;
RMSE_Z = sqrt(sum(rZ'*rZ)/Chk);
RMSE_XYZ = [RMSE_X RMSE_Y RMSE_Z];
RMSE_xyXYZ = [RMSE_xL RMSE_yL RMSE_xR RMSE_yR RMSE_X RMSE_Y RMSE_Z]
Residuals_xyXYZ = [rxL ryL rxR ryR rX rY rZ];




