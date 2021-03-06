clear all;
close all;

fprintf('Define parameters used in matlab\n');
run('model_attributes.m');

fprintf('Solver sequence\n');
model = run_ss_sequence();

%% Transient calculation
fprintf('\nRunning transient...\n');
model = create_transient_study(model, transient_type);