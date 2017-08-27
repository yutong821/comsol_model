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

model.variable.create('var2');
model.variable('var2').model('mod1');
model.variable('var2').set('Kbr', 'd^2/1012.5', 'bed permeability, Ergun/Kozeni');
model.variable('var2').set('cF', '0.52', 'Forchheimer drag coefficient, from Ergun correlation (Beaver coefficient)');
model.variable('var2').set('ep', '0.40', 'porosity');
model.variable('var2').set('bF', 'cF*rho_flibe(T_flibe)/(Kbr^0.5)', 'Forcheimer coefficient');
model.variable('var2').set('ec', '1', 'fictional porosity representing channels in the central reflector');
model.variable('var2').set('d', '3[cm]', 'pebble diameter');

model.variable.create('var3');
model.variable('var3').model('mod1');
model.variable('var3').set('cpL', '2415.78[J/kg/K]', 'salt heat capacity, constant');
model.variable('var3').set('rhoL', '1962.67[kg/m^3]', 'salt density, 650C');
model.variable('var3').set('muL', '0.00678[Pa*s]', 'salt viscosity, 650C');
model.variable('var3').set('kL', '1.091[W/m/K]', 'salt thermal conductivity, 650C');
model.variable('var3').set('betaL', '0.00025[1/K]', 'salt thermal expansion coefficient, constant');
model.variable('var3').set('Tav', '650[degC]', 'salt reference temp for beta');
model.variable('var3').set('unitstest', 'betaL*To*rhoL*g');
model.variable('var3').set('Pr', 'muL*cpL/kL');


%% fuel thermal properties
model.variable.create('var4');
model.variable('var4').model('mod1');
model.variable('var4').set('rho_fuel', '1810[kg/m^3]', 'sinap ppt(Overview of TMSR-SF1 & SF0)');
model.variable('var4').set('k_fuel', '15[W/m/K]');
model.variable('var4').set('cp_fuel', '1744[J/kg/K]', 'graphite fuel heat capacity');
model.variable('var4').selection.geom('geom1', dimNb);
model.variable('var4').selection.set(domains('fuel'));
model.variable('var4').label('fuel properties');

%% cross section data
nameSet =   {'scat', 'nsf', 'rem', 'tot', 'diff2', 'beta', 'betas', ...
    'lambdas', 'kappa', 'diff1', 'invV', 'fiss', 'chit', 'chip', 'chid'};
unitSet = {'[1/cm]', '[1/cm]', '[1/cm]', '[1/cm]', '[cm]', '', '', ...
    '[1/s]', '[MeV]', '[cm]', '[s/cm]', '[1/cm]', '', '', ''};
data_units = containers.Map(nameSet,unitSet);


for i = 1:length(temp_indep_comps)
    name = temp_indep_comps{i};
    domNb = domains(name);
    univ = universes(name);
    model.variable.create(['var_xs_' name]);
    model.variable(['var_xs_' name]).model('mod1');
    model = process_fixed(model, char(strcat(data_path, "fixed", "\")), data_units, ['var_xs_' name], univ);
    model.variable(['var_xs_' name]).selection.geom('geom1', dimNb);
    model.variable(['var_xs_' name]).selection.set(domNb);
    model.variable(['var_xs_' name]).label(['xs_' name]);
end

if rod
        %define step function for reactivity insertion
        model.func.create('step_rod', 'Step');
        model.func('step_rod').label('step_rod');
        model.func('step_rod').set('funcname', 'step_rod');
        model.func('step_rod').set('to', '1');
        model.func('step_rod').set('smooth', '0');
        model.func('step_rod').set('from', '1');
        model.func('step_rod').set('location', '0');
    
        for i = 1:length(control_rods)
            name = control_rods{i};
            domNb = domains(name);
            model.param.set(sprintf('h_%s',name), num2str(control_rod_heights(i)));
            model.variable.create(['var_xs' name]);
            model.variable(['var_xs' name]).model('mod1');
            model = process_rod(model, char(strcat(data_path, "rod", "\")), data_units, ['var_xs' name]', heights, sprintf('h_%s', name));
            model.variable(['var_xs' name]).selection.geom('geom1', dimNb);
            model.variable(['var_xs' name]).selection.set(domNb);
            model.variable(['var_xs' name]).label(['xs_rod' name]);
        end
end

if TMSR  
    % lower flibe region
    model.variable.create('var17');
    model.variable('var17').model('mod1');
    model = process_flibe(model, [data_path, 'flibe\'], data_units, 'var17', unb, gnb, universes('salt'));
    model.variable('var17').selection.geom('geom1', dimNb);
    model.variable('var17').selection.set(domains('salt'));
    model.variable('var17').label('XS_flibe');
end

% fuel region  
model.variable.create('var16');
model.variable('var16').model('mod1');
model = process_fuel(model, fuel_data_path, data_units, 'var16', unb, fuel_univ, TMSR, MultiScale);
model.variable('var16').selection.geom('geom1', dimNb);
model.variable('var16').selection.set(fuel_domNb);
model.variable('var16').label('XS_pb');


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

% model.variable.create('var22');
% model.variable('var22').model('mod1');
% % define sumDelayedN for adding delayed neutrons in the neutron diffusion eq. 
% model.variable('var22').set('sumDelayedN', 'lambdas1*Conc1+lambdas2*Conc2+lambdas3*Conc3+lambdas4*Conc4+lambdas5*Conc5+lambdas6*Conc6', 'sum of lambda*C_i, for diffusion equation');
% model.variable('var22').set('sumN', ...
%     'nsf1*Flux1+nsf2*Flux2+nsf3*Flux3+nsf4*Flux4+nsf5*Flux5+nsf6*Flux6+nsf7*Flux7+nsf8*Flux8', 'sum of nuSigmafPhi_g, for delayed neutrons equations');
% model.variable('var22').selection.geom('geom1', dimNb);
% model.variable('var22').selection.set(cell2mat(values(domains)));
% model.variable('var22').label('delayed');

% create T_fuel_i varaibles temporarily for testing
model.variable.create('var_T_fuel');
model.variable('var_T_fuel').model('mod1');
for i = 1:24
model.variable('var_T_fuel').set(['T_fuel_', num2str(i)], 'T_fuel');
end
