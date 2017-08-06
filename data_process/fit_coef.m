 function coef = fit_coef(temp_mat, data)
    % fit a linear function data = coef * temp_mat
        coef = containers.Map; 
        for k = keys(data)
            name = k{1};
            coef(name)=fit_matrix(temp_mat,  data(name));
        end
 end
 
 function coefs = fit_matrix(x, matrix_to_fit)
%{
Return coefs: 
- For scattering matrix coefs: 
    [

- For other type of XS coefs: 
    [beta11, beta12, ..beta1g;
     beta21, beta22, ..beta2g;
            ...
     betam1, betam2, .. betamg]
%}

    mat_size = size(matrix_to_fit); % caseNb*XSmatrixSize, e.g. scattering matrix: temp_case_nb*8*8
    x_size = size(x);
    coefs = ones([x_size(2) mat_size(2:end)]);

    if length(mat_size) == 3 %3D matrix, e.g. scattering matrix for different cases
        if mat_size(1) ~= length(x)  % case nb
            error('x, y matrix not fit')
        end
        for g = 1 : mat_size(3)
            y = matrix_to_fit(:, :, g);
            coefs(:, :, g) = x\y;
        end
    end 

    if length(mat_size) == 2 %2D matrix
        coefs=x\matrix_to_fit;
    end 
end

