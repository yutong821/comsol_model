function model = run_ss_sequence()
    %{
    run the eigenvalue, steady state, scaling solvers sequence to find the
    final steady state results

    the function can either run the solvers step-by-step or load some
    intermediate results from files
    %}

    global transient_type;
    global output_path;
    
    switch transient_type
        case 'control_rods_removal'
            isControlRodRemoval = true;
        otherwise
            isControlRodRemoval = false;
    end


    isLoadScalingFromFile = false;

    if isLoadScalingFromFile
        if isControlRodRemoval
            model = mphload([output_path, 'scaling_cr.mph']);
        else
            model = mphload([output_path, 'scaling.mph']);
        end
    else
        
        isLoadEigenFromFile = false; % boolean, loading eigenvalue results from file
        isLoadSSFromFile = false; % boolean, loading steady state results from file

        if isLoadEigenFromFile
            if isControlRodRemoval
                model = mphload([output_path, 'eigen_cr.mph']);
            else
                model = mphload([output_path, 'eigen.mph']);
            end
        else
            if isLoadSSFromFile
                fprintf('Loading steady state results from file ss.mph or ss_cr.mph\n');
                if isControlRodRemoval
                    model = mphload([output_path, 'ss_cr.mph']);
                else
                    model = mphload([output_path, 'ss.mph']);
                end
            else
                fprintf('Running the solvers from the beginning\n');
                model = start_from_begining(output_path);
            end

            if isControlRodRemoval
                fprintf('Search for control rod positions\n');
                model = search_control_rod_positions(model);    
            end
        end

        %% Scale the flux to power
        fprintf('\nScaling the flux and delayed neutron precursor concentration...\n');
        model = create_and_run_scaling(model, isControlRodRemoval);


    end
end
function model = start_from_begining(output_path)
    %% 1st eigenvalue solution
    isLoad1stEigenFromFile = false; %load the first eigenvalue solution(with initial temperature conditions) from file
    if isLoad1stEigenFromFile
        model = mphload([output_path, 'eigen_1st.mph']);
        lambda_eigen = mphglobal(model, 'lambda');
        fprintf('\nThe eigenvalue with initial temperature conditions is\n');
        fprintf('%.10f \n', lambda_eigen);
    else
        run('create_model.m');
        %% solvers
        model = create_eigenvalue_solver(model, isTMSR);
        % Eigenvalue calculation
        isInitialRun = true;
        [model, lambda_eigen] = run_an_eigen_solver(model, 'eigen_1st.mph', isInitialRun);
    end

    % run the following line only if temperature feedback coefficients are needed
     %run('calc_temperature_feedback_coefs.m'); 
    
    %% 1st steady state solution with eigenvalue power and flux distribution
    % - create steady state solver
    % - run the solver
    % - create steady state results
    fprintf('\nRun steady state study\n');
    model = create_steady_state_solver(model);
    model = run_a_steady_state_solver(model, lambda_eigen, 'ss_1st.mph');    
    switch reactor
        case 'Mk1'
            run('create_3d_steady_state_results');
        case 'TMSR'
            run('create_steady_state_results');
    end

    % Iterate betwen eigenvalue and steady state computation until the result converges
    model = iterate_ss_eigen(model, 'ss.mph', 'eigen.mph'); 
    

end

function model = search_control_rod_positions(model)
% Insert control rods until keff = keff_no_rods * (1-1.4%),
% assuming 1.4% excess reactivity during online refueling operation
    global control_rods domains;
    excess_rho = 1.4/100; % 0.025 is for PWRs
    lambda_eigen = mphglobal(model, 'lambda');
    target_eigen = lambda_eigen * (1+excess_rho);
    fprintf('\nTarget eigenvalue is\n');
    fprintf('%.10f \n', target_eigen);
    rod_height = 4.5; % initial rod height to start searching

    while abs(lambda_eigen - target_eigen) > 10^-5     
        for i = 1:length(control_rods)
                name = control_rods{i};
                domNb = domains(name);
                % create a global parameter like h_CRCC1 to denote the current position for
                % control rod CRCC1
                model.param.set(sprintf('h_%s',name), num2str(rod_height));
        end
        [model, lambda_eigen] = run_an_eigen_solver(model, 'eigen_cr.mph', false);
        
        % if new_eigen > target_eigen, keff < target_keff, need less control
        % rods insertion, need to increase the rod_height
        % The proportional controller 30 is chosen based on control rods
        % worth in this height region. 
        rod_height = max(rod_height + 30 * (lambda_eigen - target_eigen), 0);
        fprintf('Searching new rod height %f\n', rod_height);
    end

    %% start a new iteration, this time iterate between steady state and eigenvalue 
    model = run_a_steady_state_solver(model, lambda_eigen, 'ss_cr.mph'); 
    model = iterate_ss_eigen(model, 'ss_cr.mph', 'eigen_cr.mph');  
end

function model = iterate_ss_eigen(model, ss_name, eigen_name) 
    %iterate betwen eigenvalue and steady state computation until the result converges
    fprintf('iterate between eigenvalue solver and steady state solver');
    new_eigen = 0;
    isInitialRun = false;
    lambda_eigen = mphglobal(model, 'lambda');
    while abs(new_eigen - lambda_eigen) > 0.00001                 
        % Rerun eigenvalue calculation with temperature profile from steady state
        lambda_eigen = new_eigen;
        [model, new_eigen] = run_an_eigen_solver(model, eigen_name, isInitialRun);
        model = run_a_steady_state_solver(model, lambda_eigen, ss_name);  
    end
end