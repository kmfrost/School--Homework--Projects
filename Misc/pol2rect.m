function [ rect_form ] = pol2rect( mag,angle_degrees )
% Angle must be in degrees
angle_rad = radians(angle_degrees)
rect_form = mag.*exp(1i*angle_rad)

end

