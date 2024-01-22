function [filteredSignal] = SavitzkyGolayFilter(Signal, FilterLength, FilterOrder, DerivateOrder, SamplingFrequency)
    %SAVITZKYGOLAYFILTER Summary of this function goes here
    %   Detailed explanation goes here
    
    if nargin==4
       SamplingFrequency=50;
    end
    
    [m,n] = size(Signal);
    DerivateOrder = DerivateOrder + 1;
    
    % *** check inputs ***
    if  rem(FilterLength,2)-1 ~= 0
            error('filter length is not an odd integer')
    elseif (FilterOrder) < (DerivateOrder)
            error('the derivative order is too large')  
    end 
    
    % This is added by sangui
    if FilterOrder > (FilterLength-1) 
        error('filter length is too small');
    end
    
    % *** calculate filter coefficients ***
    lc = (FilterLength-1)/2;                    %index
    
    X = fliplr(vander([-lc:lc]/SamplingFrequency));
    X = X(:,1:(FilterOrder+1));
    F = pinv(X);                     % invert
    
    
    % *** filter via convolution and take care of initial and end points ***
    for col = 1:size(Signal,2)
     %yss = conv(T([ones(1,lc-1) 1:m m*ones(1,lc-1)],col),F(DerivateOrder,:)');
     yss = conv(Signal([ones(1,lc-1) 1:m m*ones(1,lc)],col),F(DerivateOrder,:)');  % This looks better
     % Argument sizes are m+2*(lc-1)=m+FilterLength-3 and FilterLength
     % Therefore size of result is m+2*FilterLength-4=m+2*(FilterLength-2)
     
        
     % Form the total output
     %filteredSignal(:,col) = [yss(FilterLength-1:end-(FilterLength-2))];
     filteredSignal(:,col) = [yss(FilterLength-1:end-(FilterLength-1))];  % This looks better
     
     %filteredSignal is now (m+2*(FilterLength-2)-FilterLength-FilterLength+1=m-4+1=m-3
    
    end
    
    if DerivateOrder > 1
     filteredSignal = (DerivateOrder-1)*(-1).^rem(DerivateOrder-1,2)*filteredSignal; 
    % added by sangui to adjust for sign of derivative
    % end of program
end