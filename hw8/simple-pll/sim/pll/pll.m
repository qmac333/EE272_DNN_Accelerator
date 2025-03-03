%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% YOUR PARAMETERS HERE
Kvco = 2*pi*3.4e9; % in rad/s/V, not Hz/V!
Ki = 0;
Kp = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% fixed parameters
Vdd = 1.8;
Ndiv = 10;
tau_filt = 15.9e-9;

% form the loop function
s = tf('s');
LF = Kvco * (1/Ndiv) * (1/s) * (Vdd/pi) * ...
     (1/(1+tau_filt*s)) * (Kp + (Ki/s));

% plot the phase margin
margin(LF);
