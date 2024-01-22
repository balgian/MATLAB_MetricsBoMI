function [totjerk] = TotJerk(Time, CursorXY, SamplingFrequencyFilter)
    %TOTJERK Summary of this function goes here
    %   Detailed explanation goes here
    
    % Make the first time point equal to 0
    Time = Time-Time(1);
    Time=Time/1000;
    MovTime = Time(end)-Time(1);

    Dist=[];
    for i = 1:length(Time)-1
        Dist(i) = norm(CursorXY(i+1,:)-CursorXY(i,:));
    end
    TotDist = sum(Dist);
    
    traj=SavitzkyGolayFilter(CursorXY,11,4,0,SamplingFrequencyFilter);
    jerk=SavitzkyGolayFilter(traj,11,4,3,SamplingFrequencyFilter);
    mjerk =((jerk(:,1).^2+jerk(:,2).^2)).*(MovTime.^6)/TotDist.^2;
    totjerk = mean(mjerk);
    totjerk=sqrt(totjerk./2);
end

