function [s_bisec] = sparams_bisect(filename)
% This function bisect insertion loss. (S21 and S12)
% But does not change reflection. (S11 and S22) 

% Read a s-parameters file
s_obj = sparameters(filename); 

% Squre root s21 and s12
s21_bisec = sqrt(s_obj.Parameters(2,1,:));
s12_bisec = sqrt(s_obj.Parameters(1,2,:));
s21_bisec = s21_bisec(:);
s12_bisec = s12_bisec(:);

% Adjust phase for s21
phase_desired = unwrap(2*angle(s21_bisec))/2;
phase_desired_wrapped = wrapToPi(phase_desired);
mag_desired = abs(s21_bisec);
[x,y] = pol2cart(phase_desired_wrapped,mag_desired);
s21_bisec_desired = x+i*y;

% Adjust phase for s12
phase_desired = unwrap(2*angle(s12_bisec))/2;
phase_desired_wrapped = wrapToPi(phase_desired);
mag_desired = abs(s12_bisec);
[x,y] = pol2cart(phase_desired_wrapped,mag_desired);
s12_bisec_desired = x+i*y;

% Updata s-parameters (s21 and a12)
s_bisec = s_obj;
s_bisec.Parameters(2,1,:) = s21_bisec_desired;
s_bisec.Parameters(1,2,:) = s12_bisec_desired;

end