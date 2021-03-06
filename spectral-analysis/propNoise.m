clear all; clc; close all;

% Background noise spectrum
fbacg = 'Spectra/test-elecroom-12-jan-2019/Jan 12 12_54_26 bacg noise.csv'

% Motor noise spectrum
fmotor = 'Spectra/test-elecroom-12-jan-2019/Jan 12 13_00_30 motor.csv'

% Overall noise spectrum
ftotal = 'Spectra/test-elecroom-12-jan-2019/Jan 12 14_14_56 prop + motor at 0.67 90 10 and 9645 rpm.csv'

% Load spectra
bacg = readSpec(fbacg, 'rew');
motor = readSpec(fmotor, 'rew');
total = readSpec(ftotal, 'rew');

% Get propeller noise
propeller = removeNoise(total, motor, true);

% motor = abs(removeNoise(motor, bacg, true));

% Plot original recording
semilogx(total(:, 1), total(:, 2)); hold on;

% % Plot bacg + motor noise
% semilogx(motor(:, 1), motor(:, 2));

% % Plot background noise
% semilogx(bacg(:, 1), bacg(:, 2));

% semilogx(motor(:, 1), motor(:, 2));

% Plot corrected noise
semilogx(propeller(:, 1), propeller(:, 2));

% Label axes
% legend('Background + Motor + Propeller', 'Background + Motor', 'Background');
% xlabel('Frequency [Hz]');
% ylabel('SPL [dB]');