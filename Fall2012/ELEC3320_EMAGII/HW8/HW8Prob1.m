%#!/usr/bin/env octave -q
%% Calculating TE Cutoff Frequency
%  Problem 7.1 and 7.2 from the text.
%  EMAG II - Dr. Baginski
%  2012/09/11
%  HW 8, Problem 1, Wentworth 7.1, 7.2, Page 424
clc;
clear all;
fprintf('HW8\n%s\n\n',date());
% Constants
e_0 		= (1e-9/(36*pi));
u_0 		= (4e-7*pi);

% Given Parameters
aa			= [ 4.3  *0.0254;	0.9*0.0254 ];
bb 		= [ 2.150*0.0254; 0.6*0.0254 ];
modes 	=  [ 1,0; 2,0; 0,1; 1,1; 2,1; 3,0; 3,1; 4,0; 0,2 ];
for prob = [1 2]
	a = aa(prob);
	b = bb(prob);
	fprintf('Prob 7.%d\n',prob);
	for i = 1:length(modes)
		m = modes(i,1);
		n = modes(i,2);
		% General equation to calculate the cutoff frequency.
		f_c	 	= 0.5 * (m/sqrt(u_0*e_0)) * sqrt((n/a)^2 + (m/b)^2);
		fprintf('TE Mode:           (%d,%d)\n',m,n);
		fprintf('Cutoff Frequency:   %0.3f GHz\n',f_c*1e-9);
	end
	fprintf('\n');
end

fprintf('\n\n');
