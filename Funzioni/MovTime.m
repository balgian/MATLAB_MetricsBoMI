function [movementTime] = MovTime(Time)
    %METRICS Summary of this function goes here
    %   Detailed explanation goes here
    
    % Make the first time point equal to 0
    Time = Time-Time(1);
    Time=Time/1000;
    movementTime = Time(end)-Time(1);
end

