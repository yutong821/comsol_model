
function res = plot_1d(X1, Y1, X2, Y2, flag, figtitle, saveTo)
    figure;
    fig = gcf;
    fig.PaperUnits = 'inches';
    fig.PaperPosition = [0 0 6 3];

    stairs(X1, Y1, 'k-')
    hold on;
    stairs(X2, Y2, 'r-')

    %stairs(0:0.02:2.84, MC_axial, 'k-')
    folder_name = '';
    
    title(figtitle);
    if strcmp(flag, 'Radial')
        xlabel('Radius(m)');
    else
    xlabel('Height(m)');
    end
    ylabel('power density(normalized)');
    legend('diffusion', 'Ref');
    print(saveTo,'-dpng','-r0');

end