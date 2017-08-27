%read 1D array from serpent input([1*2n+1]) and turn it to an array of
%cross sections [1*n] 


function XS_array = read_1d_array(serpent_data_name, row_nb, value_nb, isCR, heights, rod_height)
% row_nb in the serpent data matrix
% value_nb: nb of values to be read, usually = energy group nb;
% heights is needed for control rods
    if nargin == 3
        isCR = false;
        heights = [];
    end

    
    for i=1:value_nb
        k=i*2-1;
        if isCR
            seg_nb =4;
            xsg = sprintf('%10.8e*step_rod(%s-%f)', serpent_data_name(1, k) ,  rod_height,  heights(1));
            for seg = 2:seg_nb
                xsg = sprintf('%s + %10.8e*step_rod(%s-%f)', xsg, serpent_data_name(seg, k), rod_height, heights(seg));
            end
            
            XS_array(i)= {xsg};
        else
            XS_array(i)= serpent_data_name(row_nb, k);
        end
    end   
end
