

function [precision] = PrecisionVersusBase( BaseValue ) % returns precision


PrecisionValue = BaseValue; % Start precision here
while( BaseValue + PrecisionValue > BaseValue ) % continue until precision has no
% effect on base.
PrecisionValue = PrecisionValue / 2; % make precision smaller.
end
PrecsionValue = PrecisionValue * 2; % Move back on ste

