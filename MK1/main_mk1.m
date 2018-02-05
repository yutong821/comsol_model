clear all;
close all;

fprintf('Define parameters used in matlab\n');
run('model_attributes.m');

fprintf('Solver sequence\n');
fprintf('Solver sequence\n');
global transient_type;
switch transient_type
    case 'control_rods_removal'
        isControlRodRemoval = true;
    otherwise
        isControlRodRemoval = false;
end
            
model = run_ss_sequence(isControlRodRemoval);

%% Transient calculation
fprintf('\nRunning transient...\n');
model = create_transient_study(model, transient_type);