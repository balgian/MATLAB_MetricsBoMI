function [fig] = PlotMetric(FigName, PathFig, Metric, Title, YLabel, Legend, Visible)
%PLOTMETRIC Summary of this function goes here
%   Detailed explanation goes here
    
    if nargin==6
        Visible = 'on';
    end
    folderName = PathFig +"\"+FigName;
        if not(isfolder(folderName))
            mkdir (folderName)
        end
        
        % Metric among Trials
        fig = figure('NumberTitle','off','Name',Title + ": " + FigName,'WindowState', 'maximized', 'Visible', Visible);
        groupname = {'A','B','B','B','B','A','B','B','B','B','A'};
        colors = ["#0072BD","#9C9C9C"];
        colors = colors(findgroups(groupname));
        b = NaN(size(Metric,2),1);
        hold on
        for i=1:size(Metric,2)
            b(i) = boxchart(Metric(:,i),'MarkerStyle','none','BoxFaceColor',colors(i),'XData',i*ones(size(Metric,1),1));
            scatter(i+0.5,Metric(:,i),'filled' ,'MarkerFaceColor',colors(i), 'MarkerEdgeAlpha', 0, 'MarkerFaceAlpha', 0.5);
        end
        hold off
        ylim([min(quantile(Metric,0.25)-1.5*iqr(Metric)) max(quantile(Metric,0.75)+1.5*iqr(Metric))]);
        ax = gca;
        ax.XAxis.Categories = categorical(1:size(Metric,2));
        title(Title + ": " + FigName)
        ylabel(YLabel)
        xlabel('Trials')
        legend(b, Legend, 'NumColumns',3, 'Location', 'southeast');
        saveas(fig, folderName + "\" + FigName + Title, 'png');
end

