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
N = length(Obs);% NORMALIZATION FOR CPs
for i = 1 : N;
XL(i)=(Obs(i,2)-long_offL)/long_scaL;
YL(i)=(Obs(i,3)-lat_offL)/lat_scaL;
ZL(i)=(Obs(i,4)-H_offL)/H_scaL;
XR(i)=(Obs(i,2)-long_offR)/long_scaR;
YR(i)=(Obs(i,3)-lat_offR)/lat_scaR;
ZR(i)=(Obs(i,4)-H_offR)/H_scaR;
end 
% The Polynomial form is as follows 
for i = 1:N;
P1L(i)= C(1,1)+C(2,1)*XL(i)+C(3,1)*YL(i)+C(4,1)*ZL(i)+C(5,1)*XL(i)*YL(i)+C(6,1)*XL(i)*ZL(i)+C(7,1)*YL(i)*ZL(i)+C(8,1)*XL(i)*XL(i)+C(9,1)*YL(i)*YL(i)+C(10,1)*ZL(i)*ZL(i)+C(11,1)*XL(i)*YL(i)*ZL(i)+C(12,1)*XL(i)*XL(i)*XL(i)+C(13,1)*XL(i)*YL(i)*YL(i)+C(14,1)*XL(i)*ZL(i)*ZL(i)+C(15,1)*YL(i)*XL(i)*XL(i)+C(16,1)*YL(i)*YL(i)*YL(i)+C(17,1)*YL(i)*ZL(i)*ZL(i)+C(18,1)*XL(i)*XL(i)*ZL(i)+C(19,1)*YL(i)*YL(i)*ZL(i)+C(20,1)*ZL(i)*ZL(i)*ZL(i);
P2L(i)= C(1,2)+C(2,2)*XL(i)+C(3,2)*YL(i)+C(4,2)*ZL(i)+C(5,2)*XL(i)*YL(i)+C(6,2)*XL(i)*ZL(i)+C(7,2)*YL(i)*ZL(i)+C(8,2)*XL(i)*XL(i)+C(9,2)*YL(i)*YL(i)+C(10,2)*ZL(i)*ZL(i)+C(11,2)*XL(i)*YL(i)*ZL(i)+C(12,2)*XL(i)*XL(i)*XL(i)+C(13,2)*XL(i)*YL(i)*YL(i)+C(14,2)*XL(i)*ZL(i)*ZL(i)+C(15,2)*YL(i)*XL(i)*XL(i)+C(16,2)*YL(i)*YL(i)*YL(i)+C(17,2)*YL(i)*ZL(i)*ZL(i)+C(18,2)*XL(i)*XL(i)*ZL(i)+C(19,2)*YL(i)*YL(i)*ZL(i)+C(20,2)*ZL(i)*ZL(i)*ZL(i);
P3L(i)= C(1,3)+C(2,3)*XL(i)+C(3,3)*YL(i)+C(4,3)*ZL(i)+C(5,3)*XL(i)*YL(i)+C(6,3)*XL(i)*ZL(i)+C(7,3)*YL(i)*ZL(i)+C(8,3)*XL(i)*XL(i)+C(9,3)*YL(i)*YL(i)+C(10,3)*ZL(i)*ZL(i)+C(11,3)*XL(i)*YL(i)*ZL(i)+C(12,3)*XL(i)*XL(i)*XL(i)+C(13,3)*XL(i)*YL(i)*YL(i)+C(14,3)*XL(i)*ZL(i)*ZL(i)+C(15,3)*YL(i)*XL(i)*XL(i)+C(16,3)*YL(i)*YL(i)*YL(i)+C(17,3)*YL(i)*ZL(i)*ZL(i)+C(18,3)*XL(i)*XL(i)*ZL(i)+C(19,3)*YL(i)*YL(i)*ZL(i)+C(20,3)*ZL(i)*ZL(i)*ZL(i);
P4L(i)= C(1,4)+C(2,4)*XL(i)+C(3,4)*YL(i)+C(4,4)*ZL(i)+C(5,4)*XL(i)*YL(i)+C(6,4)*XL(i)*ZL(i)+C(7,4)*YL(i)*ZL(i)+C(8,4)*XL(i)*XL(i)+C(9,4)*YL(i)*YL(i)+C(10,4)*ZL(i)*ZL(i)+C(11,4)*XL(i)*YL(i)*ZL(i)+C(12,4)*XL(i)*XL(i)*XL(i)+C(13,4)*XL(i)*YL(i)*YL(i)+C(14,4)*XL(i)*ZL(i)*ZL(i)+C(15,4)*YL(i)*XL(i)*XL(i)+C(16,4)*YL(i)*YL(i)*YL(i)+C(17,4)*YL(i)*ZL(i)*ZL(i)+C(18,4)*XL(i)*XL(i)*ZL(i)+C(19,4)*YL(i)*YL(i)*ZL(i)+C(20,4)*ZL(i)*ZL(i)*ZL(i);
P1R(i)= C(1,5)+C(2,5)*XR(i)+C(3,5)*YR(i)+C(4,5)*ZR(i)+C(5,5)*XR(i)*YR(i)+C(6,5)*XR(i)*ZR(i)+C(7,5)*YR(i)*ZR(i)+C(8,5)*XR(i)*XR(i)+C(9,5)*YR(i)*YR(i)+C(10,5)*ZR(i)*ZR(i)+C(11,5)*XR(i)*YR(i)*ZR(i)+C(12,5)*XR(i)*XR(i)*XR(i)+C(13,5)*XR(i)*YR(i)*YR(i)+C(14,5)*XR(i)*ZR(i)*ZR(i)+C(15,5)*YR(i)*XR(i)*XR(i)+C(16,5)*YR(i)*YR(i)*YR(i)+C(17,5)*YR(i)*ZR(i)*ZR(i)+C(18,5)*XR(i)*XR(i)*ZR(i)+C(19,5)*YR(i)*YR(i)*ZR(i)+C(20,5)*ZR(i)*ZR(i)*ZR(i);
P2R(i)= C(1,6)+C(2,6)*XR(i)+C(3,6)*YR(i)+C(4,6)*ZR(i)+C(5,6)*XR(i)*YR(i)+C(6,6)*XR(i)*ZR(i)+C(7,6)*YR(i)*ZR(i)+C(8,6)*XR(i)*XR(i)+C(9,6)*YR(i)*YR(i)+C(10,6)*ZR(i)*ZR(i)+C(11,6)*XR(i)*YR(i)*ZR(i)+C(12,6)*XR(i)*XR(i)*XR(i)+C(13,6)*XR(i)*YR(i)*YR(i)+C(14,6)*XR(i)*ZR(i)*ZR(i)+C(15,6)*YR(i)*XR(i)*XR(i)+C(16,6)*YR(i)*YR(i)*YR(i)+C(17,6)*YR(i)*ZR(i)*ZR(i)+C(18,6)*XR(i)*XR(i)*ZR(i)+C(19,6)*YR(i)*YR(i)*ZR(i)+C(20,6)*ZR(i)*ZR(i)*ZR(i);
P3R(i)= C(1,7)+C(2,7)*XR(i)+C(3,7)*YR(i)+C(4,7)*ZR(i)+C(5,7)*XR(i)*YR(i)+C(6,7)*XR(i)*ZR(i)+C(7,7)*YR(i)*ZR(i)+C(8,7)*XR(i)*XR(i)+C(9,7)*YR(i)*YR(i)+C(10,7)*ZR(i)*ZR(i)+C(11,7)*XR(i)*YR(i)*ZR(i)+C(12,7)*XR(i)*XR(i)*XR(i)+C(13,7)*XR(i)*YR(i)*YR(i)+C(14,7)*XR(i)*ZR(i)*ZR(i)+C(15,7)*YR(i)*XR(i)*XR(i)+C(16,7)*YR(i)*YR(i)*YR(i)+C(17,7)*YR(i)*ZR(i)*ZR(i)+C(18,7)*XR(i)*XR(i)*ZR(i)+C(19,7)*YR(i)*YR(i)*ZR(i)+C(20,7)*ZR(i)*ZR(i)*ZR(i);
P4R(i)= C(1,8)+C(2,8)*XR(i)+C(3,8)*YR(i)+C(4,8)*ZR(i)+C(5,8)*XR(i)*YR(i)+C(6,8)*XR(i)*ZR(i)+C(7,8)*YR(i)*ZR(i)+C(8,8)*XR(i)*XR(i)+C(9,8)*YR(i)*YR(i)+C(10,8)*ZR(i)*ZR(i)+C(11,8)*XR(i)*YR(i)*ZR(i)+C(12,8)*XR(i)*XR(i)*XR(i)+C(13,8)*XR(i)*YR(i)*YR(i)+C(14,8)*XR(i)*ZR(i)*ZR(i)+C(15,8)*YR(i)*XR(i)*XR(i)+C(16,8)*YR(i)*YR(i)*YR(i)+C(17,8)*YR(i)*ZR(i)*ZR(i)+C(18,8)*XR(i)*XR(i)*ZR(i)+C(19,8)*YR(i)*YR(i)*ZR(i)+C(20,8)*ZR(i)*ZR(i)*ZR(i);
ln_L(i)=P1L(i)/P2L(i);
sn_L(i)=P3L(i)/P4L(i);
ln_R(i)=P1R(i)/P2R(i);
sn_R(i)=P3R(i)/P4R(i);
lDL(i)=(ln_L(i)*line_scaL)+line_offL;
sDL(i)=(sn_L(i)*sample_scaL)+sample_offL;
lDR(i)=(ln_R(i)*line_scaR)+line_offR;
sDR(i)=(sn_R(i)*sample_scaR)+sample_offR;
xDL(i)= MIC_L(i,2);
yDL(i)= MIC_L(i,3);
xDR(i)= MIC_R(i,2);
yDR(i)= MIC_R(i,3);
residual_yL(i) = (lDL(i) - yDL(i));
residual_xL(i) = (sDL(i) - xDL(i));
residual_yR(i) = (lDR(i) - yDR(i));
residual_xR(i) = (sDR(i) - xDR(i));
end 
rxL = residual_xL';
ryL = residual_yL';
rxR = residual_xR';
ryR = residual_yR';
Resid = [rxL ryL rxR ryR];
RMSE_xL = (sqrt(sum(rxL'*rxL)/N));
RMSE_yL = (sqrt(sum(ryL'*ryL)/N));
RMSE_xR = (sqrt(sum(rxR'*rxR)/N));
RMSE_yR = (sqrt(sum(ryR'*ryR)/N));
RMSE = [RMSE_xL RMSE_yL RMSE_xR RMSE_yR]
figure;
quiver(MIC_R(:,2),MIC_R(:,3),rxR,ryR,'b','AutoScaleFactor',1); 
hold on;
plot(MIC_R(:,2),MIC_R(:,3),'rx')
xlabel 'Sample (Pixel)', ylabel 'Line (Pixel)';
legend('Bias','ICs');
sxL = std(rxL);
syL = std(ryL);
sxR = std(rxR);
syR = std(ryR);
stan_de = [sxL syL sxR syR];

