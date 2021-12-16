function  plot_indices(T,Te,XM,XMe,S,Se,FM,FMe)
    sample_T = linspace(1,size(T,2),size(T,2));
    sample_S = linspace(1,size(S,2),size(S,2));

    threshold_T = ones(size(T));
    threshold_S = ones(size(S));
    
    figure(1);
    plot(sample_T,T)
    hold on;
    plot(sample_T,threshold_T*XM,'-.r')
    title("T^2 index");
    xlabel('Sample #');
    ylabel('T^2 index');
    hold off;
    
    figure(2);
    plot(sample_T,Te)
    hold on;
    plot(sample_T,threshold_T*XMe,'-.r')
    title("Te^2 index");
    xlabel('Sample #');
    ylabel('Te^2 index');
    hold off;
    
    figure(3);
    plot(sample_S,S)
    hold on;
    plot(sample_S,threshold_S*FM,'-.r')
    title("S^2 index");
    xlabel('Sample #');
    ylabel('S^2 index');
    hold off;
    
    figure(4);
    plot(sample_S,Se)
    hold on;
    plot(sample_S,threshold_S*FMe,'-.r')
    title("Se^2 index");
    xlabel('Sample #');
    ylabel('Se^2 index');
    hold off;
end

