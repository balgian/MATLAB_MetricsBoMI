function [aspectRatio] = AspectRatio(CursorXY)
    %ASPECTRATIO Summary of this function goes here
    %   Detailed explanation goes here

    theta = atan2(CursorXY(end,2)-CursorXY(1,2),CursorXY(end,1)-CursorXY(1,1));
    theta = -theta; %Rotate back
    R = [cos(theta) sin(theta);-sin(theta) cos(theta)];
    newXY = CursorXY*R;
    %Center the first point to be the origin
    newXY(:,1) = newXY(:,1)-newXY(1,1);newXY(:,2) = newXY(:,2)-newXY(1,2);
    maxperpdist = max(abs(newXY(:,2)));
    StLineDist = norm(CursorXY(end,:)-CursorXY(1,:));
    aspectRatio = maxperpdist/StLineDist;
end

