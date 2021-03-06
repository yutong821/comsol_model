% TMSR 
global reactor;
reactor = 'TMSR';

%% Define global variables for the model that can be used across the files and functions

global general_path data_path fuel_data_path; 
global dimNb dnb gnb unb OpPower;
global isTMSR isVerbose isMultiScale isSp3 hasRods;
global is_get_coef_from_file;
global output_path

% domain numbers and ....universe numbers
global domains gr_comps fuel_domNb universes temp_indep_comps fuel_univ;
global flibe_domains;
global pm_domains main_pm_domains;

% pebble design
global pebbles_region region_coated region_fuel_kernel;

% boundaries
global dirichelet_b inlet_temp_bound out_flow_bound;


% solver mode
global transient_type
transient_type = 'overcooling'; %'ext_RI_step';% 'overcooling';

general_path = 'TMSR';
data_path = 'TMSR\XS_data\';
output_path = 'results\TMSR\multiscale_OC\';

dimNb= 2; % model dimension, 2 or 3
dnb=6; % delayed neutron precursor group number
gnb=8; % energy group number
unb = 4;
pebbles_region = 4; % number of regions in a fuel pebble, e.g.: sublayers in fuel(containing triso particles), shell
region_coated=1; % number of regions in TRISO coat
region_fuel_kernel=3; % number of regions in the fuel kernel in a TRISO particle

isVerbose = true;
is_get_coef_from_file = true;

%Define input variables for the model 
isMultiScale= true;
if isMultiScale
    fuel_data_path = 'TMSR\XS_data\multi_fuel_3_3\';
else
    fuel_data_path = 'TMSR\XS_data\fuel\';
end

isSp3 = false;
isTMSR = true;
hasRods = false;


domainNames = {'fuel', 'salt', 'gr'};
uvalueSet = [3, 4, 1];
if dimNb == 2
    dvalueSet = [2, 1, 3 ];
else %double checked in comsol
    dvalueSet = [3, 2, 1];
end
domains = containers.Map(domainNames,dvalueSet);
universes = containers.Map(domainNames, uvalueSet);

universe_names =["gr", "pb", "fuel", "flibe"];% the same order as in the serpent script, but called differently;
 % {'graphiteU', 'pebbleU', 'dispPebbleU', 'flibeU'} in serpent   
% for XS definition
temp_indep_comps = {'gr'};
% for material definition
gr_comps = {'gr'};

%channel_domains = cell2mat(values(domains, {'salt'}));

% for setting fuel XS and heat generation domains
fuel_domNb = [domains('fuel')];
fuel_univ = [universes('fuel')];

% for porous media mmtm module and material properties
porous_media = {'fuel'};
valueSet = values(domains, porous_media);
pm_domains = cell2mat(valueSet);
main_pm_domains = pm_domains;

%% for flibe heat transfer module
flibe_domains = cell2mat(values(domains, {'salt', 'fuel'}));
if dimNb == 3
    inlet_temp_bound = [9, 10, 17, 18, 19, 20, 29, 33, 34, 38, 42, 44];
    out_flow_bound = [15, 16, 23, 24, 32, 36, 41, 46];
else
    inlet_temp_bound = [2 8];
    out_flow_bound = [5 10];
end

%% neutron diffusion module
if dimNb ==3
dirichelet_b = [1 2 3 4 5 6 19 20 23 24 25 26 27 34 36 38 41 43 47 50];
else
dirichelet_b = [2 5 7 11 14];
end

OpPower = '1E7[W]'; %string, input to comsol global variable 'Pop'
