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
%% Real time data?
