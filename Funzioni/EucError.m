function [euclideanError] = EucError(Time,CursorXY, Target, TimeCalcEucErr)
    %EUCERROR Summary of this function goes here
    %   Detailed explanation goes here

    % Make the first time point equal to 0
    Time = Time-Time(1);
    Time=Time/1000;

    % If TimeCalcEucErr automatically calculate euclidean errore for 2s if
    % Time is equal or longer
    if nargin==3
        TimeCalcEucErr = 2;
    end

    %First time sample when crossing TimeCalcEucErr seconds
    instantOfCalculation = find(Time>=TimeCalcEucErr,1);
    % If Time<TimeCalcEucErr, then use the final point
    if(isempty(instantOfCalculation))
        instantOfCalculation = length(Time);
    end
    CursorAtTheInstantWanted = CursorXY(instantOfCalculation,:);
    euclideanError = norm(CursorAtTheInstantWanted-Target);
end

