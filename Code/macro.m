%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Macro for running simulation
%       of a SISO feedback system with
%       the model servo1.mdl
%
%       The controller must be a tf assigned
%       in workspace as Fsim
%       The system must be a tf assigned
%       in workspace as Gsim
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Parameters to edit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

u_max=inf;              %maximum control signal
sin_dist_freq=100*pi;   %frequency of sinusoid disturbance (rad/s)
sin_dist_amp=1;         %amplitude of sinusoid disturbance
white_noise_var=0;      %variance of white noise disturbance
step_size=0;            %amplitude of step reference
sim_time=10;            %simulation time (s)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


sim('servo1',sim_time);

figure
subplot(2,2,1)
plot(t,r);
title('reference');
xlabel('time (s)')

subplot(2,2,2)
plot(t,y);
title('output');
xlabel('time (s)')

subplot(2,2,3)
plot(t,u);
title('Control signal');
xlabel('time (s)')

subplot(2,2,4)
plot(t,w);
title('Disturbance');
xlabel('time (s)')
