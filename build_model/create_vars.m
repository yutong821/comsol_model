global isTMSR dimNb reactor;
global xs_name_unit_map;
global domains universes fuel_univ fuel_domNb temp_indep_comps;
global rod_positions control_rods;
fprintf('defining geometry and thermal properties variables\n')

model.variable.create('var1');
model.variable('var1').model('mod1');
model.variable('var1').set('DT', '100[K]', 'core temperature rise');
model.variable('var1').set('mL', 'Qcore*decay/cpL/DT', 'salt mass flowrate');
model.variable('var1').set('g', '9.81[m/s^2]', 'gravitational acceleration');
model.variable('var1').set('SA', '6/d', 'pebble specific surface area');
model.variable('var1').set('v0in', 'mL*rhoL/Ain');
model.variable('var1').set('v0ghost', 'mL*rhoL/Ainghost');
model.variable('var1').set('Acore2', 'pi*2*(2.8656[m]-1.5[m])*0.9[m]', 'inlet cross-sectional area on diverging region inner reflector');
model.variable('var1').set('Acenter', 'pi*2*Hinlet*(0.35[m])', 'inlet cross-sectional area on core plug flow region inner reflector');
model.variable('var1').set('Ain', '2.8743 [m^2]');
model.variable('var1').set('Ainghost', '3.29867 [m^2]');
model.variable('var1').label('Geometric properties');

model.variable.create('var2');
model.variable('var2').model('mod1');
model.variable('var2').set('Kbr', 'd^2/1012.5', 'bed permeability, Ergun/Kozeni');
model.variable('var2').set('cF', '0.52', 'Forchheimer drag coefficient, from Ergun correlation (Beaver coefficient)');
model.variable('var2').set('ep', '0.40', 'porosity');
model.variable('var2').set('bF', 'cF*rho_flibe(T_flibe)/(Kbr^0.5)', 'Forcheimer coefficient');
model.variable('var2').set('ec', '1', 'fictional porosity representing channels in the central reflector');
model.variable('var2').set('d', '3[cm]', 'pebble diameter');
model.variable('var2').label('Porous media properties');

model.variable.create('var3');
model.variable('var3').model('mod1');
model.variable('var3').set('cpL', '2415.78[J/kg/K]', 'salt heat capacity, constant');
model.variable('var3').set('rhoL', '1962.67[kg/m^3]', 'salt density, 650C');
model.variable('var3').set('muL', '0.00678[Pa*s]', 'salt viscosity, 650C');
model.variable('var3').set('kL', '1.091[W/m/K]', 'salt thermal conductivity, 650C');
model.variable('var3').set('betaL', '0.00025[1/K]', 'salt thermal expansion coefficient, constant');
model.variable('var3').set('Tav', '650[degC]', 'salt reference temp for beta');
model.variable('var3').set('Pr', 'muL*cpL/kL');

if isTMSR
    model.variable('var3').set('h_conv', '6000');
else
    model.variable('var3').set('h_conv', '(2+1.1*(Pr^(1.0/3))*(Re^(3.0/5)))*kL/d', '(2+1.1*Pr^(1/3)*(rhoL*d*br.U/muL)^0.6)*kL/d');
    model.variable('var3').set('Re', '(rhoL*d*br.U/muL)');
end
model.variable('var3').label('Salt thermal-hydraulics properties');

%% fuel thermal properties
model.variable.create('var4');
model.variable('var4').model('mod1');
model.variable('var4').set('rho_fuel', '1810[kg/m^3]', 'sinap ppt(Overview of TMSR-SF1 & SF0)');
model.variable('var4').set('k_fuel', '15[W/m/K]');
model.variable('var4').set('cp_fuel', '1744[J/kg/K]', 'graphite fuel heat capacity');
model.variable('var4').selection.geom('geom1', dimNb);
model.variable('var4').selection.set(fuel_domNb);

model.variable('var4').label('fuel thermal properties');

%% cross section data
fprintf('defining cross-section variables\n')
nameSet =   {'scat', 'nsf', 'rem', 'tot', 'diff2', 'beta', 'betas', ...
    'lambdas', 'kappa', 'diff1', 'invV', 'fiss', 'chit', 'chip', 'chid'};
unitSet = {'[1/cm]', '[1/cm]', '[1/cm]', '[1/cm]', '[cm]', '', '', ...
    '[1/s]', '[MeV]', '[cm]', '[s/cm]', '[1/cm]', '', '', ''};
xs_name_unit_map = containers.Map(nameSet,unitSet);


%% Control rods XS
fprintf('  for control rods\n')
%define step function for reactivity insertion
model.func.create('str', 'Step');
model.func('str').label('str');
model.func('str').set('funcname', 'str');
model.func('str').set('to', '1');
model.func('str').set('smooth', '0');
model.func('str').set('from', '0');
model.func('str').set('location', '0');

