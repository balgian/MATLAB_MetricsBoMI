function [extentError] = ExtError(CursorXY, Target, IndexTimeCursorAfterLeavingHomeTarget)
%EXTERROR Summary of this function goes here
%   Detailed explanation goes here

% Coordinates of the cursor when leaving the home target for the first time
P1 = [CursorXY(1,1) CursorXY(1,2)]; 

if IndexTimeCursorAfterLeavingHomeTarget>length(CursorXY)
    IndexTimeCursorAfterLeavingHomeTarget=length(CursorXY);
end

try
% Coordinates of the cursor at IndexTimeCursorAfterLeavingHomeTarget time after leaving the home target
P0 = [CursorXY(IndexTimeCursorAfterLeavingHomeTarget,1) CursorXY(IndexTimeCursorAfterLeavingHomeTarget,2)]; 
catch
    keyboard
end

% Coordinates of the peripheral target
P2 = Target; 

extentError = norm(P0-P1) - norm(P2-P1);
end

