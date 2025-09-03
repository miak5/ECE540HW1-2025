

function [precision] = PrecisionVersusBase( base ) % returns precision


precision = base; % Start precision here
while( base + precision > base ) % continue until precision has no
% effect on base.
precision = precision / 2; % make precision smaller.
end
precision = precision * 2; % Move back on ste