% define the variables for each control rod
if ~isTMSR
    for i = 1:length(control_rods)
        name = control_rods{i};
        domNb = domains(name);
        % create a global parameter like h_CRCC1 to denote the current position for
        % control rod CRCC1
        model.param.set(sprintf('h_%s',name), num2str(rod_positions(i)));

        % create a variable that contains all the xs variables for the control
        % rod
        model.variable.create(['var_xs' name]);
        model.variable(['var_xs' name]).model('mod1');
        model = process_rod(model, ['var_xs' name]', sprintf('h_%s', name));
        model.variable(['var_xs' name]).selection.geom('geom1', dimNb);
        model.variable(['var_xs' name]).selection.set(domNb);
        model.variable(['var_xs' name]).label(['xs_rod' name]);
    end
end

%% Fuel regions XS
fprintf('  for fuel regions\n')
for i = 1:length(fuel_univ)
    var_name = ['fuel_xs_var', num2str(i)];
    model.variable.create(var_name);
    model.variable(var_name).model('mod1');
    model = process_fuel(model, var_name, fuel_univ(i));
    model.variable(var_name).selection.geom('geom1', dimNb);
    model.variable(var_name).selection.set(fuel_domNb(i));
    model.variable(var_name).label(['XS_pb', num2str(i)]);
end

%% Temperature independent components XS
fprintf('  for temperature independent components\n')
% tested
% scattering XS for OR in the serpent res file 'case_1.m'
% is the same as the values in COMSOL
for i = 1:length(temp_indep_comps)
    name = temp_indep_comps{i};
    domNb = domains(name);
    univ = universes(name);
    model.variable.create(['var_xs_' name]);
    model.variable(['var_xs_' name]).model('mod1');
    model = process_fixed_components(model, ['var_xs_' name], univ);
    model.variable(['var_xs_' name]).selection.geom('geom1', dimNb);
    model.variable(['var_xs_' name]).selection.set(domNb);
    model.variable(['var_xs_' name]).label(['xs_' name]);
end


%% lower flibe region for TMSR
if isTMSR     
    global data_path
    model.variable.create('var17');
    model.variable('var17').model('mod1');
    model = process_flibe(model, [data_path, 'flibe\'], 'var17', universes('salt'));
    model.variable('var17').selection.geom('geom1', dimNb);
    model.variable('var17').selection.set(domains('salt'));
    model.variable('var17').label('XS_flibe');
end



%% variables used to compute power density
fprintf('defining other non-cross-section variables\n')

model.variable.create('var18');
model.variable('var18').model('mod1');
model.variable('var18').set('Pdensity', ...
    'kappa1*fiss1*Flux1+kappa2*fiss2*Flux2+kappa3*fiss3*Flux3+kappa4*fiss4*Flux4+kappa5*fiss5*Flux5+kappa6*fiss6*Flux6+kappa7*fiss7*Flux7+kappa8*fiss8*Flux8', 'power density');
model.variable('var18').set('PdensityN', ...
    'Pdensity*Pop/Pint', 'power density normalized to Pop');
model.variable('var18').set('Pint', 'intop1(Pdensity)', 'integrated total core power');
model.variable('var18').set('PintN', 'intop1(PdensityN)', 'integrated total core power normalized to Pop, should be equal to Pop');
model.variable('var18').selection.geom('geom1', dimNb);
model.variable('var18').selection.set(cell2mat(values(domains)));
model.variable('var18').label('power');

model.variable.create('var19');
model.variable('var19').model('mod1');
model.variable('var19').set('lambda', 'lambda_critical');
model.variable('var19').label('lambda');

%% create T_fuel_i varaibles temporarily for testing
% model.variable.create('var_T_fuel');
% model.variable('var_T_fuel').model('mod1');
% for i = 1:24
% model.variable('var_T_fuel').set(['T_fuel_', num2str(i)], 'T_fuel');
% end

% if reactor == 'Mk1'
%  % adding a heat exchanger model to Mk1, not tested
%     model.variable.create('var24');
%     model.variable('var24').model('mod1');
%     model.variable('var24').set('T_inlet_loop', '(TL_out - Q_real/mL/cpL)*str(t-120)', 'inlet coolant temperature that is computed from the core outlet temeprature');
%     model.variable('var24').set('Q_real', 'c_min*(TL_out-T_air_in)*eta', 'real heat exchanger power');
%     model.variable('var24').set('eta', '0.9', 'heat exchanger efficiency');
%     model.variable('var24').set('c_min', '461540[J/K]', 'min(mCp_air, mCp_flibe)');
%     model.variable('var24').set('T_air_in', '418.6[C]', 'cold air inlet temperature');        
%     model.variable('var24').label('T_inlet_loop');
% end