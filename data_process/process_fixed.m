function model = process_fixed(model, data_path, data_units, comsol_var_name, u_gr)
    %{ 
    This function get the neutronics data from serpent output file for fuel 
    and input them in the comsol model 
    %}
    file_name = [data_path, 'case_1.m'];  

    fixed_data = read_fixed(file_name, u_gr);
    model = set_fixed(model, comsol_var_name, fixed_data, data_units);   
    run(file_name);
    gnb = 8;
    xsdata = containers.Map; 
    xsdata('scat') = read_2d_array(INF_S0, u_gr, gnb);   
    if size(size(xsdata('scat'))) ~= 2
        error('scattering matrix size is wrong');
    end
    xsdata('rem')= read_1d_array(INF_REMXS, u_gr, gnb);
    xsdata('nsf') = read_1d_array(INF_NSF, u_gr, gnb);
    xsdata('tot') = read_1d_array(INF_TOT, u_gr, gnb);
    xsdata('diff2') = 9/35.0./xsdata('tot');    
    for k = keys(xsdata)
        name = k{1};
        set_data(model, comsol_var_name,  name, 'NA', xsdata(name), data_units(name), 'fixed');
    end

end


