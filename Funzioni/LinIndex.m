function [linearityIndex] = LinIndex(Time, CursorXY)
    %LININDEX Summary of this function goes here
    %   Detailed explanation goes here

    StLineDist = norm(CursorXY(end,:)-CursorXY(1,:));
    Dist=[];
    for i = 1:length(Time)-1
        Dist(i) = norm(CursorXY(i+1,:)-CursorXY(i,:));
    end
    TotDist = sum(Dist);
    linearityIndex = TotDist/StLineDist;
end

