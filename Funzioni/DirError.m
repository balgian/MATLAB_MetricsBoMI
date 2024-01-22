function [dirError] = DirError(CursorXY, Target, IndexTimeCursorAfterLeavingHomeTarget)
%DIRERROR Summary of this function goes here
%   Detailed explanation goes here

% Coordinates of the cursor when leaving the home target for the first time
P1 = [CursorXY(1,1) CursorXY(1,2)]; 

if IndexTimeCursorAfterLeavingHomeTarget>length(CursorXY)
    IndexTimeCursorAfterLeavingHomeTarget=length(CursorXY);
end

try

% Coordinates of the cursor 0.5 s after leaving the home target
P0 = [CursorXY(IndexTimeCursorAfterLeavingHomeTarget,1) CursorXY(IndexTimeCursorAfterLeavingHomeTarget,2)]; 
catch
    keyboard
end

% Coordinates of the peripheral target
P2 = Target; 

% Computing the two normalized vectors 
n1 = (P0-P1)/norm(P0-P1);
n2 = (P2-P1)/norm(P2-P1);

% Directional Error
dirError = rad2deg(atan2(norm(det([n2; n1])), dot(n1, n2)));
end

