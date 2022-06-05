%%
clear
clc
%% start 
s = tf('s'); 
G = 1e4 * (s+2) / (s+3) / (s+100)^2; 
Hinf(G)
%% find weights for S
% set at -0.01 +- i314
s = tf('s'); 
G = 1e4 * (s+2) / (s+3) / (s+100)^2; 
Fsim=F; 
Gsim=G ;
macro;
%% 4.2 Robustness 
s = tf('s'); 
G0 = 1e4 * (s+2) / (s+3) / (s+100)^2 * (s-1)/(s+2);
Fsim = F;
Gsim = G0;
macro;