load('walkThenShuffle.mat');
Fs = 60; %sampling rate is 60 hz
figure('Name','pitch')
plot(attitude_pitchradians) % pitch
%title('pitch')
figure('Name','roll')
plot(attitude_rollradians)  % roll
%title('roll')
figure('Name','yaw')
plot(attitude_yawradians)   % yaw
%title('yaw')
%% gravity
clf
clc
figure('Name', 'grav x')
plot(gravity_xG)
figure('Name','grav y')
plot(gravity_yG)
figure('Name','grav z')
plot(gravity_zG)
%% gravity filtered
h = [1/3,1/3,1/3];
filteredx = conv(gravity_xG,h,'same');
filteredy = conv(gravity_yG,h,'same');
filteredz = conv(gravity_zG,h,'same');

figure('Name', 'filtered grav x')
plot(filteredx)
figure('Name','filtered grav y')
plot(filteredy)
figure('Name','filtered grav z')
plot(filteredz)
%% Walking then shuffling
load walkThenShuffle.mat
plot(gravity_xG)
%% Removing extra stuff (me positioning the phone on my ankle etc) via manual indexing.
Fs = 60;
gravX = gravity_xG(518:1356);
gravY = gravity_yG(518:1356);
gravZ = gravity_zG(518:1356);
walkingX = gravX(1:390);
walkingY = gravY(1:390);
walkingZ = gravZ(1:390);
shufflingX = gravX(390:end);
shufflingY = gravY(390:end);
shufflingZ = gravZ(390:end);
%% plotting fft of x accel data for walking
freq_walking_x = fftshift(fft(walkingX));
N = length(freq_walking_x);
frequencies_shifted = (1/(2*pi))*Fs.*linspace(-pi, pi-2/N*pi, N) + pi/N*mod(N,2);
subplot(1,2,1)
plot(frequencies_shifted, abs(freq_walking_x))
xlabel('frequency(hz)')
ylabel('magnitude')
title('Centered FFT of walking data.')
% a frequency of about 1.5 hz was associated with walking and a magnitude
% in the x direction. (x direction is perpandicular to the leg facing forward, the y
% direction is paralell to the leg, and the z direction is perpandicular
% with the screen of the phone facing to the right, away from the right leg.)

% plotting fft of x accel data for shuffling
freq_shuffling_x = fftshift(fft(shufflingX));
N = length(freq_shuffling_x);
frequencies_shifted = (1/(2*pi))*Fs.*linspace(-pi, pi-2/N*pi, N) + pi/N*mod(N,2);
subplot(1,2,2)
plot(frequencies_shifted, abs(freq_shuffling_x))
xlabel('frequency(hz)')
ylabel('magnitude')
title('Centered FFT of shuffling data.')
% a frequency of < 1 hz is associated with shuffling with a substantially
% lower magnitude.
%% Plotting walking and shuffling data in the time domain for x,y,and z
clf
subplot(3,2,1)
plot(walkingX)
title('Walking(X)')
xlabel('samples(at 60hz)')
subplot(3,2,2)
plot(shufflingX)
title('shuffling(X)')
xlabel('samples(at 60hz)')
subplot(3,2,3)
plot(walkingY)
title('Walking(Y)')
xlabel('samples(at 60hz)')
subplot(3,2,4)
plot(shufflingY)
title('shuffling(Y)')
xlabel('samples(at 60hz)')
subplot(3,2,5)
plot(walkingZ)
title('Walking(Z)')
xlabel('samples(at 60hz)')
subplot(3,2,6)
plot(shufflingY)
title('shuffling(Z)')
xlabel('samples(at 60hz)')
