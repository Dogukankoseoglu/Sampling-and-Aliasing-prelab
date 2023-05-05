clc;
clear variable;
close all;

% Defining the signal and the sampling rate
f = 10 ;
fs = 15 ;
t = 0:1/(fs*1e+3 ):10/f ;
s = cos (2*pi*f*t + pi/4);
% plotting the signal
plot (t,s,'LineWidth',2)
ylim([-1.5*max(abs(s)),1.5*max(abs(s))])
xlim ([0,10/f])
title ('Continuous Signal')
xlabel ('Time (s)')
ylabel ('Amplitude')
grid
%Plotting the spectrum of the continuous signal
sc1 = [f,0.5*exp(1i*(pi/4))]; % spectral components of
sc2 = [-f,0.5*exp(1i*(-pi/4))]; % the continuous signal
figure
spec('c' ,sc1,sc2)
%sampling and resynthesizing
figure
idcon (s,t,fs);
% Plotting the spectrum of the sampled signal
sc3 = [2*pi/3,0.5*exp(1i*(-pi/4))] ; % spectral components of
sc4 = [-2*pi/3,0.5*exp(1i*(pi/4))] ; % the discrete signal
figure
spec('d',sc3,sc4);

%%

f1 = 13;
f2 = 3 ;
t = 0:1/16e+3:10/f1;
s = 8*cos(2*pi*f1*t + pi/2) + 2*cos(2*pi*f2*t - pi/3);
spec('c', [13,4*exp(1i*(pi/2))],[-13,4*exp(1i*(-pi/2))],[3,1*exp(1i*(-pi/3))],[-3,1*exp(1i*(pi/3))])
figure
plot(t,s)
figure
idcon(s,t,16)
figure
spec('d',[3*2*pi/16,1*exp(1i*(-pi/3)) + 4*exp(1i*(-pi/2))],[-3*2*pi/16,1*exp(1i*(pi/3))+4*exp(1i*(pi/2))])

