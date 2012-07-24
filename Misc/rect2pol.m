function [ MAG ANG ] = rect2pol( rect_form )
MAG   = abs(rect_form);
ANG = degrees(angle(rect_form));
end

