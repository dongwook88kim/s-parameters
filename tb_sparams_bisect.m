clear all
close all

% Load function
filename = 'input.s2p';
s_bisec = sparams_bisect(filename);
s_orig = sparameters(filename);

% Extract data
s21_bisec = s_bisec.Parameters(2,1,:);
s21_bisec = s21_bisec(:);
freq = s_bisec.Frequencies;
s21_orig = s_orig.Parameters(2,1,:);
s21_orig = s21_orig(:);

% Plot
figure()

% Magnitude
subplot(2,1,1)
plot(freq*1e-9, 20*log10(abs(s21_bisec)), 'r', ...
    freq*1e-9, 20*log10(abs(s21_orig)), 'b')
title('S21 magnitude')
legend('bisect', 'original')
grid('on')

% Phase
subplot(2,1,2)
plot(freq*1e-9, unwrap(angle(s21_bisec)), 'r', ...
    freq*1e-9, unwrap(angle(s21_orig)), 'b');
title('S21 phase')
legend('bisect', 'original')
grid('on')
