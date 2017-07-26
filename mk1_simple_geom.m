function out = model
%
% mk1_simple_geom.m
%
% Model exported on Jul 26 2017, 10:10 by COMSOL 5.2.1.229.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('D:\diffusion_models\model\m_files');

model.label('mk1_simple_geom.mph');

model.comments(['Untitled\n\n']);

model.param.set('OCSlope', '-10', 'Over cooling inlet T drop slope');
model.param.set('OCOnset', '100', 'Over cooling start time, a very large time means it''s not triggered during the simulation');
model.param.set('eigenMode', '0', 'binary value for NON engenvalue mode(value = 1 if not engenvalue mode, value =0 if engenvalue mode)');
model.param.set('U', '0.000055[m/s]', 'upwards velocity');
model.param.set('Po', '0 [atm]', 'pressure');
model.param.set('Ochuteout', '0.8', 'defueling chute pressure multiplier');
model.param.set('T0_flibe', '600[degC]', 'inlet temperature');
model.param.set('T0_fuel', '800[degC]', 'initial temperature');
model.param.set('Houtlet', '1.5 [m]', 'outlet region height overlapping with active core region');
model.param.set('Hinlet', '1.501 [m]', 'inlet region height overlapping with active core region');
model.param.set('decay', '1', 'decay heat fraction of total power');
model.param.set('Qcore', '249[MW]', 'total core power');
model.param.set('Vcore', '16.99151[m^3]', 'total core volume');
model.param.set('Q', 'Qcore/Vcore[MW/m^3]', 'core average power density');
model.param.set('Qmax', 'Qcore*1.41/Vcore[MW/m^3]', 'core peak power density');
model.param.set('Vplug', '11[m^3]');
model.param.set('Qplug', 'Qcore/Vplug');
model.param.set('mL', '976[kg/s]', 'mass flow rate of the primary coolant');
model.param.set('mf', '1', 'fueling chute mass flowrate, fraction of total');
model.param.set('bottomInletFraction', '0.3', 'fraction of mass flow rate going through the bottom inlet');
model.param.set('Pci0', '1.3', 'center inlet pressure head (m) (boundary condition)');
model.param.set('Pcb0', 'Pci0+.2', 'bottom inlet pressure head(boundary condition)');
model.param.set('deltaHCenterInlet', '1.5', 'width of the center inlet opening');

model.modelNode.create('mod1');

model.geom.create('geom1', 3);

model.modelNode('mod1').label('FHR');
model.modelNode('mod1').defineLocalCoord(false);

model.func.create('step1', 'Step');
model.func.create('rm1', 'Ramp');
model.func.create('an4', 'Analytic');
model.func.create('an6', 'Analytic');
model.func.create('an9', 'Analytic');
model.func('step1').label('step_fun');
model.func('step1').set('funcname', 'step_fun');
model.func('step1').set('to', 'reactivity_insertion+1');
model.func('step1').set('smooth', '0');
model.func('step1').set('from', '1');
model.func('step1').set('location', '0.1');
model.func('rm1').set('location', 'OCOnset');
model.func('rm1').set('slope', 'OCSlope');
model.func('rm1').set('cutoff', '-100');
model.func('rm1').set('cutoffactive', true);
model.func('an4').label('FLiBe Density');
model.func('an4').set('args', {'T'});
model.func('an4').set('argunit', 'K');
model.func('an4').set('expr', '2413-0.488*T');
model.func('an4').set('plotargs', {'T' '400' '2000'});
model.func('an4').set('funcname', 'rho_flibe');
model.func('an4').set('fununit', 'kg/m^3');
model.func('an6').label('FLiBe Dynamic Viscosity');
model.func('an6').set('args', {'T'});
model.func('an6').set('argunit', 'K');
model.func('an6').set('expr', '1.16*10^(-4)*exp(3755/T)');
model.func('an6').set('plotargs', {'T' '600' '800'});
model.func('an6').set('funcname', 'mu_flibe');
model.func('an6').set('fununit', 'Pa*s');
model.func('an9').label('Inlet Velocity');
model.func('an9').set('args', {'z' 'z0'});
model.func('an9').set('expr', '(1-bottomInletFraction)/0.54*0.06*(z^2 - z0)');
model.func('an9').set('plotargs', {'z' '0' '1'; 'z0' '0' '1'});
model.func('an9').set('funcname', 'vel_in');

model.mesh.create('mesh1', 'geom1');

model.geom('geom1').create('wp1', 'WorkPlane');
model.geom('geom1').feature('wp1').set('quickplane', 'xz');
model.geom('geom1').feature('wp1').set('unite', 'on');
model.geom('geom1').feature('wp1').geom.create('pol1', 'Polygon');
model.geom('geom1').feature('wp1').geom.feature('pol1').label('center_ref');
model.geom('geom1').feature('wp1').geom.feature('pol1').set('source', 'table');
model.geom('geom1').feature('wp1').geom.feature('pol1').set('table', {'0' '0.416';  ...
'0.45' '0.416';  ...
'0.45' '1.275';  ...
'0.35' '1.4482';  ...
'0.35' '4.305';  ...
'0.71' '4.9285';  ...
'0.71' '5.7285';  ...
'0' '5.7285'});
model.geom('geom1').feature('wp1').geom.create('pol2', 'Polygon');
model.geom('geom1').feature('wp1').geom.feature('pol2').label('fuel');
model.geom('geom1').feature('wp1').geom.feature('pol2').set('source', 'table');
model.geom('geom1').feature('wp1').geom.feature('pol2').set('table', {'0.45' '0.416';  ...
'0.7541' '0.416';  ...
'1.05' '1.805';  ...
'1.05' '4.305';  ...
'0.8' '4.9285';  ...
'0.8' '5.7285';  ...
'0.71' '5.7285';  ...
'0.71' '4.9285';  ...
'0.35' '4.305';  ...
'0.35' '1.4482';  ...
'0.45' '1.275'});
model.geom('geom1').feature('wp1').geom.create('pol3', 'Polygon');
model.geom('geom1').feature('wp1').geom.feature('pol3').label('blanket');
model.geom('geom1').feature('wp1').geom.feature('pol3').set('source', 'table');
model.geom('geom1').feature('wp1').geom.feature('pol3').set('table', {'0.7541' '0.416';  ...
'0.8574' '0.416';  ...
'1.25' '1.805';  ...
'1.25' '4.305';  ...
'0.89' '4.9285';  ...
'0.89' '5.7285';  ...
'0.8' '5.7285';  ...
'0.8' '4.9285';  ...
'1.05' '4.305';  ...
'1.05' '1.805';  ...
'0.7541' '0.416';  ...
'0.45' '0.416'});
model.geom('geom1').feature('wp1').geom.create('pol4', 'Polygon');
model.geom('geom1').feature('wp1').geom.feature('pol4').label('outer_ref');
model.geom('geom1').feature('wp1').geom.feature('pol4').set('source', 'table');
model.geom('geom1').feature('wp1').geom.feature('pol4').set('table', {'0.8574' '0.416';  ...
'1.65' '0.416';  ...
'1.65' '5.7285';  ...
'1.35' '5.7285';  ...
'1.35' '4.9285';  ...
'1.35' '4.305';  ...
'1.35' '1.805';  ...
'1.25' '1.805';  ...
'0.8574' '0.416';  ...
'0.7541' '0.416'});
model.geom('geom1').feature('wp1').geom.create('r1', 'Rectangle');
model.geom('geom1').feature('wp1').geom.feature('r1').label('core_barrel');
model.geom('geom1').feature('wp1').geom.feature('r1').set('size', {'0.03' '5.7285-0.416'});
model.geom('geom1').feature('wp1').geom.feature('r1').set('pos', {'1.65' '0.416'});
model.geom('geom1').feature('wp1').geom.create('r2', 'Rectangle');
model.geom('geom1').feature('wp1').geom.feature('r2').label('downcomer');
model.geom('geom1').feature('wp1').geom.feature('r2').set('size', {'0.028' '5.7285-0.416'});
model.geom('geom1').feature('wp1').geom.feature('r2').set('pos', {'1.68' '0.416'});
model.geom('geom1').feature('wp1').geom.create('r3', 'Rectangle');
model.geom('geom1').feature('wp1').geom.feature('r3').label('vessel');
model.geom('geom1').feature('wp1').geom.feature('r3').set('size', {'0.06' '5.7285-0.416'});
model.geom('geom1').feature('wp1').geom.feature('r3').set('pos', {'1.708' '0.416'});
model.geom('geom1').feature('wp1').geom.create('r4', 'Rectangle');
model.geom('geom1').feature('wp1').geom.feature('r4').active(false);
model.geom('geom1').feature('wp1').geom.feature('r4').label('inlet');
model.geom('geom1').feature('wp1').geom.feature('r4').set('size', {'0.01' '1'});
model.geom('geom1').feature('wp1').geom.feature('r4').set('pos', {'0.35-0.01' '1.5'});
model.geom('geom1').feature('wp1').geom.create('r5', 'Rectangle');
model.geom('geom1').feature('wp1').geom.feature('r5').active(false);
model.geom('geom1').feature('wp1').geom.feature('r5').label('outlet_low');
model.geom('geom1').feature('wp1').geom.feature('r5').set('size', {'0.05' '0.5'});
model.geom('geom1').feature('wp1').geom.feature('r5').set('pos', {'1.25' '4.305-0.5'});
model.geom('geom1').feature('wp1').geom.create('pol5', 'Polygon');
model.geom('geom1').feature('wp1').geom.feature('pol5').active(false);
model.geom('geom1').feature('wp1').geom.feature('pol5').label('outlet_high');
model.geom('geom1').feature('wp1').geom.feature('pol5').set('source', 'table');
model.geom('geom1').feature('wp1').geom.feature('pol5').set('table', {'0.89' '4.9285'; '1.25' '4.305'; '1.3' '4.305'; '0.94' '4.9285'});
model.geom('geom1').feature('wp1').geom.create('pol6', 'Polygon');
model.geom('geom1').feature('wp1').geom.feature('pol6').label('ORCC');
model.geom('geom1').feature('wp1').geom.feature('pol6').set('source', 'table');
model.geom('geom1').feature('wp1').geom.feature('pol6').set('table', {'1.25' '1.805';  ...
'1.35' '1.805';  ...
'1.35' '5.7285';  ...
'0.89' '5.7285';  ...
'0.89' '4.9285';  ...
'1.25' '4.305'});
model.geom('geom1').create('rev1', 'Revolve');
model.geom('geom1').feature('rev1').set('angtype', 'full');
model.geom('geom1').feature('rev1').selection('input').set({'wp1'});
model.geom('geom1').create('wp2', 'WorkPlane');
model.geom('geom1').feature('wp2').set('quickz', '0.416');
model.geom('geom1').feature('wp2').set('unite', 'on');
model.geom('geom1').feature('wp2').geom.create('c1', 'Circle');
model.geom('geom1').feature('wp2').geom.feature('c1').set('selresult', 'on');
model.geom('geom1').feature('wp2').geom.feature('c1').set('r', '0.05');
model.geom('geom1').feature('wp2').geom.feature('c1').set('pos', {'0.275' '0'});
model.geom('geom1').feature('wp2').geom.create('c2', 'Circle');
model.geom('geom1').feature('wp2').geom.feature('c2').set('selresult', 'on');
model.geom('geom1').feature('wp2').geom.feature('c2').set('r', '0.05');
model.geom('geom1').feature('wp2').geom.feature('c2').set('pos', {'-0.275' '0'});
model.geom('geom1').feature('wp2').geom.create('c3', 'Circle');
model.geom('geom1').feature('wp2').geom.feature('c3').set('selresult', 'on');
model.geom('geom1').feature('wp2').geom.feature('c3').set('r', '0.05');
model.geom('geom1').feature('wp2').geom.feature('c3').set('pos', {'0' '-0.275'});
model.geom('geom1').feature('wp2').geom.create('c4', 'Circle');
model.geom('geom1').feature('wp2').geom.feature('c4').set('selresult', 'on');
model.geom('geom1').feature('wp2').geom.feature('c4').set('r', '0.05');
model.geom('geom1').feature('wp2').geom.feature('c4').set('pos', {'0' '0.275'});
model.geom('geom1').feature('wp2').geom.create('c5', 'Circle');
model.geom('geom1').feature('wp2').geom.feature('c5').set('selresult', 'on');
model.geom('geom1').feature('wp2').geom.feature('c5').set('r', '0.05');
model.geom('geom1').feature('wp2').geom.feature('c5').set('pos', {'-0.19445436' '0.19445436'});
model.geom('geom1').feature('wp2').geom.create('c6', 'Circle');
model.geom('geom1').feature('wp2').geom.feature('c6').set('selresult', 'on');
model.geom('geom1').feature('wp2').geom.feature('c6').set('r', '0.05');
model.geom('geom1').feature('wp2').geom.feature('c6').set('pos', {'0.19445436' '0.19445436'});
model.geom('geom1').feature('wp2').geom.create('c7', 'Circle');
model.geom('geom1').feature('wp2').geom.feature('c7').set('selresult', 'on');
model.geom('geom1').feature('wp2').geom.feature('c7').set('r', '0.05');
model.geom('geom1').feature('wp2').geom.feature('c7').set('pos', {'-0.19445436' '-0.19445436'});
model.geom('geom1').feature('wp2').geom.create('c8', 'Circle');
model.geom('geom1').feature('wp2').geom.feature('c8').set('selresult', 'on');
model.geom('geom1').feature('wp2').geom.feature('c8').set('r', '0.05');
model.geom('geom1').feature('wp2').geom.feature('c8').set('pos', {'0.19445436' '-0.19445436'});
model.geom('geom1').create('ext1', 'Extrude');
model.geom('geom1').feature('ext1').label('contro_rod_channels');
model.geom('geom1').feature('ext1').setIndex('distance', '5.7285-0.416', 0);
model.geom('geom1').feature('ext1').selection('input').set({'wp2'});
model.geom('geom1').run;
model.geom('geom1').run('fin');

model.variable.create('var1');
model.variable('var1').model('mod1');
model.variable('var1').set('DT', '100[K]', 'core temperature rise');
model.variable('var1').set('mL', 'Qcore*decay/cpL/DT', 'salt mass flowrate');
model.variable('var1').set('g', '9.81[m/s^2]', 'gravitational acceleration');
model.variable('var1').set('SA', '6/d', 'pebble specific surface area');
model.variable('var1').set('v0in', 'mL*rhoL/Ain');
model.variable('var1').set('v0ghost', 'mL*rhoL/Ainghost');
model.variable('var1').set('Acore2', 'pi*2*(2.8656[m]-1.5[m])*0.9[m]', 'inlet cross-sectional area on diverging region inner reflector');
model.variable('var1').set('Acore1', 'pi*2*Hinlet*(0.9[m])', 'inlet cross-sectional area on core plug flow region inner reflector');
model.variable('var1').set('Ain', '2.8743 [m^2]');
model.variable('var1').set('Ainghost', '3.29867 [m^2]');
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
model.variable.create('var2');
model.variable('var2').model('mod1');
model.variable('var2').set('Kbr', 'd^2/1012.5', 'bed permeability, Ergun/Kozeni');
model.variable('var2').set('cF', '0.52', 'Forchheimer drag coefficient, from Ergun correlation (Beaver coefficient)');
model.variable('var2').set('ep', '0.40', 'porosity');
model.variable('var2').set('bF', 'cF*rho_flibe(T_flibe)/(Kbr^0.5)', 'Forcheimer coefficient');
model.variable('var2').set('ec', '1', 'fictional porosity representing channels in the central reflector');
model.variable('var2').set('d', '3[cm]', 'pebble diameter');
model.variable.create('var4');
model.variable('var4').model('mod1');
model.variable('var4').set('rho_fuel', '1810[kg/m^3]', 'sinap ppt(Overview of TMSR-SF1 & SF0)');
model.variable('var4').set('k_fuel', '0[W/m/K]');
model.variable('var4').set('cp_fuel', '1744[J/kg/K]', 'graphite fuel heat capacity');
model.variable('var4').selection.geom('geom1', 3);
model.variable('var4').selection.set([7]);
model.variable.create('var_xs_inlet');
model.variable('var_xs_inlet').model('mod1');
model.variable('var_xs_inlet').set('beta1', '5.38503000e-03');
model.variable('var_xs_inlet').set('betas1', '1.64712000e-04');
model.variable('var_xs_inlet').set('betas2', '9.85399000e-04');
model.variable('var_xs_inlet').set('betas3', '8.56807000e-04');
model.variable('var_xs_inlet').set('betas4', '2.40172000e-03');
model.variable('var_xs_inlet').set('betas5', '7.27014000e-04');
model.variable('var_xs_inlet').set('betas6', '2.49379000e-04');
model.variable('var_xs_inlet').set('chid1', '0.00000000e+00');
model.variable('var_xs_inlet').set('chid2', '0.00000000e+00');
model.variable('var_xs_inlet').set('chid3', '0.00000000e+00');
model.variable('var_xs_inlet').set('chid4', '0.00000000e+00');
model.variable('var_xs_inlet').set('chid5', '0.00000000e+00');
model.variable('var_xs_inlet').set('chid6', '0.00000000e+00');
model.variable('var_xs_inlet').set('chid7', '0.00000000e+00');
model.variable('var_xs_inlet').set('chid8', '0.00000000e+00');
model.variable('var_xs_inlet').set('chip1', '0.00000000e+00');
model.variable('var_xs_inlet').set('chip2', '0.00000000e+00');
model.variable('var_xs_inlet').set('chip3', '0.00000000e+00');
model.variable('var_xs_inlet').set('chip4', '0.00000000e+00');
model.variable('var_xs_inlet').set('chip5', '0.00000000e+00');
model.variable('var_xs_inlet').set('chip6', '0.00000000e+00');
model.variable('var_xs_inlet').set('chip7', '0.00000000e+00');
model.variable('var_xs_inlet').set('chip8', '0.00000000e+00');
model.variable('var_xs_inlet').set('chit1', '0.00000000e+00');
model.variable('var_xs_inlet').set('chit2', '0.00000000e+00');
model.variable('var_xs_inlet').set('chit3', '0.00000000e+00');
model.variable('var_xs_inlet').set('chit4', '0.00000000e+00');
model.variable('var_xs_inlet').set('chit5', '0.00000000e+00');
model.variable('var_xs_inlet').set('chit6', '0.00000000e+00');
model.variable('var_xs_inlet').set('chit7', '0.00000000e+00');
model.variable('var_xs_inlet').set('chit8', '0.00000000e+00');
model.variable('var_xs_inlet').set('diff11', '1.85379000e+00[cm]');
model.variable('var_xs_inlet').set('diff12', '8.71233000e-01[cm]');
model.variable('var_xs_inlet').set('diff13', '6.59364000e-01[cm]');
model.variable('var_xs_inlet').set('diff14', '6.56818000e-01[cm]');
model.variable('var_xs_inlet').set('diff15', '6.53844000e-01[cm]');
model.variable('var_xs_inlet').set('diff16', '6.46231000e-01[cm]');
model.variable('var_xs_inlet').set('diff17', '6.19966000e-01[cm]');
model.variable('var_xs_inlet').set('diff18', '5.53943000e-01[cm]');
model.variable('var_xs_inlet').set('fiss1', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('fiss2', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('fiss3', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('fiss4', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('fiss5', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('fiss6', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('fiss7', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('fiss8', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('invV1', '4.82248000e-10[s/cm]');
model.variable('var_xs_inlet').set('invV2', '1.99013000e-09[s/cm]');
model.variable('var_xs_inlet').set('invV3', '3.36231000e-08[s/cm]');
model.variable('var_xs_inlet').set('invV4', '2.07731000e-07[s/cm]');
model.variable('var_xs_inlet').set('invV5', '7.21934000e-07[s/cm]');
model.variable('var_xs_inlet').set('invV6', '1.37734000e-06[s/cm]');
model.variable('var_xs_inlet').set('invV7', '2.16808000e-06[s/cm]');
model.variable('var_xs_inlet').set('invV8', '4.15949000e-06[s/cm]');
model.variable('var_xs_inlet').set('kappa1', '0.00000000e+00[MeV]');
model.variable('var_xs_inlet').set('kappa2', '0.00000000e+00[MeV]');
model.variable('var_xs_inlet').set('kappa3', '0.00000000e+00[MeV]');
model.variable('var_xs_inlet').set('kappa4', '0.00000000e+00[MeV]');
model.variable('var_xs_inlet').set('kappa5', '0.00000000e+00[MeV]');
model.variable('var_xs_inlet').set('kappa6', '0.00000000e+00[MeV]');
model.variable('var_xs_inlet').set('kappa7', '0.00000000e+00[MeV]');
model.variable('var_xs_inlet').set('kappa8', '0.00000000e+00[MeV]');
model.variable('var_xs_inlet').set('lambdas1', '1.25435000e-02[1/s]');
model.variable('var_xs_inlet').set('lambdas2', '3.13212000e-02[1/s]');
model.variable('var_xs_inlet').set('lambdas3', '1.09688000e-01[1/s]');
model.variable('var_xs_inlet').set('lambdas4', '3.16554000e-01[1/s]');
model.variable('var_xs_inlet').set('lambdas5', '1.29420000e+00[1/s]');
model.variable('var_xs_inlet').set('lambdas6', '8.03336000e+00[1/s]');
model.variable('var_xs_inlet').set('nsf1', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('nsf2', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('nsf3', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('nsf4', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('nsf5', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('nsf6', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('nsf7', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('nsf8', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('diff21', '1.25463081e+00[cm]');
model.variable('var_xs_inlet').set('diff22', '5.85064474e-01[cm]');
model.variable('var_xs_inlet').set('diff23', '4.79925899e-01[cm]');
model.variable('var_xs_inlet').set('diff24', '4.78282519e-01[cm]');
model.variable('var_xs_inlet').set('diff25', '4.77438890e-01[cm]');
model.variable('var_xs_inlet').set('diff26', '4.75198719e-01[cm]');
model.variable('var_xs_inlet').set('diff27', '4.65456531e-01[cm]');
model.variable('var_xs_inlet').set('diff28', '4.39728814e-01[cm]');
model.variable('var_xs_inlet').set('rem1', '4.51098000e-02[1/cm]');
model.variable('var_xs_inlet').set('rem2', '2.23785000e-02[1/cm]');
model.variable('var_xs_inlet').set('rem3', '1.50638000e-02[1/cm]');
model.variable('var_xs_inlet').set('rem4', '3.40876000e-02[1/cm]');
model.variable('var_xs_inlet').set('rem5', '7.95839000e-02[1/cm]');
model.variable('var_xs_inlet').set('rem6', '1.02045000e-01[1/cm]');
model.variable('var_xs_inlet').set('rem7', '8.66221000e-02[1/cm]');
model.variable('var_xs_inlet').set('rem8', '1.06214000e-01[1/cm]');
model.variable('var_xs_inlet').set('scat11', '1.59845000e-01[1/cm]');
model.variable('var_xs_inlet').set('scat12', '4.49962000e-02[1/cm]');
model.variable('var_xs_inlet').set('scat13', '2.13792000e-06[1/cm]');
model.variable('var_xs_inlet').set('scat14', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat15', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat16', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat17', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat18', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat21', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat22', '4.17134000e-01[1/cm]');
model.variable('var_xs_inlet').set('scat23', '2.23783000e-02[1/cm]');
model.variable('var_xs_inlet').set('scat24', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat25', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat26', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat27', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat28', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat31', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat32', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat33', '5.20733000e-01[1/cm]');
model.variable('var_xs_inlet').set('scat34', '1.50606000e-02[1/cm]');
model.variable('var_xs_inlet').set('scat35', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat36', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat37', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat38', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat41', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat42', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat43', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat44', '5.03551000e-01[1/cm]');
model.variable('var_xs_inlet').set('scat45', '3.40673000e-02[1/cm]');
model.variable('var_xs_inlet').set('scat46', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat47', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat48', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat51', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat52', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat53', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat54', '2.81733000e-04[1/cm]');
model.variable('var_xs_inlet').set('scat55', '4.59004000e-01[1/cm]');
model.variable('var_xs_inlet').set('scat56', '7.80185000e-02[1/cm]');
model.variable('var_xs_inlet').set('scat57', '1.21393000e-03[1/cm]');
model.variable('var_xs_inlet').set('scat58', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat61', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat62', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat63', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat64', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat65', '1.32968000e-02[1/cm]');
model.variable('var_xs_inlet').set('scat66', '4.39082000e-01[1/cm]');
model.variable('var_xs_inlet').set('scat67', '8.41623000e-02[1/cm]');
model.variable('var_xs_inlet').set('scat68', '4.45411000e-03[1/cm]');
model.variable('var_xs_inlet').set('scat71', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat72', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat73', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat74', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat75', '1.58462000e-04[1/cm]');
model.variable('var_xs_inlet').set('scat76', '5.85442000e-02[1/cm]');
model.variable('var_xs_inlet').set('scat77', '4.65831000e-01[1/cm]');
model.variable('var_xs_inlet').set('scat78', '2.77121000e-02[1/cm]');
model.variable('var_xs_inlet').set('scat81', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat82', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat83', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat84', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat85', '0.00000000e+00[1/cm]');
model.variable('var_xs_inlet').set('scat86', '1.00144000e-02[1/cm]');
model.variable('var_xs_inlet').set('scat87', '9.58060000e-02[1/cm]');
model.variable('var_xs_inlet').set('scat88', '4.78562000e-01[1/cm]');
model.variable('var_xs_inlet').set('tot1', '2.04955000e-01[1/cm]');
model.variable('var_xs_inlet').set('tot2', '4.39512000e-01[1/cm]');
model.variable('var_xs_inlet').set('tot3', '5.35797000e-01[1/cm]');
model.variable('var_xs_inlet').set('tot4', '5.37638000e-01[1/cm]');
model.variable('var_xs_inlet').set('tot5', '5.38588000e-01[1/cm]');
model.variable('var_xs_inlet').set('tot6', '5.41127000e-01[1/cm]');
model.variable('var_xs_inlet').set('tot7', '5.52453000e-01[1/cm]');
model.variable('var_xs_inlet').set('tot8', '5.84776000e-01[1/cm]');
model.variable('var_xs_inlet').selection.geom('geom1', 3);
model.variable.create('var_xs_outlet_high');
model.variable('var_xs_outlet_high').model('mod1');
model.variable('var_xs_outlet_high').set('beta1', '5.38503000e-03');
model.variable('var_xs_outlet_high').set('betas1', '1.64712000e-04');
model.variable('var_xs_outlet_high').set('betas2', '9.85399000e-04');
model.variable('var_xs_outlet_high').set('betas3', '8.56807000e-04');
model.variable('var_xs_outlet_high').set('betas4', '2.40172000e-03');
model.variable('var_xs_outlet_high').set('betas5', '7.27014000e-04');
model.variable('var_xs_outlet_high').set('betas6', '2.49379000e-04');
model.variable('var_xs_outlet_high').set('chid1', '0.00000000e+00');
model.variable('var_xs_outlet_high').set('chid2', '0.00000000e+00');
model.variable('var_xs_outlet_high').set('chid3', '0.00000000e+00');
model.variable('var_xs_outlet_high').set('chid4', '0.00000000e+00');
model.variable('var_xs_outlet_high').set('chid5', '0.00000000e+00');
model.variable('var_xs_outlet_high').set('chid6', '0.00000000e+00');
model.variable('var_xs_outlet_high').set('chid7', '0.00000000e+00');
model.variable('var_xs_outlet_high').set('chid8', '0.00000000e+00');
model.variable('var_xs_outlet_high').set('chip1', '0.00000000e+00');
model.variable('var_xs_outlet_high').set('chip2', '0.00000000e+00');
model.variable('var_xs_outlet_high').set('chip3', '0.00000000e+00');
model.variable('var_xs_outlet_high').set('chip4', '0.00000000e+00');
model.variable('var_xs_outlet_high').set('chip5', '0.00000000e+00');
model.variable('var_xs_outlet_high').set('chip6', '0.00000000e+00');
model.variable('var_xs_outlet_high').set('chip7', '0.00000000e+00');
model.variable('var_xs_outlet_high').set('chip8', '0.00000000e+00');
model.variable('var_xs_outlet_high').set('chit1', '0.00000000e+00');
model.variable('var_xs_outlet_high').set('chit2', '0.00000000e+00');
model.variable('var_xs_outlet_high').set('chit3', '0.00000000e+00');
model.variable('var_xs_outlet_high').set('chit4', '0.00000000e+00');
model.variable('var_xs_outlet_high').set('chit5', '0.00000000e+00');
model.variable('var_xs_outlet_high').set('chit6', '0.00000000e+00');
model.variable('var_xs_outlet_high').set('chit7', '0.00000000e+00');
model.variable('var_xs_outlet_high').set('chit8', '0.00000000e+00');
model.variable('var_xs_outlet_high').set('diff11', '1.91408000e+00[cm]');
model.variable('var_xs_outlet_high').set('diff12', '8.52247000e-01[cm]');
model.variable('var_xs_outlet_high').set('diff13', '6.58974000e-01[cm]');
model.variable('var_xs_outlet_high').set('diff14', '6.56651000e-01[cm]');
model.variable('var_xs_outlet_high').set('diff15', '6.53107000e-01[cm]');
model.variable('var_xs_outlet_high').set('diff16', '6.46171000e-01[cm]');
model.variable('var_xs_outlet_high').set('diff17', '6.19859000e-01[cm]');
model.variable('var_xs_outlet_high').set('diff18', '5.53895000e-01[cm]');
model.variable('var_xs_outlet_high').set('fiss1', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('fiss2', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('fiss3', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('fiss4', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('fiss5', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('fiss6', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('fiss7', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('fiss8', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('invV1', '4.77903000e-10[s/cm]');
model.variable('var_xs_outlet_high').set('invV2', '2.09359000e-09[s/cm]');
model.variable('var_xs_outlet_high').set('invV3', '3.86037000e-08[s/cm]');
model.variable('var_xs_outlet_high').set('invV4', '2.12906000e-07[s/cm]');
model.variable('var_xs_outlet_high').set('invV5', '8.10944000e-07[s/cm]');
model.variable('var_xs_outlet_high').set('invV6', '1.38405000e-06[s/cm]');
model.variable('var_xs_outlet_high').set('invV7', '2.17033000e-06[s/cm]');
model.variable('var_xs_outlet_high').set('invV8', '4.16019000e-06[s/cm]');
model.variable('var_xs_outlet_high').set('kappa1', '0.00000000e+00[MeV]');
model.variable('var_xs_outlet_high').set('kappa2', '0.00000000e+00[MeV]');
model.variable('var_xs_outlet_high').set('kappa3', '0.00000000e+00[MeV]');
model.variable('var_xs_outlet_high').set('kappa4', '0.00000000e+00[MeV]');
model.variable('var_xs_outlet_high').set('kappa5', '0.00000000e+00[MeV]');
model.variable('var_xs_outlet_high').set('kappa6', '0.00000000e+00[MeV]');
model.variable('var_xs_outlet_high').set('kappa7', '0.00000000e+00[MeV]');
model.variable('var_xs_outlet_high').set('kappa8', '0.00000000e+00[MeV]');
model.variable('var_xs_outlet_high').set('lambdas1', '1.25435000e-02[1/s]');
model.variable('var_xs_outlet_high').set('lambdas2', '3.13212000e-02[1/s]');
model.variable('var_xs_outlet_high').set('lambdas3', '1.09688000e-01[1/s]');
model.variable('var_xs_outlet_high').set('lambdas4', '3.16554000e-01[1/s]');
model.variable('var_xs_outlet_high').set('lambdas5', '1.29420000e+00[1/s]');
model.variable('var_xs_outlet_high').set('lambdas6', '8.03336000e+00[1/s]');
model.variable('var_xs_outlet_high').set('nsf1', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('nsf2', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('nsf3', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('nsf4', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('nsf5', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('nsf6', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('nsf7', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('nsf8', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('diff21', '1.26967198e+00[cm]');
model.variable('var_xs_outlet_high').set('diff22', '5.75353763e-01[cm]');
model.variable('var_xs_outlet_high').set('diff23', '4.79586660e-01[cm]');
model.variable('var_xs_outlet_high').set('diff24', '4.78273624e-01[cm]');
model.variable('var_xs_outlet_high').set('diff25', '4.77207635e-01[cm]');
model.variable('var_xs_outlet_high').set('diff26', '4.75171497e-01[cm]');
model.variable('var_xs_outlet_high').set('diff27', '4.65409355e-01[cm]');
model.variable('var_xs_outlet_high').set('diff28', '4.39711520e-01[cm]');
model.variable('var_xs_outlet_high').set('rem1', '4.57588000e-02[1/cm]');
model.variable('var_xs_outlet_high').set('rem2', '2.63133000e-02[1/cm]');
model.variable('var_xs_outlet_high').set('rem3', '1.99450000e-02[1/cm]');
model.variable('var_xs_outlet_high').set('rem4', '3.80198000e-02[1/cm]');
model.variable('var_xs_outlet_high').set('rem5', '1.25456000e-01[1/cm]');
model.variable('var_xs_outlet_high').set('rem6', '1.02997000e-01[1/cm]');
model.variable('var_xs_outlet_high').set('rem7', '8.64616000e-02[1/cm]');
model.variable('var_xs_outlet_high').set('rem8', '1.06180000e-01[1/cm]');
model.variable('var_xs_outlet_high').set('scat11', '1.56768000e-01[1/cm]');
model.variable('var_xs_outlet_high').set('scat12', '4.56348000e-02[1/cm]');
model.variable('var_xs_outlet_high').set('scat13', '3.66689000e-06[1/cm]');
model.variable('var_xs_outlet_high').set('scat14', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat15', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat16', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat17', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat18', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat21', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat22', '4.20616000e-01[1/cm]');
model.variable('var_xs_outlet_high').set('scat23', '2.63132000e-02[1/cm]');
model.variable('var_xs_outlet_high').set('scat24', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat25', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat26', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat27', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat28', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat31', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat32', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat33', '5.16231000e-01[1/cm]');
model.variable('var_xs_outlet_high').set('scat34', '1.99412000e-02[1/cm]');
model.variable('var_xs_outlet_high').set('scat35', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat36', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat37', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat38', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat41', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat42', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat43', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat44', '4.99628000e-01[1/cm]');
model.variable('var_xs_outlet_high').set('scat45', '3.79994000e-02[1/cm]');
model.variable('var_xs_outlet_high').set('scat46', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat47', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat48', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat51', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat52', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat53', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat54', '1.57482000e-04[1/cm]');
model.variable('var_xs_outlet_high').set('scat55', '4.13393000e-01[1/cm]');
model.variable('var_xs_outlet_high').set('scat56', '1.23270000e-01[1/cm]');
model.variable('var_xs_outlet_high').set('scat57', '1.94981000e-03[1/cm]');
model.variable('var_xs_outlet_high').set('scat58', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat61', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat62', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat63', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat64', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat65', '1.23103000e-02[1/cm]');
model.variable('var_xs_outlet_high').set('scat66', '4.38160000e-01[1/cm]');
model.variable('var_xs_outlet_high').set('scat67', '8.59813000e-02[1/cm]');
model.variable('var_xs_outlet_high').set('scat68', '4.57344000e-03[1/cm]');
model.variable('var_xs_outlet_high').set('scat71', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat72', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat73', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat74', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat75', '1.57137000e-04[1/cm]');
model.variable('var_xs_outlet_high').set('scat76', '5.82717000e-02[1/cm]');
model.variable('var_xs_outlet_high').set('scat77', '4.66047000e-01[1/cm]');
model.variable('var_xs_outlet_high').set('scat78', '2.78258000e-02[1/cm]');
model.variable('var_xs_outlet_high').set('scat81', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat82', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat83', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat84', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat85', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_high').set('scat86', '1.00109000e-02[1/cm]');
model.variable('var_xs_outlet_high').set('scat87', '9.57752000e-02[1/cm]');
model.variable('var_xs_outlet_high').set('scat88', '4.78620000e-01[1/cm]');
model.variable('var_xs_outlet_high').set('tot1', '2.02527000e-01[1/cm]');
model.variable('var_xs_outlet_high').set('tot2', '4.46930000e-01[1/cm]');
model.variable('var_xs_outlet_high').set('tot3', '5.36176000e-01[1/cm]');
model.variable('var_xs_outlet_high').set('tot4', '5.37648000e-01[1/cm]');
model.variable('var_xs_outlet_high').set('tot5', '5.38849000e-01[1/cm]');
model.variable('var_xs_outlet_high').set('tot6', '5.41158000e-01[1/cm]');
model.variable('var_xs_outlet_high').set('tot7', '5.52509000e-01[1/cm]');
model.variable('var_xs_outlet_high').set('tot8', '5.84799000e-01[1/cm]');
model.variable('var_xs_outlet_high').selection.geom('geom1', 3);
model.variable.create('var_xs_outlet_low');
model.variable('var_xs_outlet_low').model('mod1');
model.variable('var_xs_outlet_low').set('beta1', '5.38503000e-03');
model.variable('var_xs_outlet_low').set('betas1', '1.64712000e-04');
model.variable('var_xs_outlet_low').set('betas2', '9.85399000e-04');
model.variable('var_xs_outlet_low').set('betas3', '8.56807000e-04');
model.variable('var_xs_outlet_low').set('betas4', '2.40172000e-03');
model.variable('var_xs_outlet_low').set('betas5', '7.27014000e-04');
model.variable('var_xs_outlet_low').set('betas6', '2.49379000e-04');
model.variable('var_xs_outlet_low').set('chid1', '0.00000000e+00');
model.variable('var_xs_outlet_low').set('chid2', '0.00000000e+00');
model.variable('var_xs_outlet_low').set('chid3', '0.00000000e+00');
model.variable('var_xs_outlet_low').set('chid4', '0.00000000e+00');
model.variable('var_xs_outlet_low').set('chid5', '0.00000000e+00');
model.variable('var_xs_outlet_low').set('chid6', '0.00000000e+00');
model.variable('var_xs_outlet_low').set('chid7', '0.00000000e+00');
model.variable('var_xs_outlet_low').set('chid8', '0.00000000e+00');
model.variable('var_xs_outlet_low').set('chip1', '0.00000000e+00');
model.variable('var_xs_outlet_low').set('chip2', '0.00000000e+00');
model.variable('var_xs_outlet_low').set('chip3', '0.00000000e+00');
model.variable('var_xs_outlet_low').set('chip4', '0.00000000e+00');
model.variable('var_xs_outlet_low').set('chip5', '0.00000000e+00');
model.variable('var_xs_outlet_low').set('chip6', '0.00000000e+00');
model.variable('var_xs_outlet_low').set('chip7', '0.00000000e+00');
model.variable('var_xs_outlet_low').set('chip8', '0.00000000e+00');
model.variable('var_xs_outlet_low').set('chit1', '0.00000000e+00');
model.variable('var_xs_outlet_low').set('chit2', '0.00000000e+00');
model.variable('var_xs_outlet_low').set('chit3', '0.00000000e+00');
model.variable('var_xs_outlet_low').set('chit4', '0.00000000e+00');
model.variable('var_xs_outlet_low').set('chit5', '0.00000000e+00');
model.variable('var_xs_outlet_low').set('chit6', '0.00000000e+00');
model.variable('var_xs_outlet_low').set('chit7', '0.00000000e+00');
model.variable('var_xs_outlet_low').set('chit8', '0.00000000e+00');
model.variable('var_xs_outlet_low').set('diff11', '1.91408000e+00[cm]');
model.variable('var_xs_outlet_low').set('diff12', '8.52247000e-01[cm]');
model.variable('var_xs_outlet_low').set('diff13', '6.58974000e-01[cm]');
model.variable('var_xs_outlet_low').set('diff14', '6.56651000e-01[cm]');
model.variable('var_xs_outlet_low').set('diff15', '6.53107000e-01[cm]');
model.variable('var_xs_outlet_low').set('diff16', '6.46171000e-01[cm]');
model.variable('var_xs_outlet_low').set('diff17', '6.19859000e-01[cm]');
model.variable('var_xs_outlet_low').set('diff18', '5.53895000e-01[cm]');
model.variable('var_xs_outlet_low').set('fiss1', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('fiss2', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('fiss3', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('fiss4', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('fiss5', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('fiss6', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('fiss7', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('fiss8', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('invV1', '4.77903000e-10[s/cm]');
model.variable('var_xs_outlet_low').set('invV2', '2.09359000e-09[s/cm]');
model.variable('var_xs_outlet_low').set('invV3', '3.86037000e-08[s/cm]');
model.variable('var_xs_outlet_low').set('invV4', '2.12906000e-07[s/cm]');
model.variable('var_xs_outlet_low').set('invV5', '8.10944000e-07[s/cm]');
model.variable('var_xs_outlet_low').set('invV6', '1.38405000e-06[s/cm]');
model.variable('var_xs_outlet_low').set('invV7', '2.17033000e-06[s/cm]');
model.variable('var_xs_outlet_low').set('invV8', '4.16019000e-06[s/cm]');
model.variable('var_xs_outlet_low').set('kappa1', '0.00000000e+00[MeV]');
model.variable('var_xs_outlet_low').set('kappa2', '0.00000000e+00[MeV]');
model.variable('var_xs_outlet_low').set('kappa3', '0.00000000e+00[MeV]');
model.variable('var_xs_outlet_low').set('kappa4', '0.00000000e+00[MeV]');
model.variable('var_xs_outlet_low').set('kappa5', '0.00000000e+00[MeV]');
model.variable('var_xs_outlet_low').set('kappa6', '0.00000000e+00[MeV]');
model.variable('var_xs_outlet_low').set('kappa7', '0.00000000e+00[MeV]');
model.variable('var_xs_outlet_low').set('kappa8', '0.00000000e+00[MeV]');
model.variable('var_xs_outlet_low').set('lambdas1', '1.25435000e-02[1/s]');
model.variable('var_xs_outlet_low').set('lambdas2', '3.13212000e-02[1/s]');
model.variable('var_xs_outlet_low').set('lambdas3', '1.09688000e-01[1/s]');
model.variable('var_xs_outlet_low').set('lambdas4', '3.16554000e-01[1/s]');
model.variable('var_xs_outlet_low').set('lambdas5', '1.29420000e+00[1/s]');
model.variable('var_xs_outlet_low').set('lambdas6', '8.03336000e+00[1/s]');
model.variable('var_xs_outlet_low').set('nsf1', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('nsf2', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('nsf3', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('nsf4', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('nsf5', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('nsf6', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('nsf7', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('nsf8', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('diff21', '1.26967198e+00[cm]');
model.variable('var_xs_outlet_low').set('diff22', '5.75353763e-01[cm]');
model.variable('var_xs_outlet_low').set('diff23', '4.79586660e-01[cm]');
model.variable('var_xs_outlet_low').set('diff24', '4.78273624e-01[cm]');
model.variable('var_xs_outlet_low').set('diff25', '4.77207635e-01[cm]');
model.variable('var_xs_outlet_low').set('diff26', '4.75171497e-01[cm]');
model.variable('var_xs_outlet_low').set('diff27', '4.65409355e-01[cm]');
model.variable('var_xs_outlet_low').set('diff28', '4.39711520e-01[cm]');
model.variable('var_xs_outlet_low').set('rem1', '4.57588000e-02[1/cm]');
model.variable('var_xs_outlet_low').set('rem2', '2.63133000e-02[1/cm]');
model.variable('var_xs_outlet_low').set('rem3', '1.99450000e-02[1/cm]');
model.variable('var_xs_outlet_low').set('rem4', '3.80198000e-02[1/cm]');
model.variable('var_xs_outlet_low').set('rem5', '1.25456000e-01[1/cm]');
model.variable('var_xs_outlet_low').set('rem6', '1.02997000e-01[1/cm]');
model.variable('var_xs_outlet_low').set('rem7', '8.64616000e-02[1/cm]');
model.variable('var_xs_outlet_low').set('rem8', '1.06180000e-01[1/cm]');
model.variable('var_xs_outlet_low').set('scat11', '1.56768000e-01[1/cm]');
model.variable('var_xs_outlet_low').set('scat12', '4.56348000e-02[1/cm]');
model.variable('var_xs_outlet_low').set('scat13', '3.66689000e-06[1/cm]');
model.variable('var_xs_outlet_low').set('scat14', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat15', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat16', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat17', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat18', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat21', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat22', '4.20616000e-01[1/cm]');
model.variable('var_xs_outlet_low').set('scat23', '2.63132000e-02[1/cm]');
model.variable('var_xs_outlet_low').set('scat24', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat25', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat26', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat27', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat28', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat31', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat32', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat33', '5.16231000e-01[1/cm]');
model.variable('var_xs_outlet_low').set('scat34', '1.99412000e-02[1/cm]');
model.variable('var_xs_outlet_low').set('scat35', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat36', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat37', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat38', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat41', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat42', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat43', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat44', '4.99628000e-01[1/cm]');
model.variable('var_xs_outlet_low').set('scat45', '3.79994000e-02[1/cm]');
model.variable('var_xs_outlet_low').set('scat46', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat47', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat48', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat51', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat52', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat53', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat54', '1.57482000e-04[1/cm]');
model.variable('var_xs_outlet_low').set('scat55', '4.13393000e-01[1/cm]');
model.variable('var_xs_outlet_low').set('scat56', '1.23270000e-01[1/cm]');
model.variable('var_xs_outlet_low').set('scat57', '1.94981000e-03[1/cm]');
model.variable('var_xs_outlet_low').set('scat58', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat61', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat62', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat63', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat64', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat65', '1.23103000e-02[1/cm]');
model.variable('var_xs_outlet_low').set('scat66', '4.38160000e-01[1/cm]');
model.variable('var_xs_outlet_low').set('scat67', '8.59813000e-02[1/cm]');
model.variable('var_xs_outlet_low').set('scat68', '4.57344000e-03[1/cm]');
model.variable('var_xs_outlet_low').set('scat71', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat72', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat73', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat74', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat75', '1.57137000e-04[1/cm]');
model.variable('var_xs_outlet_low').set('scat76', '5.82717000e-02[1/cm]');
model.variable('var_xs_outlet_low').set('scat77', '4.66047000e-01[1/cm]');
model.variable('var_xs_outlet_low').set('scat78', '2.78258000e-02[1/cm]');
model.variable('var_xs_outlet_low').set('scat81', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat82', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat83', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat84', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat85', '0.00000000e+00[1/cm]');
model.variable('var_xs_outlet_low').set('scat86', '1.00109000e-02[1/cm]');
model.variable('var_xs_outlet_low').set('scat87', '9.57752000e-02[1/cm]');
model.variable('var_xs_outlet_low').set('scat88', '4.78620000e-01[1/cm]');
model.variable('var_xs_outlet_low').set('tot1', '2.02527000e-01[1/cm]');
model.variable('var_xs_outlet_low').set('tot2', '4.46930000e-01[1/cm]');
model.variable('var_xs_outlet_low').set('tot3', '5.36176000e-01[1/cm]');
model.variable('var_xs_outlet_low').set('tot4', '5.37648000e-01[1/cm]');
model.variable('var_xs_outlet_low').set('tot5', '5.38849000e-01[1/cm]');
model.variable('var_xs_outlet_low').set('tot6', '5.41158000e-01[1/cm]');
model.variable('var_xs_outlet_low').set('tot7', '5.52509000e-01[1/cm]');
model.variable('var_xs_outlet_low').set('tot8', '5.84799000e-01[1/cm]');
model.variable('var_xs_outlet_low').selection.geom('geom1', 3);
model.variable.create('var_xs_CR');
model.variable('var_xs_CR').model('mod1');
model.variable('var_xs_CR').set('beta1', '5.38503000e-03');
model.variable('var_xs_CR').set('betas1', '1.64712000e-04');
model.variable('var_xs_CR').set('betas2', '9.85399000e-04');
model.variable('var_xs_CR').set('betas3', '8.56807000e-04');
model.variable('var_xs_CR').set('betas4', '2.40172000e-03');
model.variable('var_xs_CR').set('betas5', '7.27014000e-04');
model.variable('var_xs_CR').set('betas6', '2.49379000e-04');
model.variable('var_xs_CR').set('chid1', '0.00000000e+00');
model.variable('var_xs_CR').set('chid2', '0.00000000e+00');
model.variable('var_xs_CR').set('chid3', '0.00000000e+00');
model.variable('var_xs_CR').set('chid4', '0.00000000e+00');
model.variable('var_xs_CR').set('chid5', '0.00000000e+00');
model.variable('var_xs_CR').set('chid6', '0.00000000e+00');
model.variable('var_xs_CR').set('chid7', '0.00000000e+00');
model.variable('var_xs_CR').set('chid8', '0.00000000e+00');
model.variable('var_xs_CR').set('chip1', '0.00000000e+00');
model.variable('var_xs_CR').set('chip2', '0.00000000e+00');
model.variable('var_xs_CR').set('chip3', '0.00000000e+00');
model.variable('var_xs_CR').set('chip4', '0.00000000e+00');
model.variable('var_xs_CR').set('chip5', '0.00000000e+00');
model.variable('var_xs_CR').set('chip6', '0.00000000e+00');
model.variable('var_xs_CR').set('chip7', '0.00000000e+00');
model.variable('var_xs_CR').set('chip8', '0.00000000e+00');
model.variable('var_xs_CR').set('chit1', '0.00000000e+00');
model.variable('var_xs_CR').set('chit2', '0.00000000e+00');
model.variable('var_xs_CR').set('chit3', '0.00000000e+00');
model.variable('var_xs_CR').set('chit4', '0.00000000e+00');
model.variable('var_xs_CR').set('chit5', '0.00000000e+00');
model.variable('var_xs_CR').set('chit6', '0.00000000e+00');
model.variable('var_xs_CR').set('chit7', '0.00000000e+00');
model.variable('var_xs_CR').set('chit8', '0.00000000e+00');
model.variable('var_xs_CR').set('diff11', '1.85379000e+00[cm]');
model.variable('var_xs_CR').set('diff12', '8.71233000e-01[cm]');
model.variable('var_xs_CR').set('diff13', '6.59364000e-01[cm]');
model.variable('var_xs_CR').set('diff14', '6.56818000e-01[cm]');
model.variable('var_xs_CR').set('diff15', '6.53844000e-01[cm]');
model.variable('var_xs_CR').set('diff16', '6.46231000e-01[cm]');
model.variable('var_xs_CR').set('diff17', '6.19966000e-01[cm]');
model.variable('var_xs_CR').set('diff18', '5.53943000e-01[cm]');
model.variable('var_xs_CR').set('fiss1', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('fiss2', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('fiss3', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('fiss4', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('fiss5', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('fiss6', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('fiss7', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('fiss8', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('invV1', '4.82248000e-10[s/cm]');
model.variable('var_xs_CR').set('invV2', '1.99013000e-09[s/cm]');
model.variable('var_xs_CR').set('invV3', '3.36231000e-08[s/cm]');
model.variable('var_xs_CR').set('invV4', '2.07731000e-07[s/cm]');
model.variable('var_xs_CR').set('invV5', '7.21934000e-07[s/cm]');
model.variable('var_xs_CR').set('invV6', '1.37734000e-06[s/cm]');
model.variable('var_xs_CR').set('invV7', '2.16808000e-06[s/cm]');
model.variable('var_xs_CR').set('invV8', '4.15949000e-06[s/cm]');
model.variable('var_xs_CR').set('kappa1', '0.00000000e+00[MeV]');
model.variable('var_xs_CR').set('kappa2', '0.00000000e+00[MeV]');
model.variable('var_xs_CR').set('kappa3', '0.00000000e+00[MeV]');
model.variable('var_xs_CR').set('kappa4', '0.00000000e+00[MeV]');
model.variable('var_xs_CR').set('kappa5', '0.00000000e+00[MeV]');
model.variable('var_xs_CR').set('kappa6', '0.00000000e+00[MeV]');
model.variable('var_xs_CR').set('kappa7', '0.00000000e+00[MeV]');
model.variable('var_xs_CR').set('kappa8', '0.00000000e+00[MeV]');
model.variable('var_xs_CR').set('lambdas1', '1.25435000e-02[1/s]');
model.variable('var_xs_CR').set('lambdas2', '3.13212000e-02[1/s]');
model.variable('var_xs_CR').set('lambdas3', '1.09688000e-01[1/s]');
model.variable('var_xs_CR').set('lambdas4', '3.16554000e-01[1/s]');
model.variable('var_xs_CR').set('lambdas5', '1.29420000e+00[1/s]');
model.variable('var_xs_CR').set('lambdas6', '8.03336000e+00[1/s]');
model.variable('var_xs_CR').set('nsf1', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('nsf2', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('nsf3', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('nsf4', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('nsf5', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('nsf6', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('nsf7', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('nsf8', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('diff21', '1.25463081e+00[cm]');
model.variable('var_xs_CR').set('diff22', '5.85064474e-01[cm]');
model.variable('var_xs_CR').set('diff23', '4.79925899e-01[cm]');
model.variable('var_xs_CR').set('diff24', '4.78282519e-01[cm]');
model.variable('var_xs_CR').set('diff25', '4.77438890e-01[cm]');
model.variable('var_xs_CR').set('diff26', '4.75198719e-01[cm]');
model.variable('var_xs_CR').set('diff27', '4.65456531e-01[cm]');
model.variable('var_xs_CR').set('diff28', '4.39728814e-01[cm]');
model.variable('var_xs_CR').set('rem1', '4.51098000e-02[1/cm]');
model.variable('var_xs_CR').set('rem2', '2.23785000e-02[1/cm]');
model.variable('var_xs_CR').set('rem3', '1.50638000e-02[1/cm]');
model.variable('var_xs_CR').set('rem4', '3.40876000e-02[1/cm]');
model.variable('var_xs_CR').set('rem5', '7.95839000e-02[1/cm]');
model.variable('var_xs_CR').set('rem6', '1.02045000e-01[1/cm]');
model.variable('var_xs_CR').set('rem7', '8.66221000e-02[1/cm]');
model.variable('var_xs_CR').set('rem8', '1.06214000e-01[1/cm]');
model.variable('var_xs_CR').set('scat11', '1.59845000e-01[1/cm]');
model.variable('var_xs_CR').set('scat12', '4.49962000e-02[1/cm]');
model.variable('var_xs_CR').set('scat13', '2.13792000e-06[1/cm]');
model.variable('var_xs_CR').set('scat14', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat15', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat16', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat17', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat18', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat21', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat22', '4.17134000e-01[1/cm]');
model.variable('var_xs_CR').set('scat23', '2.23783000e-02[1/cm]');
model.variable('var_xs_CR').set('scat24', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat25', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat26', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat27', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat28', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat31', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat32', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat33', '5.20733000e-01[1/cm]');
model.variable('var_xs_CR').set('scat34', '1.50606000e-02[1/cm]');
model.variable('var_xs_CR').set('scat35', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat36', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat37', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat38', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat41', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat42', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat43', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat44', '5.03551000e-01[1/cm]');
model.variable('var_xs_CR').set('scat45', '3.40673000e-02[1/cm]');
model.variable('var_xs_CR').set('scat46', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat47', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat48', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat51', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat52', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat53', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat54', '2.81733000e-04[1/cm]');
model.variable('var_xs_CR').set('scat55', '4.59004000e-01[1/cm]');
model.variable('var_xs_CR').set('scat56', '7.80185000e-02[1/cm]');
model.variable('var_xs_CR').set('scat57', '1.21393000e-03[1/cm]');
model.variable('var_xs_CR').set('scat58', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat61', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat62', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat63', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat64', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat65', '1.32968000e-02[1/cm]');
model.variable('var_xs_CR').set('scat66', '4.39082000e-01[1/cm]');
model.variable('var_xs_CR').set('scat67', '8.41623000e-02[1/cm]');
model.variable('var_xs_CR').set('scat68', '4.45411000e-03[1/cm]');
model.variable('var_xs_CR').set('scat71', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat72', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat73', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat74', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat75', '1.58462000e-04[1/cm]');
model.variable('var_xs_CR').set('scat76', '5.85442000e-02[1/cm]');
model.variable('var_xs_CR').set('scat77', '4.65831000e-01[1/cm]');
model.variable('var_xs_CR').set('scat78', '2.77121000e-02[1/cm]');
model.variable('var_xs_CR').set('scat81', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat82', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat83', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat84', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat85', '0.00000000e+00[1/cm]');
model.variable('var_xs_CR').set('scat86', '1.00144000e-02[1/cm]');
model.variable('var_xs_CR').set('scat87', '9.58060000e-02[1/cm]');
model.variable('var_xs_CR').set('scat88', '4.78562000e-01[1/cm]');
model.variable('var_xs_CR').set('tot1', '2.04955000e-01[1/cm]');
model.variable('var_xs_CR').set('tot2', '4.39512000e-01[1/cm]');
model.variable('var_xs_CR').set('tot3', '5.35797000e-01[1/cm]');
model.variable('var_xs_CR').set('tot4', '5.37638000e-01[1/cm]');
model.variable('var_xs_CR').set('tot5', '5.38588000e-01[1/cm]');
model.variable('var_xs_CR').set('tot6', '5.41127000e-01[1/cm]');
model.variable('var_xs_CR').set('tot7', '5.52453000e-01[1/cm]');
model.variable('var_xs_CR').set('tot8', '5.84776000e-01[1/cm]');
model.variable('var_xs_CR').selection.geom('geom1', 3);
model.variable('var_xs_CR').selection.set([8]);
model.variable.create('var_xs_Blanket');
model.variable('var_xs_Blanket').model('mod1');
model.variable('var_xs_Blanket').set('beta1', '5.38503000e-03');
model.variable('var_xs_Blanket').set('betas1', '1.64712000e-04');
model.variable('var_xs_Blanket').set('betas2', '9.85399000e-04');
model.variable('var_xs_Blanket').set('betas3', '8.56807000e-04');
model.variable('var_xs_Blanket').set('betas4', '2.40172000e-03');
model.variable('var_xs_Blanket').set('betas5', '7.27014000e-04');
model.variable('var_xs_Blanket').set('betas6', '2.49379000e-04');
model.variable('var_xs_Blanket').set('chid1', '0.00000000e+00');
model.variable('var_xs_Blanket').set('chid2', '0.00000000e+00');
model.variable('var_xs_Blanket').set('chid3', '0.00000000e+00');
model.variable('var_xs_Blanket').set('chid4', '0.00000000e+00');
model.variable('var_xs_Blanket').set('chid5', '0.00000000e+00');
model.variable('var_xs_Blanket').set('chid6', '0.00000000e+00');
model.variable('var_xs_Blanket').set('chid7', '0.00000000e+00');
model.variable('var_xs_Blanket').set('chid8', '0.00000000e+00');
model.variable('var_xs_Blanket').set('chip1', '0.00000000e+00');
model.variable('var_xs_Blanket').set('chip2', '0.00000000e+00');
model.variable('var_xs_Blanket').set('chip3', '0.00000000e+00');
model.variable('var_xs_Blanket').set('chip4', '0.00000000e+00');
model.variable('var_xs_Blanket').set('chip5', '0.00000000e+00');
model.variable('var_xs_Blanket').set('chip6', '0.00000000e+00');
model.variable('var_xs_Blanket').set('chip7', '0.00000000e+00');
model.variable('var_xs_Blanket').set('chip8', '0.00000000e+00');
model.variable('var_xs_Blanket').set('chit1', '0.00000000e+00');
model.variable('var_xs_Blanket').set('chit2', '0.00000000e+00');
model.variable('var_xs_Blanket').set('chit3', '0.00000000e+00');
model.variable('var_xs_Blanket').set('chit4', '0.00000000e+00');
model.variable('var_xs_Blanket').set('chit5', '0.00000000e+00');
model.variable('var_xs_Blanket').set('chit6', '0.00000000e+00');
model.variable('var_xs_Blanket').set('chit7', '0.00000000e+00');
model.variable('var_xs_Blanket').set('chit8', '0.00000000e+00');
model.variable('var_xs_Blanket').set('diff11', '1.95680000e+00[cm]');
model.variable('var_xs_Blanket').set('diff12', '9.24823000e-01[cm]');
model.variable('var_xs_Blanket').set('diff13', '8.19871000e-01[cm]');
model.variable('var_xs_Blanket').set('diff14', '8.19441000e-01[cm]');
model.variable('var_xs_Blanket').set('diff15', '8.16485000e-01[cm]');
model.variable('var_xs_Blanket').set('diff16', '8.07291000e-01[cm]');
model.variable('var_xs_Blanket').set('diff17', '7.78831000e-01[cm]');
model.variable('var_xs_Blanket').set('diff18', '6.99971000e-01[cm]');
model.variable('var_xs_Blanket').set('fiss1', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('fiss2', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('fiss3', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('fiss4', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('fiss5', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('fiss6', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('fiss7', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('fiss8', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('invV1', '4.83120000e-10[s/cm]');
model.variable('var_xs_Blanket').set('invV2', '2.05752000e-09[s/cm]');
model.variable('var_xs_Blanket').set('invV3', '3.30619000e-08[s/cm]');
model.variable('var_xs_Blanket').set('invV4', '2.06919000e-07[s/cm]');
model.variable('var_xs_Blanket').set('invV5', '6.95827000e-07[s/cm]');
model.variable('var_xs_Blanket').set('invV6', '1.37324000e-06[s/cm]');
model.variable('var_xs_Blanket').set('invV7', '2.16793000e-06[s/cm]');
model.variable('var_xs_Blanket').set('invV8', '4.17694000e-06[s/cm]');
model.variable('var_xs_Blanket').set('kappa1', '0.00000000e+00[MeV]');
model.variable('var_xs_Blanket').set('kappa2', '0.00000000e+00[MeV]');
model.variable('var_xs_Blanket').set('kappa3', '0.00000000e+00[MeV]');
model.variable('var_xs_Blanket').set('kappa4', '0.00000000e+00[MeV]');
model.variable('var_xs_Blanket').set('kappa5', '0.00000000e+00[MeV]');
model.variable('var_xs_Blanket').set('kappa6', '0.00000000e+00[MeV]');
model.variable('var_xs_Blanket').set('kappa7', '0.00000000e+00[MeV]');
model.variable('var_xs_Blanket').set('kappa8', '0.00000000e+00[MeV]');
model.variable('var_xs_Blanket').set('lambdas1', '1.25435000e-02[1/s]');
model.variable('var_xs_Blanket').set('lambdas2', '3.13212000e-02[1/s]');
model.variable('var_xs_Blanket').set('lambdas3', '1.09688000e-01[1/s]');
model.variable('var_xs_Blanket').set('lambdas4', '3.16554000e-01[1/s]');
model.variable('var_xs_Blanket').set('lambdas5', '1.29420000e+00[1/s]');
model.variable('var_xs_Blanket').set('lambdas6', '8.03336000e+00[1/s]');
model.variable('var_xs_Blanket').set('nsf1', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('nsf2', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('nsf3', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('nsf4', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('nsf5', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('nsf6', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('nsf7', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('nsf8', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('diff21', '1.26151217e+00[cm]');
model.variable('var_xs_Blanket').set('diff22', '6.25578660e-01[cm]');
model.variable('var_xs_Blanket').set('diff23', '5.97517514e-01[cm]');
model.variable('var_xs_Blanket').set('diff24', '5.97491135e-01[cm]');
model.variable('var_xs_Blanket').set('diff25', '5.96462777e-01[cm]');
model.variable('var_xs_Blanket').set('diff26', '5.93014292e-01[cm]');
model.variable('var_xs_Blanket').set('diff27', '5.81363426e-01[cm]');
model.variable('var_xs_Blanket').set('diff28', '5.45885961e-01[cm]');
model.variable('var_xs_Blanket').set('rem1', '4.86907000e-02[1/cm]');
model.variable('var_xs_Blanket').set('rem2', '2.09077000e-02[1/cm]');
model.variable('var_xs_Blanket').set('rem3', '1.14461000e-02[1/cm]');
model.variable('var_xs_Blanket').set('rem4', '2.62337000e-02[1/cm]');
model.variable('var_xs_Blanket').set('rem5', '5.35459000e-02[1/cm]');
model.variable('var_xs_Blanket').set('rem6', '8.56291000e-02[1/cm]');
model.variable('var_xs_Blanket').set('rem7', '7.84862000e-02[1/cm]');
model.variable('var_xs_Blanket').set('rem8', '1.04706000e-01[1/cm]');
model.variable('var_xs_Blanket').set('scat11', '1.55146000e-01[1/cm]');
model.variable('var_xs_Blanket').set('scat12', '4.79885000e-02[1/cm]');
model.variable('var_xs_Blanket').set('scat13', '1.83551000e-05[1/cm]');
model.variable('var_xs_Blanket').set('scat14', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat15', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat16', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat17', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat18', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat21', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat22', '3.90140000e-01[1/cm]');
model.variable('var_xs_Blanket').set('scat23', '2.08762000e-02[1/cm]');
model.variable('var_xs_Blanket').set('scat24', '1.53926000e-08[1/cm]');
model.variable('var_xs_Blanket').set('scat25', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat26', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat27', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat28', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat31', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat32', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat33', '4.18905000e-01[1/cm]');
model.variable('var_xs_Blanket').set('scat34', '1.14377000e-02[1/cm]');
model.variable('var_xs_Blanket').set('scat35', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat36', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat37', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat38', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat41', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat42', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat43', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat44', '4.04137000e-01[1/cm]');
model.variable('var_xs_Blanket').set('scat45', '2.61864000e-02[1/cm]');
model.variable('var_xs_Blanket').set('scat46', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat47', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat48', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat51', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat52', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat53', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat54', '2.63871000e-04[1/cm]');
model.variable('var_xs_Blanket').set('scat55', '3.77567000e-01[1/cm]');
model.variable('var_xs_Blanket').set('scat56', '5.23953000e-02[1/cm]');
model.variable('var_xs_Blanket').set('scat57', '7.28807000e-04[1/cm]');
model.variable('var_xs_Blanket').set('scat58', '8.73713000e-07[1/cm]');
model.variable('var_xs_Blanket').set('scat61', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat62', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat63', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat64', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat65', '1.11589000e-02[1/cm]');
model.variable('var_xs_Blanket').set('scat66', '3.47990000e-01[1/cm]');
model.variable('var_xs_Blanket').set('scat67', '7.11408000e-02[1/cm]');
model.variable('var_xs_Blanket').set('scat68', '3.01993000e-03[1/cm]');
model.variable('var_xs_Blanket').set('scat71', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat72', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat73', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat74', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat75', '1.09476000e-04[1/cm]');
model.variable('var_xs_Blanket').set('scat76', '4.95244000e-02[1/cm]');
model.variable('var_xs_Blanket').set('scat77', '3.63824000e-01[1/cm]');
model.variable('var_xs_Blanket').set('scat78', '2.83642000e-02[1/cm]');
model.variable('var_xs_Blanket').set('scat81', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat82', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat83', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat84', '0.00000000e+00[1/cm]');
model.variable('var_xs_Blanket').set('scat85', '3.55394000e-07[1/cm]');
model.variable('var_xs_Blanket').set('scat86', '6.83924000e-03[1/cm]');
model.variable('var_xs_Blanket').set('scat87', '9.69274000e-02[1/cm]');
model.variable('var_xs_Blanket').set('scat88', '3.66350000e-01[1/cm]');
model.variable('var_xs_Blanket').set('tot1', '2.03837000e-01[1/cm]');
model.variable('var_xs_Blanket').set('tot2', '4.11048000e-01[1/cm]');
model.variable('var_xs_Blanket').set('tot3', '4.30352000e-01[1/cm]');
model.variable('var_xs_Blanket').set('tot4', '4.30371000e-01[1/cm]');
model.variable('var_xs_Blanket').set('tot5', '4.31113000e-01[1/cm]');
model.variable('var_xs_Blanket').set('tot6', '4.33620000e-01[1/cm]');
model.variable('var_xs_Blanket').set('tot7', '4.42310000e-01[1/cm]');
model.variable('var_xs_Blanket').set('tot8', '4.71056000e-01[1/cm]');
model.variable('var_xs_Blanket').selection.geom('geom1', 3);
model.variable('var_xs_Blanket').selection.set([6]);
model.variable.create('var_xs_ORCC');
model.variable('var_xs_ORCC').model('mod1');
model.variable('var_xs_ORCC').set('beta1', '5.38503000e-03');
model.variable('var_xs_ORCC').set('betas1', '1.64712000e-04');
model.variable('var_xs_ORCC').set('betas2', '9.85399000e-04');
model.variable('var_xs_ORCC').set('betas3', '8.56807000e-04');
model.variable('var_xs_ORCC').set('betas4', '2.40172000e-03');
model.variable('var_xs_ORCC').set('betas5', '7.27014000e-04');
model.variable('var_xs_ORCC').set('betas6', '2.49379000e-04');
model.variable('var_xs_ORCC').set('chid1', '0.00000000e+00');
model.variable('var_xs_ORCC').set('chid2', '0.00000000e+00');
model.variable('var_xs_ORCC').set('chid3', '0.00000000e+00');
model.variable('var_xs_ORCC').set('chid4', '0.00000000e+00');
model.variable('var_xs_ORCC').set('chid5', '0.00000000e+00');
model.variable('var_xs_ORCC').set('chid6', '0.00000000e+00');
model.variable('var_xs_ORCC').set('chid7', '0.00000000e+00');
model.variable('var_xs_ORCC').set('chid8', '0.00000000e+00');
model.variable('var_xs_ORCC').set('chip1', '0.00000000e+00');
model.variable('var_xs_ORCC').set('chip2', '0.00000000e+00');
model.variable('var_xs_ORCC').set('chip3', '0.00000000e+00');
model.variable('var_xs_ORCC').set('chip4', '0.00000000e+00');
model.variable('var_xs_ORCC').set('chip5', '0.00000000e+00');
model.variable('var_xs_ORCC').set('chip6', '0.00000000e+00');
model.variable('var_xs_ORCC').set('chip7', '0.00000000e+00');
model.variable('var_xs_ORCC').set('chip8', '0.00000000e+00');
model.variable('var_xs_ORCC').set('chit1', '0.00000000e+00');
model.variable('var_xs_ORCC').set('chit2', '0.00000000e+00');
model.variable('var_xs_ORCC').set('chit3', '0.00000000e+00');
model.variable('var_xs_ORCC').set('chit4', '0.00000000e+00');
model.variable('var_xs_ORCC').set('chit5', '0.00000000e+00');
model.variable('var_xs_ORCC').set('chit6', '0.00000000e+00');
model.variable('var_xs_ORCC').set('chit7', '0.00000000e+00');
model.variable('var_xs_ORCC').set('chit8', '0.00000000e+00');
model.variable('var_xs_ORCC').set('diff11', '2.02458000e+00[cm]');
model.variable('var_xs_ORCC').set('diff12', '9.95229000e-01[cm]');
model.variable('var_xs_ORCC').set('diff13', '1.17329000e+00[cm]');
model.variable('var_xs_ORCC').set('diff14', '1.18700000e+00[cm]');
model.variable('var_xs_ORCC').set('diff15', '1.18469000e+00[cm]');
model.variable('var_xs_ORCC').set('diff16', '1.17367000e+00[cm]');
model.variable('var_xs_ORCC').set('diff17', '1.14966000e+00[cm]');
model.variable('var_xs_ORCC').set('diff18', '1.05104000e+00[cm]');
model.variable('var_xs_ORCC').set('fiss1', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('fiss2', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('fiss3', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('fiss4', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('fiss5', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('fiss6', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('fiss7', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('fiss8', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('invV1', '4.80958000e-10[s/cm]');
model.variable('var_xs_ORCC').set('invV2', '2.30945000e-09[s/cm]');
model.variable('var_xs_ORCC').set('invV3', '3.71844000e-08[s/cm]');
model.variable('var_xs_ORCC').set('invV4', '2.11124000e-07[s/cm]');
model.variable('var_xs_ORCC').set('invV5', '7.39574000e-07[s/cm]');
model.variable('var_xs_ORCC').set('invV6', '1.37911000e-06[s/cm]');
model.variable('var_xs_ORCC').set('invV7', '2.16867000e-06[s/cm]');
model.variable('var_xs_ORCC').set('invV8', '4.18936000e-06[s/cm]');
model.variable('var_xs_ORCC').set('kappa1', '0.00000000e+00[MeV]');
model.variable('var_xs_ORCC').set('kappa2', '0.00000000e+00[MeV]');
model.variable('var_xs_ORCC').set('kappa3', '0.00000000e+00[MeV]');
model.variable('var_xs_ORCC').set('kappa4', '0.00000000e+00[MeV]');
model.variable('var_xs_ORCC').set('kappa5', '0.00000000e+00[MeV]');
model.variable('var_xs_ORCC').set('kappa6', '0.00000000e+00[MeV]');
model.variable('var_xs_ORCC').set('kappa7', '0.00000000e+00[MeV]');
model.variable('var_xs_ORCC').set('kappa8', '0.00000000e+00[MeV]');
model.variable('var_xs_ORCC').set('lambdas1', '1.25435000e-02[1/s]');
model.variable('var_xs_ORCC').set('lambdas2', '3.13212000e-02[1/s]');
model.variable('var_xs_ORCC').set('lambdas3', '1.09688000e-01[1/s]');
model.variable('var_xs_ORCC').set('lambdas4', '3.16554000e-01[1/s]');
model.variable('var_xs_ORCC').set('lambdas5', '1.29420000e+00[1/s]');
model.variable('var_xs_ORCC').set('lambdas6', '8.03336000e+00[1/s]');
model.variable('var_xs_ORCC').set('nsf1', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('nsf2', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('nsf3', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('nsf4', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('nsf5', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('nsf6', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('nsf7', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('nsf8', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('diff21', '1.18824273e+00[cm]');
model.variable('var_xs_ORCC').set('diff22', '6.88984666e-01[cm]');
model.variable('var_xs_ORCC').set('diff23', '8.58192713e-01[cm]');
model.variable('var_xs_ORCC').set('diff24', '8.68640765e-01[cm]');
model.variable('var_xs_ORCC').set('diff25', '8.67307703e-01[cm]');
model.variable('var_xs_ORCC').set('diff26', '8.59802513e-01[cm]');
model.variable('var_xs_ORCC').set('diff27', '8.43619634e-01[cm]');
model.variable('var_xs_ORCC').set('diff28', '7.73278253e-01[cm]');
model.variable('var_xs_ORCC').set('rem1', '5.94067000e-02[1/cm]');
model.variable('var_xs_ORCC').set('rem2', '2.09750000e-02[1/cm]');
model.variable('var_xs_ORCC').set('rem3', '9.46498000e-03[1/cm]');
model.variable('var_xs_ORCC').set('rem4', '1.84947000e-02[1/cm]');
model.variable('var_xs_ORCC').set('rem5', '5.00095000e-02[1/cm]');
model.variable('var_xs_ORCC').set('rem6', '6.89700000e-02[1/cm]');
model.variable('var_xs_ORCC').set('rem7', '7.43990000e-02[1/cm]');
model.variable('var_xs_ORCC').set('rem8', '1.15508000e-01[1/cm]');
model.variable('var_xs_ORCC').set('scat11', '1.56999000e-01[1/cm]');
model.variable('var_xs_ORCC').set('scat12', '5.75474000e-02[1/cm]');
model.variable('var_xs_ORCC').set('scat13', '4.71965000e-05[1/cm]');
model.variable('var_xs_ORCC').set('scat14', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat15', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat16', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat17', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat18', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat21', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat22', '3.52245000e-01[1/cm]');
model.variable('var_xs_ORCC').set('scat23', '2.08999000e-02[1/cm]');
model.variable('var_xs_ORCC').set('scat24', '4.93147000e-08[1/cm]');
model.variable('var_xs_ORCC').set('scat25', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat26', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat27', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat28', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat31', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat32', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat33', '2.90168000e-01[1/cm]');
model.variable('var_xs_ORCC').set('scat34', '9.44562000e-03[1/cm]');
model.variable('var_xs_ORCC').set('scat35', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat36', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat37', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat38', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat41', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat42', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat43', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat44', '2.77534000e-01[1/cm]');
model.variable('var_xs_ORCC').set('scat45', '1.83979000e-02[1/cm]');
model.variable('var_xs_ORCC').set('scat46', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat47', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat48', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat51', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat52', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat53', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat54', '1.67060000e-04[1/cm]');
model.variable('var_xs_ORCC').set('scat55', '2.46475000e-01[1/cm]');
model.variable('var_xs_ORCC').set('scat56', '4.89727000e-02[1/cm]');
model.variable('var_xs_ORCC').set('scat57', '5.31137000e-04[1/cm]');
model.variable('var_xs_ORCC').set('scat58', '4.32470000e-06[1/cm]');
model.variable('var_xs_ORCC').set('scat61', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat62', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat63', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat64', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat65', '7.65262000e-03[1/cm]');
model.variable('var_xs_ORCC').set('scat66', '2.30102000e-01[1/cm]');
model.variable('var_xs_ORCC').set('scat67', '5.95013000e-02[1/cm]');
model.variable('var_xs_ORCC').set('scat68', '1.19096000e-03[1/cm]');
model.variable('var_xs_ORCC').set('scat71', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat72', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat73', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat74', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat75', '5.23184000e-05[1/cm]');
model.variable('var_xs_ORCC').set('scat76', '4.12274000e-02[1/cm]');
model.variable('var_xs_ORCC').set('scat77', '2.30410000e-01[1/cm]');
model.variable('var_xs_ORCC').set('scat78', '3.21352000e-02[1/cm]');
model.variable('var_xs_ORCC').set('scat81', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat82', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat83', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat84', '0.00000000e+00[1/cm]');
model.variable('var_xs_ORCC').set('scat85', '1.71670000e-06[1/cm]');
model.variable('var_xs_ORCC').set('scat86', '2.79580000e-03[1/cm]');
model.variable('var_xs_ORCC').set('scat87', '1.10797000e-01[1/cm]');
model.variable('var_xs_ORCC').set('scat88', '2.17028000e-01[1/cm]');
model.variable('var_xs_ORCC').set('tot1', '2.16406000e-01[1/cm]');
model.variable('var_xs_ORCC').set('tot2', '3.73220000e-01[1/cm]');
model.variable('var_xs_ORCC').set('tot3', '2.99633000e-01[1/cm]');
model.variable('var_xs_ORCC').set('tot4', '2.96029000e-01[1/cm]');
model.variable('var_xs_ORCC').set('tot5', '2.96484000e-01[1/cm]');
model.variable('var_xs_ORCC').set('tot6', '2.99072000e-01[1/cm]');
model.variable('var_xs_ORCC').set('tot7', '3.04809000e-01[1/cm]');
model.variable('var_xs_ORCC').set('tot8', '3.32536000e-01[1/cm]');
model.variable('var_xs_ORCC').selection.geom('geom1', 3);
model.variable('var_xs_ORCC').selection.set([5]);
model.variable.create('var_xs_OR');
model.variable('var_xs_OR').model('mod1');
model.variable('var_xs_OR').set('beta1', '5.38503000e-03');
model.variable('var_xs_OR').set('betas1', '1.64712000e-04');
model.variable('var_xs_OR').set('betas2', '9.85399000e-04');
model.variable('var_xs_OR').set('betas3', '8.56807000e-04');
model.variable('var_xs_OR').set('betas4', '2.40172000e-03');
model.variable('var_xs_OR').set('betas5', '7.27014000e-04');
model.variable('var_xs_OR').set('betas6', '2.49379000e-04');
model.variable('var_xs_OR').set('chid1', '0.00000000e+00');
model.variable('var_xs_OR').set('chid2', '0.00000000e+00');
model.variable('var_xs_OR').set('chid3', '0.00000000e+00');
model.variable('var_xs_OR').set('chid4', '0.00000000e+00');
model.variable('var_xs_OR').set('chid5', '0.00000000e+00');
model.variable('var_xs_OR').set('chid6', '0.00000000e+00');
model.variable('var_xs_OR').set('chid7', '0.00000000e+00');
model.variable('var_xs_OR').set('chid8', '0.00000000e+00');
model.variable('var_xs_OR').set('chip1', '0.00000000e+00');
model.variable('var_xs_OR').set('chip2', '0.00000000e+00');
model.variable('var_xs_OR').set('chip3', '0.00000000e+00');
model.variable('var_xs_OR').set('chip4', '0.00000000e+00');
model.variable('var_xs_OR').set('chip5', '0.00000000e+00');
model.variable('var_xs_OR').set('chip6', '0.00000000e+00');
model.variable('var_xs_OR').set('chip7', '0.00000000e+00');
model.variable('var_xs_OR').set('chip8', '0.00000000e+00');
model.variable('var_xs_OR').set('chit1', '0.00000000e+00');
model.variable('var_xs_OR').set('chit2', '0.00000000e+00');
model.variable('var_xs_OR').set('chit3', '0.00000000e+00');
model.variable('var_xs_OR').set('chit4', '0.00000000e+00');
model.variable('var_xs_OR').set('chit5', '0.00000000e+00');
model.variable('var_xs_OR').set('chit6', '0.00000000e+00');
model.variable('var_xs_OR').set('chit7', '0.00000000e+00');
model.variable('var_xs_OR').set('chit8', '0.00000000e+00');
model.variable('var_xs_OR').set('diff11', '1.91408000e+00[cm]');
model.variable('var_xs_OR').set('diff12', '8.52247000e-01[cm]');
model.variable('var_xs_OR').set('diff13', '6.58974000e-01[cm]');
model.variable('var_xs_OR').set('diff14', '6.56651000e-01[cm]');
model.variable('var_xs_OR').set('diff15', '6.53107000e-01[cm]');
model.variable('var_xs_OR').set('diff16', '6.46171000e-01[cm]');
model.variable('var_xs_OR').set('diff17', '6.19859000e-01[cm]');
model.variable('var_xs_OR').set('diff18', '5.53895000e-01[cm]');
model.variable('var_xs_OR').set('fiss1', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('fiss2', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('fiss3', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('fiss4', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('fiss5', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('fiss6', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('fiss7', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('fiss8', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('invV1', '4.77903000e-10[s/cm]');
model.variable('var_xs_OR').set('invV2', '2.09359000e-09[s/cm]');
model.variable('var_xs_OR').set('invV3', '3.86037000e-08[s/cm]');
model.variable('var_xs_OR').set('invV4', '2.12906000e-07[s/cm]');
model.variable('var_xs_OR').set('invV5', '8.10944000e-07[s/cm]');
model.variable('var_xs_OR').set('invV6', '1.38405000e-06[s/cm]');
model.variable('var_xs_OR').set('invV7', '2.17033000e-06[s/cm]');
model.variable('var_xs_OR').set('invV8', '4.16019000e-06[s/cm]');
model.variable('var_xs_OR').set('kappa1', '0.00000000e+00[MeV]');
model.variable('var_xs_OR').set('kappa2', '0.00000000e+00[MeV]');
model.variable('var_xs_OR').set('kappa3', '0.00000000e+00[MeV]');
model.variable('var_xs_OR').set('kappa4', '0.00000000e+00[MeV]');
model.variable('var_xs_OR').set('kappa5', '0.00000000e+00[MeV]');
model.variable('var_xs_OR').set('kappa6', '0.00000000e+00[MeV]');
model.variable('var_xs_OR').set('kappa7', '0.00000000e+00[MeV]');
model.variable('var_xs_OR').set('kappa8', '0.00000000e+00[MeV]');
model.variable('var_xs_OR').set('lambdas1', '1.25435000e-02[1/s]');
model.variable('var_xs_OR').set('lambdas2', '3.13212000e-02[1/s]');
model.variable('var_xs_OR').set('lambdas3', '1.09688000e-01[1/s]');
model.variable('var_xs_OR').set('lambdas4', '3.16554000e-01[1/s]');
model.variable('var_xs_OR').set('lambdas5', '1.29420000e+00[1/s]');
model.variable('var_xs_OR').set('lambdas6', '8.03336000e+00[1/s]');
model.variable('var_xs_OR').set('nsf1', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('nsf2', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('nsf3', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('nsf4', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('nsf5', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('nsf6', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('nsf7', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('nsf8', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('diff21', '1.26967198e+00[cm]');
model.variable('var_xs_OR').set('diff22', '5.75353763e-01[cm]');
model.variable('var_xs_OR').set('diff23', '4.79586660e-01[cm]');
model.variable('var_xs_OR').set('diff24', '4.78273624e-01[cm]');
model.variable('var_xs_OR').set('diff25', '4.77207635e-01[cm]');
model.variable('var_xs_OR').set('diff26', '4.75171497e-01[cm]');
model.variable('var_xs_OR').set('diff27', '4.65409355e-01[cm]');
model.variable('var_xs_OR').set('diff28', '4.39711520e-01[cm]');
model.variable('var_xs_OR').set('rem1', '4.57588000e-02[1/cm]');
model.variable('var_xs_OR').set('rem2', '2.63133000e-02[1/cm]');
model.variable('var_xs_OR').set('rem3', '1.99450000e-02[1/cm]');
model.variable('var_xs_OR').set('rem4', '3.80198000e-02[1/cm]');
model.variable('var_xs_OR').set('rem5', '1.25456000e-01[1/cm]');
model.variable('var_xs_OR').set('rem6', '1.02997000e-01[1/cm]');
model.variable('var_xs_OR').set('rem7', '8.64616000e-02[1/cm]');
model.variable('var_xs_OR').set('rem8', '1.06180000e-01[1/cm]');
model.variable('var_xs_OR').set('scat11', '1.56768000e-01[1/cm]');
model.variable('var_xs_OR').set('scat12', '4.56348000e-02[1/cm]');
model.variable('var_xs_OR').set('scat13', '3.66689000e-06[1/cm]');
model.variable('var_xs_OR').set('scat14', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat15', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat16', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat17', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat18', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat21', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat22', '4.20616000e-01[1/cm]');
model.variable('var_xs_OR').set('scat23', '2.63132000e-02[1/cm]');
model.variable('var_xs_OR').set('scat24', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat25', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat26', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat27', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat28', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat31', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat32', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat33', '5.16231000e-01[1/cm]');
model.variable('var_xs_OR').set('scat34', '1.99412000e-02[1/cm]');
model.variable('var_xs_OR').set('scat35', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat36', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat37', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat38', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat41', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat42', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat43', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat44', '4.99628000e-01[1/cm]');
model.variable('var_xs_OR').set('scat45', '3.79994000e-02[1/cm]');
model.variable('var_xs_OR').set('scat46', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat47', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat48', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat51', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat52', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat53', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat54', '1.57482000e-04[1/cm]');
model.variable('var_xs_OR').set('scat55', '4.13393000e-01[1/cm]');
model.variable('var_xs_OR').set('scat56', '1.23270000e-01[1/cm]');
model.variable('var_xs_OR').set('scat57', '1.94981000e-03[1/cm]');
model.variable('var_xs_OR').set('scat58', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat61', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat62', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat63', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat64', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat65', '1.23103000e-02[1/cm]');
model.variable('var_xs_OR').set('scat66', '4.38160000e-01[1/cm]');
model.variable('var_xs_OR').set('scat67', '8.59813000e-02[1/cm]');
model.variable('var_xs_OR').set('scat68', '4.57344000e-03[1/cm]');
model.variable('var_xs_OR').set('scat71', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat72', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat73', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat74', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat75', '1.57137000e-04[1/cm]');
model.variable('var_xs_OR').set('scat76', '5.82717000e-02[1/cm]');
model.variable('var_xs_OR').set('scat77', '4.66047000e-01[1/cm]');
model.variable('var_xs_OR').set('scat78', '2.78258000e-02[1/cm]');
model.variable('var_xs_OR').set('scat81', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat82', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat83', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat84', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat85', '0.00000000e+00[1/cm]');
model.variable('var_xs_OR').set('scat86', '1.00109000e-02[1/cm]');
model.variable('var_xs_OR').set('scat87', '9.57752000e-02[1/cm]');
model.variable('var_xs_OR').set('scat88', '4.78620000e-01[1/cm]');
model.variable('var_xs_OR').set('tot1', '2.02527000e-01[1/cm]');
model.variable('var_xs_OR').set('tot2', '4.46930000e-01[1/cm]');
model.variable('var_xs_OR').set('tot3', '5.36176000e-01[1/cm]');
model.variable('var_xs_OR').set('tot4', '5.37648000e-01[1/cm]');
model.variable('var_xs_OR').set('tot5', '5.38849000e-01[1/cm]');
model.variable('var_xs_OR').set('tot6', '5.41158000e-01[1/cm]');
model.variable('var_xs_OR').set('tot7', '5.52509000e-01[1/cm]');
model.variable('var_xs_OR').set('tot8', '5.84799000e-01[1/cm]');
model.variable('var_xs_OR').selection.geom('geom1', 3);
model.variable('var_xs_OR').selection.set([4]);
model.variable.create('var_xs_CB');
model.variable('var_xs_CB').model('mod1');
model.variable('var_xs_CB').set('beta1', '5.38503000e-03');
model.variable('var_xs_CB').set('betas1', '1.64712000e-04');
model.variable('var_xs_CB').set('betas2', '9.85399000e-04');
model.variable('var_xs_CB').set('betas3', '8.56807000e-04');
model.variable('var_xs_CB').set('betas4', '2.40172000e-03');
model.variable('var_xs_CB').set('betas5', '7.27014000e-04');
model.variable('var_xs_CB').set('betas6', '2.49379000e-04');
model.variable('var_xs_CB').set('chid1', '0.00000000e+00');
model.variable('var_xs_CB').set('chid2', '0.00000000e+00');
model.variable('var_xs_CB').set('chid3', '0.00000000e+00');
model.variable('var_xs_CB').set('chid4', '0.00000000e+00');
model.variable('var_xs_CB').set('chid5', '0.00000000e+00');
model.variable('var_xs_CB').set('chid6', '0.00000000e+00');
model.variable('var_xs_CB').set('chid7', '0.00000000e+00');
model.variable('var_xs_CB').set('chid8', '0.00000000e+00');
model.variable('var_xs_CB').set('chip1', '0.00000000e+00');
model.variable('var_xs_CB').set('chip2', '0.00000000e+00');
model.variable('var_xs_CB').set('chip3', '0.00000000e+00');
model.variable('var_xs_CB').set('chip4', '0.00000000e+00');
model.variable('var_xs_CB').set('chip5', '0.00000000e+00');
model.variable('var_xs_CB').set('chip6', '0.00000000e+00');
model.variable('var_xs_CB').set('chip7', '0.00000000e+00');
model.variable('var_xs_CB').set('chip8', '0.00000000e+00');
model.variable('var_xs_CB').set('chit1', '0.00000000e+00');
model.variable('var_xs_CB').set('chit2', '0.00000000e+00');
model.variable('var_xs_CB').set('chit3', '0.00000000e+00');
model.variable('var_xs_CB').set('chit4', '0.00000000e+00');
model.variable('var_xs_CB').set('chit5', '0.00000000e+00');
model.variable('var_xs_CB').set('chit6', '0.00000000e+00');
model.variable('var_xs_CB').set('chit7', '0.00000000e+00');
model.variable('var_xs_CB').set('chit8', '0.00000000e+00');
model.variable('var_xs_CB').set('diff11', '1.90476000e+00[cm]');
model.variable('var_xs_CB').set('diff12', '1.13073000e+00[cm]');
model.variable('var_xs_CB').set('diff13', '3.92131000e-01[cm]');
model.variable('var_xs_CB').set('diff14', '3.75564000e-01[cm]');
model.variable('var_xs_CB').set('diff15', '3.59711000e-01[cm]');
model.variable('var_xs_CB').set('diff16', '3.48793000e-01[cm]');
model.variable('var_xs_CB').set('diff17', '3.32095000e-01[cm]');
model.variable('var_xs_CB').set('diff18', '2.97717000e-01[cm]');
model.variable('var_xs_CB').set('fiss1', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('fiss2', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('fiss3', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('fiss4', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('fiss5', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('fiss6', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('fiss7', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('fiss8', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('invV1', '4.53385000e-10[s/cm]');
model.variable('var_xs_CB').set('invV2', '2.00768000e-09[s/cm]');
model.variable('var_xs_CB').set('invV3', '4.00640000e-08[s/cm]');
model.variable('var_xs_CB').set('invV4', '2.20623000e-07[s/cm]');
model.variable('var_xs_CB').set('invV5', '8.92173000e-07[s/cm]');
model.variable('var_xs_CB').set('invV6', '1.37938000e-06[s/cm]');
model.variable('var_xs_CB').set('invV7', '2.14021000e-06[s/cm]');
model.variable('var_xs_CB').set('invV8', '3.98303000e-06[s/cm]');
model.variable('var_xs_CB').set('kappa1', '0.00000000e+00[MeV]');
model.variable('var_xs_CB').set('kappa2', '0.00000000e+00[MeV]');
model.variable('var_xs_CB').set('kappa3', '0.00000000e+00[MeV]');
model.variable('var_xs_CB').set('kappa4', '0.00000000e+00[MeV]');
model.variable('var_xs_CB').set('kappa5', '0.00000000e+00[MeV]');
model.variable('var_xs_CB').set('kappa6', '0.00000000e+00[MeV]');
model.variable('var_xs_CB').set('kappa7', '0.00000000e+00[MeV]');
model.variable('var_xs_CB').set('kappa8', '0.00000000e+00[MeV]');
model.variable('var_xs_CB').set('lambdas1', '1.25435000e-02[1/s]');
model.variable('var_xs_CB').set('lambdas2', '3.13212000e-02[1/s]');
model.variable('var_xs_CB').set('lambdas3', '1.09688000e-01[1/s]');
model.variable('var_xs_CB').set('lambdas4', '3.16554000e-01[1/s]');
model.variable('var_xs_CB').set('lambdas5', '1.29420000e+00[1/s]');
model.variable('var_xs_CB').set('lambdas6', '8.03336000e+00[1/s]');
model.variable('var_xs_CB').set('nsf1', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('nsf2', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('nsf3', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('nsf4', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('nsf5', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('nsf6', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('nsf7', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('nsf8', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('diff21', '8.89900079e-01[cm]');
model.variable('var_xs_CB').set('diff22', '6.80538563e-01[cm]');
model.variable('var_xs_CB').set('diff23', '2.90461721e-01[cm]');
model.variable('var_xs_CB').set('diff24', '2.85446283e-01[cm]');
model.variable('var_xs_CB').set('diff25', '2.74152659e-01[cm]');
model.variable('var_xs_CB').set('diff26', '2.65952260e-01[cm]');
model.variable('var_xs_CB').set('diff27', '2.53350205e-01[cm]');
model.variable('var_xs_CB').set('diff28', '2.26286438e-01[cm]');
model.variable('var_xs_CB').set('rem1', '5.87479000e-02[1/cm]');
model.variable('var_xs_CB').set('rem2', '6.57704000e-03[1/cm]');
model.variable('var_xs_CB').set('rem3', '1.48596000e-02[1/cm]');
model.variable('var_xs_CB').set('rem4', '3.45226000e-02[1/cm]');
model.variable('var_xs_CB').set('rem5', '2.01510000e-01[1/cm]');
model.variable('var_xs_CB').set('rem6', '1.78070000e-01[1/cm]');
model.variable('var_xs_CB').set('rem7', '2.30818000e-01[1/cm]');
model.variable('var_xs_CB').set('rem8', '4.07767000e-01[1/cm]');
model.variable('var_xs_CB').set('scat11', '2.30209000e-01[1/cm]');
model.variable('var_xs_CB').set('scat12', '5.68996000e-02[1/cm]');
model.variable('var_xs_CB').set('scat13', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat14', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat15', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat16', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat17', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat18', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat21', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat22', '3.71275000e-01[1/cm]');
model.variable('var_xs_CB').set('scat23', '5.82037000e-03[1/cm]');
model.variable('var_xs_CB').set('scat24', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat25', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat26', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat27', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat28', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat31', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat32', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat33', '8.70430000e-01[1/cm]');
model.variable('var_xs_CB').set('scat34', '8.35681000e-03[1/cm]');
model.variable('var_xs_CB').set('scat35', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat36', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat37', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat38', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat41', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat42', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat43', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat44', '8.66322000e-01[1/cm]');
model.variable('var_xs_CB').set('scat45', '1.82799000e-02[1/cm]');
model.variable('var_xs_CB').set('scat46', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat47', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat48', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat51', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat52', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat53', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat54', '2.05978000e-04[1/cm]');
model.variable('var_xs_CB').set('scat55', '7.36446000e-01[1/cm]');
model.variable('var_xs_CB').set('scat56', '1.50672000e-01[1/cm]');
model.variable('var_xs_CB').set('scat57', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat58', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat61', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat62', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat63', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat64', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat65', '1.09994000e-02[1/cm]');
model.variable('var_xs_CB').set('scat66', '7.88805000e-01[1/cm]');
model.variable('var_xs_CB').set('scat67', '8.88560000e-02[1/cm]');
model.variable('var_xs_CB').set('scat68', '4.99393000e-06[1/cm]');
model.variable('var_xs_CB').set('scat71', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat72', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat73', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat74', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat75', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat76', '6.54638000e-02[1/cm]');
model.variable('var_xs_CB').set('scat77', '7.84156000e-01[1/cm]');
model.variable('var_xs_CB').set('scat78', '4.24438000e-02[1/cm]');
model.variable('var_xs_CB').set('scat81', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat82', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat83', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat84', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat85', '0.00000000e+00[1/cm]');
model.variable('var_xs_CB').set('scat86', '1.11067000e-05[1/cm]');
model.variable('var_xs_CB').set('scat87', '1.78854000e-01[1/cm]');
model.variable('var_xs_CB').set('scat88', '7.28597000e-01[1/cm]');
model.variable('var_xs_CB').set('tot1', '2.88957000e-01[1/cm]');
model.variable('var_xs_CB').set('tot2', '3.77852000e-01[1/cm]');
model.variable('var_xs_CB').set('tot3', '8.85290000e-01[1/cm]');
model.variable('var_xs_CB').set('tot4', '9.00845000e-01[1/cm]');
model.variable('var_xs_CB').set('tot5', '9.37955000e-01[1/cm]');
model.variable('var_xs_CB').set('tot6', '9.66876000e-01[1/cm]');
model.variable('var_xs_CB').set('tot7', '1.01497000e+00[1/cm]');
model.variable('var_xs_CB').set('tot8', '1.13636000e+00[1/cm]');
model.variable('var_xs_CB').selection.geom('geom1', 3);
model.variable('var_xs_CB').selection.set([3]);
model.variable.create('var_xs_DC');
model.variable('var_xs_DC').model('mod1');
model.variable('var_xs_DC').set('beta1', '5.38503000e-03');
model.variable('var_xs_DC').set('betas1', '1.64712000e-04');
model.variable('var_xs_DC').set('betas2', '9.85399000e-04');
model.variable('var_xs_DC').set('betas3', '8.56807000e-04');
model.variable('var_xs_DC').set('betas4', '2.40172000e-03');
model.variable('var_xs_DC').set('betas5', '7.27014000e-04');
model.variable('var_xs_DC').set('betas6', '2.49379000e-04');
model.variable('var_xs_DC').set('chid1', '0.00000000e+00');
model.variable('var_xs_DC').set('chid2', '0.00000000e+00');
model.variable('var_xs_DC').set('chid3', '0.00000000e+00');
model.variable('var_xs_DC').set('chid4', '0.00000000e+00');
model.variable('var_xs_DC').set('chid5', '0.00000000e+00');
model.variable('var_xs_DC').set('chid6', '0.00000000e+00');
model.variable('var_xs_DC').set('chid7', '0.00000000e+00');
model.variable('var_xs_DC').set('chid8', '0.00000000e+00');
model.variable('var_xs_DC').set('chip1', '0.00000000e+00');
model.variable('var_xs_DC').set('chip2', '0.00000000e+00');
model.variable('var_xs_DC').set('chip3', '0.00000000e+00');
model.variable('var_xs_DC').set('chip4', '0.00000000e+00');
model.variable('var_xs_DC').set('chip5', '0.00000000e+00');
model.variable('var_xs_DC').set('chip6', '0.00000000e+00');
model.variable('var_xs_DC').set('chip7', '0.00000000e+00');
model.variable('var_xs_DC').set('chip8', '0.00000000e+00');
model.variable('var_xs_DC').set('chit1', '0.00000000e+00');
model.variable('var_xs_DC').set('chit2', '0.00000000e+00');
model.variable('var_xs_DC').set('chit3', '0.00000000e+00');
model.variable('var_xs_DC').set('chit4', '0.00000000e+00');
model.variable('var_xs_DC').set('chit5', '0.00000000e+00');
model.variable('var_xs_DC').set('chit6', '0.00000000e+00');
model.variable('var_xs_DC').set('chit7', '0.00000000e+00');
model.variable('var_xs_DC').set('chit8', '0.00000000e+00');
model.variable('var_xs_DC').set('diff11', '2.87437000e+00[cm]');
model.variable('var_xs_DC').set('diff12', '1.05669000e+00[cm]');
model.variable('var_xs_DC').set('diff13', '1.27612000e+00[cm]');
model.variable('var_xs_DC').set('diff14', '1.28828000e+00[cm]');
model.variable('var_xs_DC').set('diff15', '1.29013000e+00[cm]');
model.variable('var_xs_DC').set('diff16', '1.27679000e+00[cm]');
model.variable('var_xs_DC').set('diff17', '1.25295000e+00[cm]');
model.variable('var_xs_DC').set('diff18', '1.16319000e+00[cm]');
model.variable('var_xs_DC').set('fiss1', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('fiss2', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('fiss3', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('fiss4', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('fiss5', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('fiss6', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('fiss7', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('fiss8', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('invV1', '4.58986000e-10[s/cm]');
model.variable('var_xs_DC').set('invV2', '2.03767000e-09[s/cm]');
model.variable('var_xs_DC').set('invV3', '3.91233000e-08[s/cm]');
model.variable('var_xs_DC').set('invV4', '2.18118000e-07[s/cm]');
model.variable('var_xs_DC').set('invV5', '8.75578000e-07[s/cm]');
model.variable('var_xs_DC').set('invV6', '1.37751000e-06[s/cm]');
model.variable('var_xs_DC').set('invV7', '2.13321000e-06[s/cm]');
model.variable('var_xs_DC').set('invV8', '4.04469000e-06[s/cm]');
model.variable('var_xs_DC').set('kappa1', '0.00000000e+00[MeV]');
model.variable('var_xs_DC').set('kappa2', '0.00000000e+00[MeV]');
model.variable('var_xs_DC').set('kappa3', '0.00000000e+00[MeV]');
model.variable('var_xs_DC').set('kappa4', '0.00000000e+00[MeV]');
model.variable('var_xs_DC').set('kappa5', '0.00000000e+00[MeV]');
model.variable('var_xs_DC').set('kappa6', '0.00000000e+00[MeV]');
model.variable('var_xs_DC').set('kappa7', '0.00000000e+00[MeV]');
model.variable('var_xs_DC').set('kappa8', '0.00000000e+00[MeV]');
model.variable('var_xs_DC').set('lambdas1', '1.25435000e-02[1/s]');
model.variable('var_xs_DC').set('lambdas2', '3.13212000e-02[1/s]');
model.variable('var_xs_DC').set('lambdas3', '1.09688000e-01[1/s]');
model.variable('var_xs_DC').set('lambdas4', '3.16554000e-01[1/s]');
model.variable('var_xs_DC').set('lambdas5', '1.29420000e+00[1/s]');
model.variable('var_xs_DC').set('lambdas6', '8.03336000e+00[1/s]');
model.variable('var_xs_DC').set('nsf1', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('nsf2', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('nsf3', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('nsf4', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('nsf5', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('nsf6', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('nsf7', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('nsf8', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('diff21', '1.31436750e+00[cm]');
model.variable('var_xs_DC').set('diff22', '7.19588683e-01[cm]');
model.variable('var_xs_DC').set('diff23', '9.30806917e-01[cm]');
model.variable('var_xs_DC').set('diff24', '9.42775121e-01[cm]');
model.variable('var_xs_DC').set('diff25', '9.40461474e-01[cm]');
model.variable('var_xs_DC').set('diff26', '9.34151165e-01[cm]');
model.variable('var_xs_DC').set('diff27', '9.19053355e-01[cm]');
model.variable('var_xs_DC').set('diff28', '8.54238446e-01[cm]');
model.variable('var_xs_DC').set('rem1', '5.15817000e-02[1/cm]');
model.variable('var_xs_DC').set('rem2', '1.30297000e-02[1/cm]');
model.variable('var_xs_DC').set('rem3', '1.01676000e-02[1/cm]');
model.variable('var_xs_DC').set('rem4', '1.92099000e-02[1/cm]');
model.variable('var_xs_DC').set('rem5', '8.61034000e-02[1/cm]');
model.variable('var_xs_DC').set('rem6', '6.19777000e-02[1/cm]');
model.variable('var_xs_DC').set('rem7', '6.50364000e-02[1/cm]');
model.variable('var_xs_DC').set('rem8', '1.03747000e-01[1/cm]');
model.variable('var_xs_DC').set('scat11', '1.44058000e-01[1/cm]');
model.variable('var_xs_DC').set('scat12', '4.99402000e-02[1/cm]');
model.variable('var_xs_DC').set('scat13', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat14', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat15', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat16', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat17', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat18', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat21', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat22', '3.44317000e-01[1/cm]');
model.variable('var_xs_DC').set('scat23', '1.29797000e-02[1/cm]');
model.variable('var_xs_DC').set('scat24', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat25', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat26', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat27', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat28', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat31', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat32', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat33', '2.66091000e-01[1/cm]');
model.variable('var_xs_DC').set('scat34', '1.01676000e-02[1/cm]');
model.variable('var_xs_DC').set('scat35', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat36', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat37', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat38', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat41', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat42', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat43', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat44', '2.53541000e-01[1/cm]');
model.variable('var_xs_DC').set('scat45', '1.90885000e-02[1/cm]');
model.variable('var_xs_DC').set('scat46', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat47', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat48', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat51', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat52', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat53', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat54', '3.72941000e-05[1/cm]');
model.variable('var_xs_DC').set('scat55', '1.87319000e-01[1/cm]');
model.variable('var_xs_DC').set('scat56', '8.48168000e-02[1/cm]');
model.variable('var_xs_DC').set('scat57', '8.22506000e-04[1/cm]');
model.variable('var_xs_DC').set('scat58', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat61', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat62', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat63', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat64', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat65', '5.84943000e-03[1/cm]');
model.variable('var_xs_DC').set('scat66', '2.13292000e-01[1/cm]');
model.variable('var_xs_DC').set('scat67', '5.46252000e-02[1/cm]');
model.variable('var_xs_DC').set('scat68', '9.23602000e-04[1/cm]');
model.variable('var_xs_DC').set('scat71', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat72', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat73', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat74', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat75', '2.35259000e-05[1/cm]');
model.variable('var_xs_DC').set('scat76', '3.70410000e-02[1/cm]');
model.variable('var_xs_DC').set('scat77', '2.14755000e-01[1/cm]');
model.variable('var_xs_DC').set('scat78', '2.70967000e-02[1/cm]');
model.variable('var_xs_DC').set('scat81', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat82', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat83', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat84', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat85', '0.00000000e+00[1/cm]');
model.variable('var_xs_DC').set('scat86', '1.90635000e-03[1/cm]');
model.variable('var_xs_DC').set('scat87', '1.00092000e-01[1/cm]');
model.variable('var_xs_DC').set('scat88', '1.97273000e-01[1/cm]');
model.variable('var_xs_DC').set('tot1', '1.95640000e-01[1/cm]');
model.variable('var_xs_DC').set('tot2', '3.57347000e-01[1/cm]');
model.variable('var_xs_DC').set('tot3', '2.76258000e-01[1/cm]');
model.variable('var_xs_DC').set('tot4', '2.72751000e-01[1/cm]');
model.variable('var_xs_DC').set('tot5', '2.73422000e-01[1/cm]');
model.variable('var_xs_DC').set('tot6', '2.75269000e-01[1/cm]');
model.variable('var_xs_DC').set('tot7', '2.79791000e-01[1/cm]');
model.variable('var_xs_DC').set('tot8', '3.01020000e-01[1/cm]');
model.variable('var_xs_DC').selection.geom('geom1', 3);
model.variable('var_xs_DC').selection.set([2]);
model.variable.create('var_xs_VS');
model.variable('var_xs_VS').model('mod1');
model.variable('var_xs_VS').set('beta1', '5.38503000e-03');
model.variable('var_xs_VS').set('betas1', '1.64712000e-04');
model.variable('var_xs_VS').set('betas2', '9.85399000e-04');
model.variable('var_xs_VS').set('betas3', '8.56807000e-04');
model.variable('var_xs_VS').set('betas4', '2.40172000e-03');
model.variable('var_xs_VS').set('betas5', '7.27014000e-04');
model.variable('var_xs_VS').set('betas6', '2.49379000e-04');
model.variable('var_xs_VS').set('chid1', '0.00000000e+00');
model.variable('var_xs_VS').set('chid2', '0.00000000e+00');
model.variable('var_xs_VS').set('chid3', '0.00000000e+00');
model.variable('var_xs_VS').set('chid4', '0.00000000e+00');
model.variable('var_xs_VS').set('chid5', '0.00000000e+00');
model.variable('var_xs_VS').set('chid6', '0.00000000e+00');
model.variable('var_xs_VS').set('chid7', '0.00000000e+00');
model.variable('var_xs_VS').set('chid8', '0.00000000e+00');
model.variable('var_xs_VS').set('chip1', '0.00000000e+00');
model.variable('var_xs_VS').set('chip2', '0.00000000e+00');
model.variable('var_xs_VS').set('chip3', '0.00000000e+00');
model.variable('var_xs_VS').set('chip4', '0.00000000e+00');
model.variable('var_xs_VS').set('chip5', '0.00000000e+00');
model.variable('var_xs_VS').set('chip6', '0.00000000e+00');
model.variable('var_xs_VS').set('chip7', '0.00000000e+00');
model.variable('var_xs_VS').set('chip8', '0.00000000e+00');
model.variable('var_xs_VS').set('chit1', '0.00000000e+00');
model.variable('var_xs_VS').set('chit2', '0.00000000e+00');
model.variable('var_xs_VS').set('chit3', '0.00000000e+00');
model.variable('var_xs_VS').set('chit4', '0.00000000e+00');
model.variable('var_xs_VS').set('chit5', '0.00000000e+00');
model.variable('var_xs_VS').set('chit6', '0.00000000e+00');
model.variable('var_xs_VS').set('chit7', '0.00000000e+00');
model.variable('var_xs_VS').set('chit8', '0.00000000e+00');
model.variable('var_xs_VS').set('diff11', '2.15542000e+00[cm]');
model.variable('var_xs_VS').set('diff12', '1.16171000e+00[cm]');
model.variable('var_xs_VS').set('diff13', '4.06323000e-01[cm]');
model.variable('var_xs_VS').set('diff14', '3.73674000e-01[cm]');
model.variable('var_xs_VS').set('diff15', '3.62030000e-01[cm]');
model.variable('var_xs_VS').set('diff16', '3.48862000e-01[cm]');
model.variable('var_xs_VS').set('diff17', '3.32753000e-01[cm]');
model.variable('var_xs_VS').set('diff18', '2.99486000e-01[cm]');
model.variable('var_xs_VS').set('fiss1', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('fiss2', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('fiss3', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('fiss4', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('fiss5', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('fiss6', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('fiss7', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('fiss8', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('invV1', '4.45359000e-10[s/cm]');
model.variable('var_xs_VS').set('invV2', '1.99434000e-09[s/cm]');
model.variable('var_xs_VS').set('invV3', '3.93068000e-08[s/cm]');
model.variable('var_xs_VS').set('invV4', '2.18138000e-07[s/cm]');
model.variable('var_xs_VS').set('invV5', '8.57651000e-07[s/cm]');
model.variable('var_xs_VS').set('invV6', '1.37066000e-06[s/cm]');
model.variable('var_xs_VS').set('invV7', '2.11156000e-06[s/cm]');
model.variable('var_xs_VS').set('invV8', '3.88917000e-06[s/cm]');
model.variable('var_xs_VS').set('kappa1', '0.00000000e+00[MeV]');
model.variable('var_xs_VS').set('kappa2', '0.00000000e+00[MeV]');
model.variable('var_xs_VS').set('kappa3', '0.00000000e+00[MeV]');
model.variable('var_xs_VS').set('kappa4', '0.00000000e+00[MeV]');
model.variable('var_xs_VS').set('kappa5', '0.00000000e+00[MeV]');
model.variable('var_xs_VS').set('kappa6', '0.00000000e+00[MeV]');
model.variable('var_xs_VS').set('kappa7', '0.00000000e+00[MeV]');
model.variable('var_xs_VS').set('kappa8', '0.00000000e+00[MeV]');
model.variable('var_xs_VS').set('lambdas1', '1.25435000e-02[1/s]');
model.variable('var_xs_VS').set('lambdas2', '3.13212000e-02[1/s]');
model.variable('var_xs_VS').set('lambdas3', '1.09688000e-01[1/s]');
model.variable('var_xs_VS').set('lambdas4', '3.16554000e-01[1/s]');
model.variable('var_xs_VS').set('lambdas5', '1.29420000e+00[1/s]');
model.variable('var_xs_VS').set('lambdas6', '8.03336000e+00[1/s]');
model.variable('var_xs_VS').set('nsf1', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('nsf2', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('nsf3', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('nsf4', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('nsf5', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('nsf6', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('nsf7', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('nsf8', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('diff21', '8.84957057e-01[cm]');
model.variable('var_xs_VS').set('diff22', '7.12474841e-01[cm]');
model.variable('var_xs_VS').set('diff23', '2.98704271e-01[cm]');
model.variable('var_xs_VS').set('diff24', '2.84994516e-01[cm]');
model.variable('var_xs_VS').set('diff25', '2.74752280e-01[cm]');
model.variable('var_xs_VS').set('diff26', '2.66098674e-01[cm]');
model.variable('var_xs_VS').set('diff27', '2.53805317e-01[cm]');
model.variable('var_xs_VS').set('diff28', '2.27604363e-01[cm]');
model.variable('var_xs_VS').set('rem1', '5.62726000e-02[1/cm]');
model.variable('var_xs_VS').set('rem2', '6.32849000e-03[1/cm]');
model.variable('var_xs_VS').set('rem3', '1.42450000e-02[1/cm]');
model.variable('var_xs_VS').set('rem4', '3.46019000e-02[1/cm]');
model.variable('var_xs_VS').set('rem5', '1.82970000e-01[1/cm]');
model.variable('var_xs_VS').set('rem6', '1.73300000e-01[1/cm]');
model.variable('var_xs_VS').set('rem7', '2.31782000e-01[1/cm]');
model.variable('var_xs_VS').set('rem8', '4.11843000e-01[1/cm]');
model.variable('var_xs_VS').set('scat11', '2.34299000e-01[1/cm]');
model.variable('var_xs_VS').set('scat12', '5.36041000e-02[1/cm]');
model.variable('var_xs_VS').set('scat13', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat14', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat15', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat16', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat17', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat18', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat21', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat22', '3.54586000e-01[1/cm]');
model.variable('var_xs_VS').set('scat23', '5.99725000e-03[1/cm]');
model.variable('var_xs_VS').set('scat24', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat25', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat26', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat27', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat28', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat31', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat32', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat33', '8.46616000e-01[1/cm]');
model.variable('var_xs_VS').set('scat34', '8.97786000e-03[1/cm]');
model.variable('var_xs_VS').set('scat35', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat36', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat37', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat38', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat41', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat42', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat43', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat44', '8.67671000e-01[1/cm]');
model.variable('var_xs_VS').set('scat45', '1.64430000e-02[1/cm]');
model.variable('var_xs_VS').set('scat46', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat47', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat48', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat51', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat52', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat53', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat54', '2.40011000e-04[1/cm]');
model.variable('var_xs_VS').set('scat55', '7.52938000e-01[1/cm]');
model.variable('var_xs_VS').set('scat56', '1.33717000e-01[1/cm]');
model.variable('var_xs_VS').set('scat57', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat58', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat61', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat62', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat63', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat64', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat65', '1.20877000e-02[1/cm]');
model.variable('var_xs_VS').set('scat66', '7.93044000e-01[1/cm]');
model.variable('var_xs_VS').set('scat67', '8.36639000e-02[1/cm]');
model.variable('var_xs_VS').set('scat68', '8.45127000e-06[1/cm]');
model.variable('var_xs_VS').set('scat71', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat72', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat73', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat74', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat75', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat76', '7.22870000e-02[1/cm]');
model.variable('var_xs_VS').set('scat77', '7.81365000e-01[1/cm]');
model.variable('var_xs_VS').set('scat78', '3.75643000e-02[1/cm]');
model.variable('var_xs_VS').set('scat81', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat82', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat83', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat84', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat85', '0.00000000e+00[1/cm]');
model.variable('var_xs_VS').set('scat86', '4.23544000e-06[1/cm]');
model.variable('var_xs_VS').set('scat87', '1.88878000e-01[1/cm]');
model.variable('var_xs_VS').set('scat88', '7.17939000e-01[1/cm]');
model.variable('var_xs_VS').set('tot1', '2.90571000e-01[1/cm]');
model.variable('var_xs_VS').set('tot2', '3.60915000e-01[1/cm]');
model.variable('var_xs_VS').set('tot3', '8.60861000e-01[1/cm]');
model.variable('var_xs_VS').set('tot4', '9.02273000e-01[1/cm]');
model.variable('var_xs_VS').set('tot5', '9.35908000e-01[1/cm]');
model.variable('var_xs_VS').set('tot6', '9.66344000e-01[1/cm]');
model.variable('var_xs_VS').set('tot7', '1.01315000e+00[1/cm]');
model.variable('var_xs_VS').set('tot8', '1.12978000e+00[1/cm]');
model.variable('var_xs_VS').selection.geom('geom1', 3);
model.variable('var_xs_VS').selection.set([1]);
model.variable.create('var_xs_CRCC1');
model.variable('var_xs_CRCC1').model('mod1');
model.variable('var_xs_CRCC1').set('beta1', '5.38503000e-03');
model.variable('var_xs_CRCC1').set('betas1', '1.64712000e-04');
model.variable('var_xs_CRCC1').set('betas2', '9.85399000e-04');
model.variable('var_xs_CRCC1').set('betas3', '8.56807000e-04');
model.variable('var_xs_CRCC1').set('betas4', '2.40172000e-03');
model.variable('var_xs_CRCC1').set('betas5', '7.27014000e-04');
model.variable('var_xs_CRCC1').set('betas6', '2.49379000e-04');
model.variable('var_xs_CRCC1').set('chid1', '0.00000000e+00');
model.variable('var_xs_CRCC1').set('chid2', '0.00000000e+00');
model.variable('var_xs_CRCC1').set('chid3', '0.00000000e+00');
model.variable('var_xs_CRCC1').set('chid4', '0.00000000e+00');
model.variable('var_xs_CRCC1').set('chid5', '0.00000000e+00');
model.variable('var_xs_CRCC1').set('chid6', '0.00000000e+00');
model.variable('var_xs_CRCC1').set('chid7', '0.00000000e+00');
model.variable('var_xs_CRCC1').set('chid8', '0.00000000e+00');
model.variable('var_xs_CRCC1').set('chip1', '0.00000000e+00');
model.variable('var_xs_CRCC1').set('chip2', '0.00000000e+00');
model.variable('var_xs_CRCC1').set('chip3', '0.00000000e+00');
model.variable('var_xs_CRCC1').set('chip4', '0.00000000e+00');
model.variable('var_xs_CRCC1').set('chip5', '0.00000000e+00');
model.variable('var_xs_CRCC1').set('chip6', '0.00000000e+00');
model.variable('var_xs_CRCC1').set('chip7', '0.00000000e+00');
model.variable('var_xs_CRCC1').set('chip8', '0.00000000e+00');
model.variable('var_xs_CRCC1').set('chit1', '0.00000000e+00');
model.variable('var_xs_CRCC1').set('chit2', '0.00000000e+00');
model.variable('var_xs_CRCC1').set('chit3', '0.00000000e+00');
model.variable('var_xs_CRCC1').set('chit4', '0.00000000e+00');
model.variable('var_xs_CRCC1').set('chit5', '0.00000000e+00');
model.variable('var_xs_CRCC1').set('chit6', '0.00000000e+00');
model.variable('var_xs_CRCC1').set('chit7', '0.00000000e+00');
model.variable('var_xs_CRCC1').set('chit8', '0.00000000e+00');
model.variable('var_xs_CRCC1').set('diff11', '2.21320000e+00[cm]');
model.variable('var_xs_CRCC1').set('diff12', '1.09632000e+00[cm]');
model.variable('var_xs_CRCC1').set('diff13', '1.30594000e+00[cm]');
model.variable('var_xs_CRCC1').set('diff14', '1.32082000e+00[cm]');
model.variable('var_xs_CRCC1').set('diff15', '1.31912000e+00[cm]');
model.variable('var_xs_CRCC1').set('diff16', '1.30619000e+00[cm]');
model.variable('var_xs_CRCC1').set('diff17', '1.28010000e+00[cm]');
model.variable('var_xs_CRCC1').set('diff18', '1.17081000e+00[cm]');
model.variable('var_xs_CRCC1').set('fiss1', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('fiss2', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('fiss3', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('fiss4', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('fiss5', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('fiss6', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('fiss7', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('fiss8', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('invV1', '4.83710000e-10[s/cm]');
model.variable('var_xs_CRCC1').set('invV2', '2.09094000e-09[s/cm]');
model.variable('var_xs_CRCC1').set('invV3', '3.30817000e-08[s/cm]');
model.variable('var_xs_CRCC1').set('invV4', '2.07368000e-07[s/cm]');
model.variable('var_xs_CRCC1').set('invV5', '7.07702000e-07[s/cm]');
model.variable('var_xs_CRCC1').set('invV6', '1.37468000e-06[s/cm]');
model.variable('var_xs_CRCC1').set('invV7', '2.16711000e-06[s/cm]');
model.variable('var_xs_CRCC1').set('invV8', '4.18483000e-06[s/cm]');
model.variable('var_xs_CRCC1').set('kappa1', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC1').set('kappa2', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC1').set('kappa3', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC1').set('kappa4', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC1').set('kappa5', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC1').set('kappa6', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC1').set('kappa7', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC1').set('kappa8', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC1').set('lambdas1', '1.25435000e-02[1/s]');
model.variable('var_xs_CRCC1').set('lambdas2', '3.13212000e-02[1/s]');
model.variable('var_xs_CRCC1').set('lambdas3', '1.09688000e-01[1/s]');
model.variable('var_xs_CRCC1').set('lambdas4', '3.16554000e-01[1/s]');
model.variable('var_xs_CRCC1').set('lambdas5', '1.29420000e+00[1/s]');
model.variable('var_xs_CRCC1').set('lambdas6', '8.03336000e+00[1/s]');
model.variable('var_xs_CRCC1').set('nsf1', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('nsf2', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('nsf3', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('nsf4', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('nsf5', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('nsf6', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('nsf7', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('nsf8', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('diff21', '1.30270151e+00[cm]');
model.variable('var_xs_CRCC1').set('diff22', '7.46987152e-01[cm]');
model.variable('var_xs_CRCC1').set('diff23', '9.55296375e-01[cm]');
model.variable('var_xs_CRCC1').set('diff24', '9.66549857e-01[cm]');
model.variable('var_xs_CRCC1').set('diff25', '9.65428540e-01[cm]');
model.variable('var_xs_CRCC1').set('diff26', '9.56796391e-01[cm]');
model.variable('var_xs_CRCC1').set('diff27', '9.38785941e-01[cm]');
model.variable('var_xs_CRCC1').set('diff28', '8.60251232e-01[cm]');
model.variable('var_xs_CRCC1').set('rem1', '5.36947000e-02[1/cm]');
model.variable('var_xs_CRCC1').set('rem2', '1.49343000e-02[1/cm]');
model.variable('var_xs_CRCC1').set('rem3', '6.73287000e-03[1/cm]');
model.variable('var_xs_CRCC1').set('rem4', '1.53287000e-02[1/cm]');
model.variable('var_xs_CRCC1').set('rem5', '3.68732000e-02[1/cm]');
model.variable('var_xs_CRCC1').set('rem6', '6.16316000e-02[1/cm]');
model.variable('var_xs_CRCC1').set('rem7', '6.72706000e-02[1/cm]');
model.variable('var_xs_CRCC1').set('rem8', '1.04805000e-01[1/cm]');
model.variable('var_xs_CRCC1').set('scat11', '1.43698000e-01[1/cm]');
model.variable('var_xs_CRCC1').set('scat12', '5.21751000e-02[1/cm]');
model.variable('var_xs_CRCC1').set('scat13', '4.43506000e-05[1/cm]');
model.variable('var_xs_CRCC1').set('scat14', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat15', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat16', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat17', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat18', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat21', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat22', '3.29306000e-01[1/cm]');
model.variable('var_xs_CRCC1').set('scat23', '1.48714000e-02[1/cm]');
model.variable('var_xs_CRCC1').set('scat24', '1.14717000e-07[1/cm]');
model.variable('var_xs_CRCC1').set('scat25', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat26', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat27', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat28', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat31', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat32', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat33', '2.62443000e-01[1/cm]');
model.variable('var_xs_CRCC1').set('scat34', '6.71688000e-03[1/cm]');
model.variable('var_xs_CRCC1').set('scat35', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat36', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat37', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat38', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat41', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat42', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat43', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat44', '2.50714000e-01[1/cm]');
model.variable('var_xs_CRCC1').set('scat45', '1.52426000e-02[1/cm]');
model.variable('var_xs_CRCC1').set('scat46', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat47', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat48', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat51', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat52', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat53', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat54', '1.78292000e-04[1/cm]');
model.variable('var_xs_CRCC1').set('scat55', '2.29478000e-01[1/cm]');
model.variable('var_xs_CRCC1').set('scat56', '3.60135000e-02[1/cm]');
model.variable('var_xs_CRCC1').set('scat57', '3.77267000e-04[1/cm]');
model.variable('var_xs_CRCC1').set('scat58', '2.96011000e-06[1/cm]');
model.variable('var_xs_CRCC1').set('scat61', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat62', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat63', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat64', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat65', '7.24922000e-03[1/cm]');
model.variable('var_xs_CRCC1').set('scat66', '2.07123000e-01[1/cm]');
model.variable('var_xs_CRCC1').set('scat67', '5.27797000e-02[1/cm]');
model.variable('var_xs_CRCC1').set('scat68', '1.02928000e-03[1/cm]');
model.variable('var_xs_CRCC1').set('scat71', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat72', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat73', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat74', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat75', '4.65130000e-05[1/cm]');
model.variable('var_xs_CRCC1').set('scat76', '3.73041000e-02[1/cm]');
model.variable('var_xs_CRCC1').set('scat77', '2.06639000e-01[1/cm]');
model.variable('var_xs_CRCC1').set('scat78', '2.90183000e-02[1/cm]');
model.variable('var_xs_CRCC1').set('scat81', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat82', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat83', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat84', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC1').set('scat85', '1.33791000e-06[1/cm]');
model.variable('var_xs_CRCC1').set('scat86', '2.48058000e-03[1/cm]');
model.variable('var_xs_CRCC1').set('scat87', '1.00580000e-01[1/cm]');
model.variable('var_xs_CRCC1').set('scat88', '1.94110000e-01[1/cm]');
model.variable('var_xs_CRCC1').set('tot1', '1.97392000e-01[1/cm]');
model.variable('var_xs_CRCC1').set('tot2', '3.44240000e-01[1/cm]');
model.variable('var_xs_CRCC1').set('tot3', '2.69176000e-01[1/cm]');
model.variable('var_xs_CRCC1').set('tot4', '2.66042000e-01[1/cm]');
model.variable('var_xs_CRCC1').set('tot5', '2.66351000e-01[1/cm]');
model.variable('var_xs_CRCC1').set('tot6', '2.68754000e-01[1/cm]');
model.variable('var_xs_CRCC1').set('tot7', '2.73910000e-01[1/cm]');
model.variable('var_xs_CRCC1').set('tot8', '2.98916000e-01[1/cm]');
model.variable('var_xs_CRCC1').selection.geom('geom1', 3);
model.variable('var_xs_CRCC1').selection.set([14]);
model.variable.create('var_xs_CRCC2');
model.variable('var_xs_CRCC2').model('mod1');
model.variable('var_xs_CRCC2').set('beta1', '5.38503000e-03');
model.variable('var_xs_CRCC2').set('betas1', '1.64712000e-04');
model.variable('var_xs_CRCC2').set('betas2', '9.85399000e-04');
model.variable('var_xs_CRCC2').set('betas3', '8.56807000e-04');
model.variable('var_xs_CRCC2').set('betas4', '2.40172000e-03');
model.variable('var_xs_CRCC2').set('betas5', '7.27014000e-04');
model.variable('var_xs_CRCC2').set('betas6', '2.49379000e-04');
model.variable('var_xs_CRCC2').set('chid1', '0.00000000e+00');
model.variable('var_xs_CRCC2').set('chid2', '0.00000000e+00');
model.variable('var_xs_CRCC2').set('chid3', '0.00000000e+00');
model.variable('var_xs_CRCC2').set('chid4', '0.00000000e+00');
model.variable('var_xs_CRCC2').set('chid5', '0.00000000e+00');
model.variable('var_xs_CRCC2').set('chid6', '0.00000000e+00');
model.variable('var_xs_CRCC2').set('chid7', '0.00000000e+00');
model.variable('var_xs_CRCC2').set('chid8', '0.00000000e+00');
model.variable('var_xs_CRCC2').set('chip1', '0.00000000e+00');
model.variable('var_xs_CRCC2').set('chip2', '0.00000000e+00');
model.variable('var_xs_CRCC2').set('chip3', '0.00000000e+00');
model.variable('var_xs_CRCC2').set('chip4', '0.00000000e+00');
model.variable('var_xs_CRCC2').set('chip5', '0.00000000e+00');
model.variable('var_xs_CRCC2').set('chip6', '0.00000000e+00');
model.variable('var_xs_CRCC2').set('chip7', '0.00000000e+00');
model.variable('var_xs_CRCC2').set('chip8', '0.00000000e+00');
model.variable('var_xs_CRCC2').set('chit1', '0.00000000e+00');
model.variable('var_xs_CRCC2').set('chit2', '0.00000000e+00');
model.variable('var_xs_CRCC2').set('chit3', '0.00000000e+00');
model.variable('var_xs_CRCC2').set('chit4', '0.00000000e+00');
model.variable('var_xs_CRCC2').set('chit5', '0.00000000e+00');
model.variable('var_xs_CRCC2').set('chit6', '0.00000000e+00');
model.variable('var_xs_CRCC2').set('chit7', '0.00000000e+00');
model.variable('var_xs_CRCC2').set('chit8', '0.00000000e+00');
model.variable('var_xs_CRCC2').set('diff11', '2.21320000e+00[cm]');
model.variable('var_xs_CRCC2').set('diff12', '1.09632000e+00[cm]');
model.variable('var_xs_CRCC2').set('diff13', '1.30594000e+00[cm]');
model.variable('var_xs_CRCC2').set('diff14', '1.32082000e+00[cm]');
model.variable('var_xs_CRCC2').set('diff15', '1.31912000e+00[cm]');
model.variable('var_xs_CRCC2').set('diff16', '1.30619000e+00[cm]');
model.variable('var_xs_CRCC2').set('diff17', '1.28010000e+00[cm]');
model.variable('var_xs_CRCC2').set('diff18', '1.17081000e+00[cm]');
model.variable('var_xs_CRCC2').set('fiss1', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('fiss2', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('fiss3', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('fiss4', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('fiss5', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('fiss6', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('fiss7', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('fiss8', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('invV1', '4.83710000e-10[s/cm]');
model.variable('var_xs_CRCC2').set('invV2', '2.09094000e-09[s/cm]');
model.variable('var_xs_CRCC2').set('invV3', '3.30817000e-08[s/cm]');
model.variable('var_xs_CRCC2').set('invV4', '2.07368000e-07[s/cm]');
model.variable('var_xs_CRCC2').set('invV5', '7.07702000e-07[s/cm]');
model.variable('var_xs_CRCC2').set('invV6', '1.37468000e-06[s/cm]');
model.variable('var_xs_CRCC2').set('invV7', '2.16711000e-06[s/cm]');
model.variable('var_xs_CRCC2').set('invV8', '4.18483000e-06[s/cm]');
model.variable('var_xs_CRCC2').set('kappa1', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC2').set('kappa2', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC2').set('kappa3', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC2').set('kappa4', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC2').set('kappa5', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC2').set('kappa6', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC2').set('kappa7', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC2').set('kappa8', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC2').set('lambdas1', '1.25435000e-02[1/s]');
model.variable('var_xs_CRCC2').set('lambdas2', '3.13212000e-02[1/s]');
model.variable('var_xs_CRCC2').set('lambdas3', '1.09688000e-01[1/s]');
model.variable('var_xs_CRCC2').set('lambdas4', '3.16554000e-01[1/s]');
model.variable('var_xs_CRCC2').set('lambdas5', '1.29420000e+00[1/s]');
model.variable('var_xs_CRCC2').set('lambdas6', '8.03336000e+00[1/s]');
model.variable('var_xs_CRCC2').set('nsf1', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('nsf2', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('nsf3', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('nsf4', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('nsf5', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('nsf6', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('nsf7', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('nsf8', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('diff21', '1.30270151e+00[cm]');
model.variable('var_xs_CRCC2').set('diff22', '7.46987152e-01[cm]');
model.variable('var_xs_CRCC2').set('diff23', '9.55296375e-01[cm]');
model.variable('var_xs_CRCC2').set('diff24', '9.66549857e-01[cm]');
model.variable('var_xs_CRCC2').set('diff25', '9.65428540e-01[cm]');
model.variable('var_xs_CRCC2').set('diff26', '9.56796391e-01[cm]');
model.variable('var_xs_CRCC2').set('diff27', '9.38785941e-01[cm]');
model.variable('var_xs_CRCC2').set('diff28', '8.60251232e-01[cm]');
model.variable('var_xs_CRCC2').set('rem1', '5.36947000e-02[1/cm]');
model.variable('var_xs_CRCC2').set('rem2', '1.49343000e-02[1/cm]');
model.variable('var_xs_CRCC2').set('rem3', '6.73287000e-03[1/cm]');
model.variable('var_xs_CRCC2').set('rem4', '1.53287000e-02[1/cm]');
model.variable('var_xs_CRCC2').set('rem5', '3.68732000e-02[1/cm]');
model.variable('var_xs_CRCC2').set('rem6', '6.16316000e-02[1/cm]');
model.variable('var_xs_CRCC2').set('rem7', '6.72706000e-02[1/cm]');
model.variable('var_xs_CRCC2').set('rem8', '1.04805000e-01[1/cm]');
model.variable('var_xs_CRCC2').set('scat11', '1.43698000e-01[1/cm]');
model.variable('var_xs_CRCC2').set('scat12', '5.21751000e-02[1/cm]');
model.variable('var_xs_CRCC2').set('scat13', '4.43506000e-05[1/cm]');
model.variable('var_xs_CRCC2').set('scat14', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat15', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat16', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat17', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat18', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat21', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat22', '3.29306000e-01[1/cm]');
model.variable('var_xs_CRCC2').set('scat23', '1.48714000e-02[1/cm]');
model.variable('var_xs_CRCC2').set('scat24', '1.14717000e-07[1/cm]');
model.variable('var_xs_CRCC2').set('scat25', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat26', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat27', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat28', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat31', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat32', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat33', '2.62443000e-01[1/cm]');
model.variable('var_xs_CRCC2').set('scat34', '6.71688000e-03[1/cm]');
model.variable('var_xs_CRCC2').set('scat35', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat36', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat37', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat38', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat41', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat42', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat43', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat44', '2.50714000e-01[1/cm]');
model.variable('var_xs_CRCC2').set('scat45', '1.52426000e-02[1/cm]');
model.variable('var_xs_CRCC2').set('scat46', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat47', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat48', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat51', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat52', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat53', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat54', '1.78292000e-04[1/cm]');
model.variable('var_xs_CRCC2').set('scat55', '2.29478000e-01[1/cm]');
model.variable('var_xs_CRCC2').set('scat56', '3.60135000e-02[1/cm]');
model.variable('var_xs_CRCC2').set('scat57', '3.77267000e-04[1/cm]');
model.variable('var_xs_CRCC2').set('scat58', '2.96011000e-06[1/cm]');
model.variable('var_xs_CRCC2').set('scat61', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat62', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat63', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat64', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat65', '7.24922000e-03[1/cm]');
model.variable('var_xs_CRCC2').set('scat66', '2.07123000e-01[1/cm]');
model.variable('var_xs_CRCC2').set('scat67', '5.27797000e-02[1/cm]');
model.variable('var_xs_CRCC2').set('scat68', '1.02928000e-03[1/cm]');
model.variable('var_xs_CRCC2').set('scat71', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat72', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat73', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat74', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat75', '4.65130000e-05[1/cm]');
model.variable('var_xs_CRCC2').set('scat76', '3.73041000e-02[1/cm]');
model.variable('var_xs_CRCC2').set('scat77', '2.06639000e-01[1/cm]');
model.variable('var_xs_CRCC2').set('scat78', '2.90183000e-02[1/cm]');
model.variable('var_xs_CRCC2').set('scat81', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat82', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat83', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat84', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC2').set('scat85', '1.33791000e-06[1/cm]');
model.variable('var_xs_CRCC2').set('scat86', '2.48058000e-03[1/cm]');
model.variable('var_xs_CRCC2').set('scat87', '1.00580000e-01[1/cm]');
model.variable('var_xs_CRCC2').set('scat88', '1.94110000e-01[1/cm]');
model.variable('var_xs_CRCC2').set('tot1', '1.97392000e-01[1/cm]');
model.variable('var_xs_CRCC2').set('tot2', '3.44240000e-01[1/cm]');
model.variable('var_xs_CRCC2').set('tot3', '2.69176000e-01[1/cm]');
model.variable('var_xs_CRCC2').set('tot4', '2.66042000e-01[1/cm]');
model.variable('var_xs_CRCC2').set('tot5', '2.66351000e-01[1/cm]');
model.variable('var_xs_CRCC2').set('tot6', '2.68754000e-01[1/cm]');
model.variable('var_xs_CRCC2').set('tot7', '2.73910000e-01[1/cm]');
model.variable('var_xs_CRCC2').set('tot8', '2.98916000e-01[1/cm]');
model.variable('var_xs_CRCC2').selection.geom('geom1', 3);
model.variable('var_xs_CRCC2').selection.set([12]);
model.variable.create('var_xs_CRCC3');
model.variable('var_xs_CRCC3').model('mod1');
model.variable('var_xs_CRCC3').set('beta1', '5.38503000e-03');
model.variable('var_xs_CRCC3').set('betas1', '1.64712000e-04');
model.variable('var_xs_CRCC3').set('betas2', '9.85399000e-04');
model.variable('var_xs_CRCC3').set('betas3', '8.56807000e-04');
model.variable('var_xs_CRCC3').set('betas4', '2.40172000e-03');
model.variable('var_xs_CRCC3').set('betas5', '7.27014000e-04');
model.variable('var_xs_CRCC3').set('betas6', '2.49379000e-04');
model.variable('var_xs_CRCC3').set('chid1', '0.00000000e+00');
model.variable('var_xs_CRCC3').set('chid2', '0.00000000e+00');
model.variable('var_xs_CRCC3').set('chid3', '0.00000000e+00');
model.variable('var_xs_CRCC3').set('chid4', '0.00000000e+00');
model.variable('var_xs_CRCC3').set('chid5', '0.00000000e+00');
model.variable('var_xs_CRCC3').set('chid6', '0.00000000e+00');
model.variable('var_xs_CRCC3').set('chid7', '0.00000000e+00');
model.variable('var_xs_CRCC3').set('chid8', '0.00000000e+00');
model.variable('var_xs_CRCC3').set('chip1', '0.00000000e+00');
model.variable('var_xs_CRCC3').set('chip2', '0.00000000e+00');
model.variable('var_xs_CRCC3').set('chip3', '0.00000000e+00');
model.variable('var_xs_CRCC3').set('chip4', '0.00000000e+00');
model.variable('var_xs_CRCC3').set('chip5', '0.00000000e+00');
model.variable('var_xs_CRCC3').set('chip6', '0.00000000e+00');
model.variable('var_xs_CRCC3').set('chip7', '0.00000000e+00');
model.variable('var_xs_CRCC3').set('chip8', '0.00000000e+00');
model.variable('var_xs_CRCC3').set('chit1', '0.00000000e+00');
model.variable('var_xs_CRCC3').set('chit2', '0.00000000e+00');
model.variable('var_xs_CRCC3').set('chit3', '0.00000000e+00');
model.variable('var_xs_CRCC3').set('chit4', '0.00000000e+00');
model.variable('var_xs_CRCC3').set('chit5', '0.00000000e+00');
model.variable('var_xs_CRCC3').set('chit6', '0.00000000e+00');
model.variable('var_xs_CRCC3').set('chit7', '0.00000000e+00');
model.variable('var_xs_CRCC3').set('chit8', '0.00000000e+00');
model.variable('var_xs_CRCC3').set('diff11', '2.21320000e+00[cm]');
model.variable('var_xs_CRCC3').set('diff12', '1.09632000e+00[cm]');
model.variable('var_xs_CRCC3').set('diff13', '1.30594000e+00[cm]');
model.variable('var_xs_CRCC3').set('diff14', '1.32082000e+00[cm]');
model.variable('var_xs_CRCC3').set('diff15', '1.31912000e+00[cm]');
model.variable('var_xs_CRCC3').set('diff16', '1.30619000e+00[cm]');
model.variable('var_xs_CRCC3').set('diff17', '1.28010000e+00[cm]');
model.variable('var_xs_CRCC3').set('diff18', '1.17081000e+00[cm]');
model.variable('var_xs_CRCC3').set('fiss1', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('fiss2', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('fiss3', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('fiss4', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('fiss5', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('fiss6', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('fiss7', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('fiss8', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('invV1', '4.83710000e-10[s/cm]');
model.variable('var_xs_CRCC3').set('invV2', '2.09094000e-09[s/cm]');
model.variable('var_xs_CRCC3').set('invV3', '3.30817000e-08[s/cm]');
model.variable('var_xs_CRCC3').set('invV4', '2.07368000e-07[s/cm]');
model.variable('var_xs_CRCC3').set('invV5', '7.07702000e-07[s/cm]');
model.variable('var_xs_CRCC3').set('invV6', '1.37468000e-06[s/cm]');
model.variable('var_xs_CRCC3').set('invV7', '2.16711000e-06[s/cm]');
model.variable('var_xs_CRCC3').set('invV8', '4.18483000e-06[s/cm]');
model.variable('var_xs_CRCC3').set('kappa1', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC3').set('kappa2', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC3').set('kappa3', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC3').set('kappa4', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC3').set('kappa5', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC3').set('kappa6', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC3').set('kappa7', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC3').set('kappa8', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC3').set('lambdas1', '1.25435000e-02[1/s]');
model.variable('var_xs_CRCC3').set('lambdas2', '3.13212000e-02[1/s]');
model.variable('var_xs_CRCC3').set('lambdas3', '1.09688000e-01[1/s]');
model.variable('var_xs_CRCC3').set('lambdas4', '3.16554000e-01[1/s]');
model.variable('var_xs_CRCC3').set('lambdas5', '1.29420000e+00[1/s]');
model.variable('var_xs_CRCC3').set('lambdas6', '8.03336000e+00[1/s]');
model.variable('var_xs_CRCC3').set('nsf1', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('nsf2', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('nsf3', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('nsf4', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('nsf5', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('nsf6', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('nsf7', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('nsf8', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('diff21', '1.30270151e+00[cm]');
model.variable('var_xs_CRCC3').set('diff22', '7.46987152e-01[cm]');
model.variable('var_xs_CRCC3').set('diff23', '9.55296375e-01[cm]');
model.variable('var_xs_CRCC3').set('diff24', '9.66549857e-01[cm]');
model.variable('var_xs_CRCC3').set('diff25', '9.65428540e-01[cm]');
model.variable('var_xs_CRCC3').set('diff26', '9.56796391e-01[cm]');
model.variable('var_xs_CRCC3').set('diff27', '9.38785941e-01[cm]');
model.variable('var_xs_CRCC3').set('diff28', '8.60251232e-01[cm]');
model.variable('var_xs_CRCC3').set('rem1', '5.36947000e-02[1/cm]');
model.variable('var_xs_CRCC3').set('rem2', '1.49343000e-02[1/cm]');
model.variable('var_xs_CRCC3').set('rem3', '6.73287000e-03[1/cm]');
model.variable('var_xs_CRCC3').set('rem4', '1.53287000e-02[1/cm]');
model.variable('var_xs_CRCC3').set('rem5', '3.68732000e-02[1/cm]');
model.variable('var_xs_CRCC3').set('rem6', '6.16316000e-02[1/cm]');
model.variable('var_xs_CRCC3').set('rem7', '6.72706000e-02[1/cm]');
model.variable('var_xs_CRCC3').set('rem8', '1.04805000e-01[1/cm]');
model.variable('var_xs_CRCC3').set('scat11', '1.43698000e-01[1/cm]');
model.variable('var_xs_CRCC3').set('scat12', '5.21751000e-02[1/cm]');
model.variable('var_xs_CRCC3').set('scat13', '4.43506000e-05[1/cm]');
model.variable('var_xs_CRCC3').set('scat14', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat15', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat16', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat17', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat18', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat21', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat22', '3.29306000e-01[1/cm]');
model.variable('var_xs_CRCC3').set('scat23', '1.48714000e-02[1/cm]');
model.variable('var_xs_CRCC3').set('scat24', '1.14717000e-07[1/cm]');
model.variable('var_xs_CRCC3').set('scat25', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat26', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat27', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat28', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat31', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat32', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat33', '2.62443000e-01[1/cm]');
model.variable('var_xs_CRCC3').set('scat34', '6.71688000e-03[1/cm]');
model.variable('var_xs_CRCC3').set('scat35', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat36', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat37', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat38', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat41', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat42', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat43', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat44', '2.50714000e-01[1/cm]');
model.variable('var_xs_CRCC3').set('scat45', '1.52426000e-02[1/cm]');
model.variable('var_xs_CRCC3').set('scat46', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat47', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat48', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat51', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat52', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat53', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat54', '1.78292000e-04[1/cm]');
model.variable('var_xs_CRCC3').set('scat55', '2.29478000e-01[1/cm]');
model.variable('var_xs_CRCC3').set('scat56', '3.60135000e-02[1/cm]');
model.variable('var_xs_CRCC3').set('scat57', '3.77267000e-04[1/cm]');
model.variable('var_xs_CRCC3').set('scat58', '2.96011000e-06[1/cm]');
model.variable('var_xs_CRCC3').set('scat61', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat62', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat63', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat64', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat65', '7.24922000e-03[1/cm]');
model.variable('var_xs_CRCC3').set('scat66', '2.07123000e-01[1/cm]');
model.variable('var_xs_CRCC3').set('scat67', '5.27797000e-02[1/cm]');
model.variable('var_xs_CRCC3').set('scat68', '1.02928000e-03[1/cm]');
model.variable('var_xs_CRCC3').set('scat71', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat72', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat73', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat74', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat75', '4.65130000e-05[1/cm]');
model.variable('var_xs_CRCC3').set('scat76', '3.73041000e-02[1/cm]');
model.variable('var_xs_CRCC3').set('scat77', '2.06639000e-01[1/cm]');
model.variable('var_xs_CRCC3').set('scat78', '2.90183000e-02[1/cm]');
model.variable('var_xs_CRCC3').set('scat81', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat82', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat83', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat84', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC3').set('scat85', '1.33791000e-06[1/cm]');
model.variable('var_xs_CRCC3').set('scat86', '2.48058000e-03[1/cm]');
model.variable('var_xs_CRCC3').set('scat87', '1.00580000e-01[1/cm]');
model.variable('var_xs_CRCC3').set('scat88', '1.94110000e-01[1/cm]');
model.variable('var_xs_CRCC3').set('tot1', '1.97392000e-01[1/cm]');
model.variable('var_xs_CRCC3').set('tot2', '3.44240000e-01[1/cm]');
model.variable('var_xs_CRCC3').set('tot3', '2.69176000e-01[1/cm]');
model.variable('var_xs_CRCC3').set('tot4', '2.66042000e-01[1/cm]');
model.variable('var_xs_CRCC3').set('tot5', '2.66351000e-01[1/cm]');
model.variable('var_xs_CRCC3').set('tot6', '2.68754000e-01[1/cm]');
model.variable('var_xs_CRCC3').set('tot7', '2.73910000e-01[1/cm]');
model.variable('var_xs_CRCC3').set('tot8', '2.98916000e-01[1/cm]');
model.variable('var_xs_CRCC3').selection.geom('geom1', 3);
model.variable('var_xs_CRCC3').selection.set([10]);
model.variable.create('var_xs_CRCC4');
model.variable('var_xs_CRCC4').model('mod1');
model.variable('var_xs_CRCC4').set('beta1', '5.38503000e-03');
model.variable('var_xs_CRCC4').set('betas1', '1.64712000e-04');
model.variable('var_xs_CRCC4').set('betas2', '9.85399000e-04');
model.variable('var_xs_CRCC4').set('betas3', '8.56807000e-04');
model.variable('var_xs_CRCC4').set('betas4', '2.40172000e-03');
model.variable('var_xs_CRCC4').set('betas5', '7.27014000e-04');
model.variable('var_xs_CRCC4').set('betas6', '2.49379000e-04');
model.variable('var_xs_CRCC4').set('chid1', '0.00000000e+00');
model.variable('var_xs_CRCC4').set('chid2', '0.00000000e+00');
model.variable('var_xs_CRCC4').set('chid3', '0.00000000e+00');
model.variable('var_xs_CRCC4').set('chid4', '0.00000000e+00');
model.variable('var_xs_CRCC4').set('chid5', '0.00000000e+00');
model.variable('var_xs_CRCC4').set('chid6', '0.00000000e+00');
model.variable('var_xs_CRCC4').set('chid7', '0.00000000e+00');
model.variable('var_xs_CRCC4').set('chid8', '0.00000000e+00');
model.variable('var_xs_CRCC4').set('chip1', '0.00000000e+00');
model.variable('var_xs_CRCC4').set('chip2', '0.00000000e+00');
model.variable('var_xs_CRCC4').set('chip3', '0.00000000e+00');
model.variable('var_xs_CRCC4').set('chip4', '0.00000000e+00');
model.variable('var_xs_CRCC4').set('chip5', '0.00000000e+00');
model.variable('var_xs_CRCC4').set('chip6', '0.00000000e+00');
model.variable('var_xs_CRCC4').set('chip7', '0.00000000e+00');
model.variable('var_xs_CRCC4').set('chip8', '0.00000000e+00');
model.variable('var_xs_CRCC4').set('chit1', '0.00000000e+00');
model.variable('var_xs_CRCC4').set('chit2', '0.00000000e+00');
model.variable('var_xs_CRCC4').set('chit3', '0.00000000e+00');
model.variable('var_xs_CRCC4').set('chit4', '0.00000000e+00');
model.variable('var_xs_CRCC4').set('chit5', '0.00000000e+00');
model.variable('var_xs_CRCC4').set('chit6', '0.00000000e+00');
model.variable('var_xs_CRCC4').set('chit7', '0.00000000e+00');
model.variable('var_xs_CRCC4').set('chit8', '0.00000000e+00');
model.variable('var_xs_CRCC4').set('diff11', '2.21320000e+00[cm]');
model.variable('var_xs_CRCC4').set('diff12', '1.09632000e+00[cm]');
model.variable('var_xs_CRCC4').set('diff13', '1.30594000e+00[cm]');
model.variable('var_xs_CRCC4').set('diff14', '1.32082000e+00[cm]');
model.variable('var_xs_CRCC4').set('diff15', '1.31912000e+00[cm]');
model.variable('var_xs_CRCC4').set('diff16', '1.30619000e+00[cm]');
model.variable('var_xs_CRCC4').set('diff17', '1.28010000e+00[cm]');
model.variable('var_xs_CRCC4').set('diff18', '1.17081000e+00[cm]');
model.variable('var_xs_CRCC4').set('fiss1', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('fiss2', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('fiss3', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('fiss4', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('fiss5', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('fiss6', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('fiss7', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('fiss8', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('invV1', '4.83710000e-10[s/cm]');
model.variable('var_xs_CRCC4').set('invV2', '2.09094000e-09[s/cm]');
model.variable('var_xs_CRCC4').set('invV3', '3.30817000e-08[s/cm]');
model.variable('var_xs_CRCC4').set('invV4', '2.07368000e-07[s/cm]');
model.variable('var_xs_CRCC4').set('invV5', '7.07702000e-07[s/cm]');
model.variable('var_xs_CRCC4').set('invV6', '1.37468000e-06[s/cm]');
model.variable('var_xs_CRCC4').set('invV7', '2.16711000e-06[s/cm]');
model.variable('var_xs_CRCC4').set('invV8', '4.18483000e-06[s/cm]');
model.variable('var_xs_CRCC4').set('kappa1', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC4').set('kappa2', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC4').set('kappa3', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC4').set('kappa4', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC4').set('kappa5', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC4').set('kappa6', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC4').set('kappa7', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC4').set('kappa8', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC4').set('lambdas1', '1.25435000e-02[1/s]');
model.variable('var_xs_CRCC4').set('lambdas2', '3.13212000e-02[1/s]');
model.variable('var_xs_CRCC4').set('lambdas3', '1.09688000e-01[1/s]');
model.variable('var_xs_CRCC4').set('lambdas4', '3.16554000e-01[1/s]');
model.variable('var_xs_CRCC4').set('lambdas5', '1.29420000e+00[1/s]');
model.variable('var_xs_CRCC4').set('lambdas6', '8.03336000e+00[1/s]');
model.variable('var_xs_CRCC4').set('nsf1', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('nsf2', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('nsf3', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('nsf4', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('nsf5', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('nsf6', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('nsf7', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('nsf8', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('diff21', '1.30270151e+00[cm]');
model.variable('var_xs_CRCC4').set('diff22', '7.46987152e-01[cm]');
model.variable('var_xs_CRCC4').set('diff23', '9.55296375e-01[cm]');
model.variable('var_xs_CRCC4').set('diff24', '9.66549857e-01[cm]');
model.variable('var_xs_CRCC4').set('diff25', '9.65428540e-01[cm]');
model.variable('var_xs_CRCC4').set('diff26', '9.56796391e-01[cm]');
model.variable('var_xs_CRCC4').set('diff27', '9.38785941e-01[cm]');
model.variable('var_xs_CRCC4').set('diff28', '8.60251232e-01[cm]');
model.variable('var_xs_CRCC4').set('rem1', '5.36947000e-02[1/cm]');
model.variable('var_xs_CRCC4').set('rem2', '1.49343000e-02[1/cm]');
model.variable('var_xs_CRCC4').set('rem3', '6.73287000e-03[1/cm]');
model.variable('var_xs_CRCC4').set('rem4', '1.53287000e-02[1/cm]');
model.variable('var_xs_CRCC4').set('rem5', '3.68732000e-02[1/cm]');
model.variable('var_xs_CRCC4').set('rem6', '6.16316000e-02[1/cm]');
model.variable('var_xs_CRCC4').set('rem7', '6.72706000e-02[1/cm]');
model.variable('var_xs_CRCC4').set('rem8', '1.04805000e-01[1/cm]');
model.variable('var_xs_CRCC4').set('scat11', '1.43698000e-01[1/cm]');
model.variable('var_xs_CRCC4').set('scat12', '5.21751000e-02[1/cm]');
model.variable('var_xs_CRCC4').set('scat13', '4.43506000e-05[1/cm]');
model.variable('var_xs_CRCC4').set('scat14', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat15', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat16', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat17', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat18', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat21', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat22', '3.29306000e-01[1/cm]');
model.variable('var_xs_CRCC4').set('scat23', '1.48714000e-02[1/cm]');
model.variable('var_xs_CRCC4').set('scat24', '1.14717000e-07[1/cm]');
model.variable('var_xs_CRCC4').set('scat25', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat26', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat27', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat28', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat31', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat32', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat33', '2.62443000e-01[1/cm]');
model.variable('var_xs_CRCC4').set('scat34', '6.71688000e-03[1/cm]');
model.variable('var_xs_CRCC4').set('scat35', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat36', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat37', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat38', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat41', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat42', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat43', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat44', '2.50714000e-01[1/cm]');
model.variable('var_xs_CRCC4').set('scat45', '1.52426000e-02[1/cm]');
model.variable('var_xs_CRCC4').set('scat46', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat47', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat48', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat51', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat52', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat53', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat54', '1.78292000e-04[1/cm]');
model.variable('var_xs_CRCC4').set('scat55', '2.29478000e-01[1/cm]');
model.variable('var_xs_CRCC4').set('scat56', '3.60135000e-02[1/cm]');
model.variable('var_xs_CRCC4').set('scat57', '3.77267000e-04[1/cm]');
model.variable('var_xs_CRCC4').set('scat58', '2.96011000e-06[1/cm]');
model.variable('var_xs_CRCC4').set('scat61', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat62', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat63', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat64', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat65', '7.24922000e-03[1/cm]');
model.variable('var_xs_CRCC4').set('scat66', '2.07123000e-01[1/cm]');
model.variable('var_xs_CRCC4').set('scat67', '5.27797000e-02[1/cm]');
model.variable('var_xs_CRCC4').set('scat68', '1.02928000e-03[1/cm]');
model.variable('var_xs_CRCC4').set('scat71', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat72', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat73', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat74', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat75', '4.65130000e-05[1/cm]');
model.variable('var_xs_CRCC4').set('scat76', '3.73041000e-02[1/cm]');
model.variable('var_xs_CRCC4').set('scat77', '2.06639000e-01[1/cm]');
model.variable('var_xs_CRCC4').set('scat78', '2.90183000e-02[1/cm]');
model.variable('var_xs_CRCC4').set('scat81', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat82', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat83', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat84', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC4').set('scat85', '1.33791000e-06[1/cm]');
model.variable('var_xs_CRCC4').set('scat86', '2.48058000e-03[1/cm]');
model.variable('var_xs_CRCC4').set('scat87', '1.00580000e-01[1/cm]');
model.variable('var_xs_CRCC4').set('scat88', '1.94110000e-01[1/cm]');
model.variable('var_xs_CRCC4').set('tot1', '1.97392000e-01[1/cm]');
model.variable('var_xs_CRCC4').set('tot2', '3.44240000e-01[1/cm]');
model.variable('var_xs_CRCC4').set('tot3', '2.69176000e-01[1/cm]');
model.variable('var_xs_CRCC4').set('tot4', '2.66042000e-01[1/cm]');
model.variable('var_xs_CRCC4').set('tot5', '2.66351000e-01[1/cm]');
model.variable('var_xs_CRCC4').set('tot6', '2.68754000e-01[1/cm]');
model.variable('var_xs_CRCC4').set('tot7', '2.73910000e-01[1/cm]');
model.variable('var_xs_CRCC4').set('tot8', '2.98916000e-01[1/cm]');
model.variable('var_xs_CRCC4').selection.geom('geom1', 3);
model.variable('var_xs_CRCC4').selection.set([9]);
model.variable.create('var_xs_CRCC5');
model.variable('var_xs_CRCC5').model('mod1');
model.variable('var_xs_CRCC5').set('beta1', '5.38503000e-03');
model.variable('var_xs_CRCC5').set('betas1', '1.64712000e-04');
model.variable('var_xs_CRCC5').set('betas2', '9.85399000e-04');
model.variable('var_xs_CRCC5').set('betas3', '8.56807000e-04');
model.variable('var_xs_CRCC5').set('betas4', '2.40172000e-03');
model.variable('var_xs_CRCC5').set('betas5', '7.27014000e-04');
model.variable('var_xs_CRCC5').set('betas6', '2.49379000e-04');
model.variable('var_xs_CRCC5').set('chid1', '0.00000000e+00');
model.variable('var_xs_CRCC5').set('chid2', '0.00000000e+00');
model.variable('var_xs_CRCC5').set('chid3', '0.00000000e+00');
model.variable('var_xs_CRCC5').set('chid4', '0.00000000e+00');
model.variable('var_xs_CRCC5').set('chid5', '0.00000000e+00');
model.variable('var_xs_CRCC5').set('chid6', '0.00000000e+00');
model.variable('var_xs_CRCC5').set('chid7', '0.00000000e+00');
model.variable('var_xs_CRCC5').set('chid8', '0.00000000e+00');
model.variable('var_xs_CRCC5').set('chip1', '0.00000000e+00');
model.variable('var_xs_CRCC5').set('chip2', '0.00000000e+00');
model.variable('var_xs_CRCC5').set('chip3', '0.00000000e+00');
model.variable('var_xs_CRCC5').set('chip4', '0.00000000e+00');
model.variable('var_xs_CRCC5').set('chip5', '0.00000000e+00');
model.variable('var_xs_CRCC5').set('chip6', '0.00000000e+00');
model.variable('var_xs_CRCC5').set('chip7', '0.00000000e+00');
model.variable('var_xs_CRCC5').set('chip8', '0.00000000e+00');
model.variable('var_xs_CRCC5').set('chit1', '0.00000000e+00');
model.variable('var_xs_CRCC5').set('chit2', '0.00000000e+00');
model.variable('var_xs_CRCC5').set('chit3', '0.00000000e+00');
model.variable('var_xs_CRCC5').set('chit4', '0.00000000e+00');
model.variable('var_xs_CRCC5').set('chit5', '0.00000000e+00');
model.variable('var_xs_CRCC5').set('chit6', '0.00000000e+00');
model.variable('var_xs_CRCC5').set('chit7', '0.00000000e+00');
model.variable('var_xs_CRCC5').set('chit8', '0.00000000e+00');
model.variable('var_xs_CRCC5').set('diff11', '2.21320000e+00[cm]');
model.variable('var_xs_CRCC5').set('diff12', '1.09632000e+00[cm]');
model.variable('var_xs_CRCC5').set('diff13', '1.30594000e+00[cm]');
model.variable('var_xs_CRCC5').set('diff14', '1.32082000e+00[cm]');
model.variable('var_xs_CRCC5').set('diff15', '1.31912000e+00[cm]');
model.variable('var_xs_CRCC5').set('diff16', '1.30619000e+00[cm]');
model.variable('var_xs_CRCC5').set('diff17', '1.28010000e+00[cm]');
model.variable('var_xs_CRCC5').set('diff18', '1.17081000e+00[cm]');
model.variable('var_xs_CRCC5').set('fiss1', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('fiss2', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('fiss3', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('fiss4', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('fiss5', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('fiss6', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('fiss7', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('fiss8', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('invV1', '4.83710000e-10[s/cm]');
model.variable('var_xs_CRCC5').set('invV2', '2.09094000e-09[s/cm]');
model.variable('var_xs_CRCC5').set('invV3', '3.30817000e-08[s/cm]');
model.variable('var_xs_CRCC5').set('invV4', '2.07368000e-07[s/cm]');
model.variable('var_xs_CRCC5').set('invV5', '7.07702000e-07[s/cm]');
model.variable('var_xs_CRCC5').set('invV6', '1.37468000e-06[s/cm]');
model.variable('var_xs_CRCC5').set('invV7', '2.16711000e-06[s/cm]');
model.variable('var_xs_CRCC5').set('invV8', '4.18483000e-06[s/cm]');
model.variable('var_xs_CRCC5').set('kappa1', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC5').set('kappa2', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC5').set('kappa3', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC5').set('kappa4', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC5').set('kappa5', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC5').set('kappa6', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC5').set('kappa7', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC5').set('kappa8', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC5').set('lambdas1', '1.25435000e-02[1/s]');
model.variable('var_xs_CRCC5').set('lambdas2', '3.13212000e-02[1/s]');
model.variable('var_xs_CRCC5').set('lambdas3', '1.09688000e-01[1/s]');
model.variable('var_xs_CRCC5').set('lambdas4', '3.16554000e-01[1/s]');
model.variable('var_xs_CRCC5').set('lambdas5', '1.29420000e+00[1/s]');
model.variable('var_xs_CRCC5').set('lambdas6', '8.03336000e+00[1/s]');
model.variable('var_xs_CRCC5').set('nsf1', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('nsf2', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('nsf3', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('nsf4', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('nsf5', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('nsf6', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('nsf7', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('nsf8', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('diff21', '1.30270151e+00[cm]');
model.variable('var_xs_CRCC5').set('diff22', '7.46987152e-01[cm]');
model.variable('var_xs_CRCC5').set('diff23', '9.55296375e-01[cm]');
model.variable('var_xs_CRCC5').set('diff24', '9.66549857e-01[cm]');
model.variable('var_xs_CRCC5').set('diff25', '9.65428540e-01[cm]');
model.variable('var_xs_CRCC5').set('diff26', '9.56796391e-01[cm]');
model.variable('var_xs_CRCC5').set('diff27', '9.38785941e-01[cm]');
model.variable('var_xs_CRCC5').set('diff28', '8.60251232e-01[cm]');
model.variable('var_xs_CRCC5').set('rem1', '5.36947000e-02[1/cm]');
model.variable('var_xs_CRCC5').set('rem2', '1.49343000e-02[1/cm]');
model.variable('var_xs_CRCC5').set('rem3', '6.73287000e-03[1/cm]');
model.variable('var_xs_CRCC5').set('rem4', '1.53287000e-02[1/cm]');
model.variable('var_xs_CRCC5').set('rem5', '3.68732000e-02[1/cm]');
model.variable('var_xs_CRCC5').set('rem6', '6.16316000e-02[1/cm]');
model.variable('var_xs_CRCC5').set('rem7', '6.72706000e-02[1/cm]');
model.variable('var_xs_CRCC5').set('rem8', '1.04805000e-01[1/cm]');
model.variable('var_xs_CRCC5').set('scat11', '1.43698000e-01[1/cm]');
model.variable('var_xs_CRCC5').set('scat12', '5.21751000e-02[1/cm]');
model.variable('var_xs_CRCC5').set('scat13', '4.43506000e-05[1/cm]');
model.variable('var_xs_CRCC5').set('scat14', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat15', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat16', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat17', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat18', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat21', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat22', '3.29306000e-01[1/cm]');
model.variable('var_xs_CRCC5').set('scat23', '1.48714000e-02[1/cm]');
model.variable('var_xs_CRCC5').set('scat24', '1.14717000e-07[1/cm]');
model.variable('var_xs_CRCC5').set('scat25', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat26', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat27', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat28', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat31', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat32', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat33', '2.62443000e-01[1/cm]');
model.variable('var_xs_CRCC5').set('scat34', '6.71688000e-03[1/cm]');
model.variable('var_xs_CRCC5').set('scat35', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat36', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat37', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat38', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat41', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat42', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat43', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat44', '2.50714000e-01[1/cm]');
model.variable('var_xs_CRCC5').set('scat45', '1.52426000e-02[1/cm]');
model.variable('var_xs_CRCC5').set('scat46', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat47', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat48', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat51', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat52', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat53', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat54', '1.78292000e-04[1/cm]');
model.variable('var_xs_CRCC5').set('scat55', '2.29478000e-01[1/cm]');
model.variable('var_xs_CRCC5').set('scat56', '3.60135000e-02[1/cm]');
model.variable('var_xs_CRCC5').set('scat57', '3.77267000e-04[1/cm]');
model.variable('var_xs_CRCC5').set('scat58', '2.96011000e-06[1/cm]');
model.variable('var_xs_CRCC5').set('scat61', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat62', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat63', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat64', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat65', '7.24922000e-03[1/cm]');
model.variable('var_xs_CRCC5').set('scat66', '2.07123000e-01[1/cm]');
model.variable('var_xs_CRCC5').set('scat67', '5.27797000e-02[1/cm]');
model.variable('var_xs_CRCC5').set('scat68', '1.02928000e-03[1/cm]');
model.variable('var_xs_CRCC5').set('scat71', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat72', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat73', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat74', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat75', '4.65130000e-05[1/cm]');
model.variable('var_xs_CRCC5').set('scat76', '3.73041000e-02[1/cm]');
model.variable('var_xs_CRCC5').set('scat77', '2.06639000e-01[1/cm]');
model.variable('var_xs_CRCC5').set('scat78', '2.90183000e-02[1/cm]');
model.variable('var_xs_CRCC5').set('scat81', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat82', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat83', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat84', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC5').set('scat85', '1.33791000e-06[1/cm]');
model.variable('var_xs_CRCC5').set('scat86', '2.48058000e-03[1/cm]');
model.variable('var_xs_CRCC5').set('scat87', '1.00580000e-01[1/cm]');
model.variable('var_xs_CRCC5').set('scat88', '1.94110000e-01[1/cm]');
model.variable('var_xs_CRCC5').set('tot1', '1.97392000e-01[1/cm]');
model.variable('var_xs_CRCC5').set('tot2', '3.44240000e-01[1/cm]');
model.variable('var_xs_CRCC5').set('tot3', '2.69176000e-01[1/cm]');
model.variable('var_xs_CRCC5').set('tot4', '2.66042000e-01[1/cm]');
model.variable('var_xs_CRCC5').set('tot5', '2.66351000e-01[1/cm]');
model.variable('var_xs_CRCC5').set('tot6', '2.68754000e-01[1/cm]');
model.variable('var_xs_CRCC5').set('tot7', '2.73910000e-01[1/cm]');
model.variable('var_xs_CRCC5').set('tot8', '2.98916000e-01[1/cm]');
model.variable('var_xs_CRCC5').selection.geom('geom1', 3);
model.variable('var_xs_CRCC5').selection.set([11]);
model.variable.create('var_xs_CRCC6');
model.variable('var_xs_CRCC6').model('mod1');
model.variable('var_xs_CRCC6').set('beta1', '5.38503000e-03');
model.variable('var_xs_CRCC6').set('betas1', '1.64712000e-04');
model.variable('var_xs_CRCC6').set('betas2', '9.85399000e-04');
model.variable('var_xs_CRCC6').set('betas3', '8.56807000e-04');
model.variable('var_xs_CRCC6').set('betas4', '2.40172000e-03');
model.variable('var_xs_CRCC6').set('betas5', '7.27014000e-04');
model.variable('var_xs_CRCC6').set('betas6', '2.49379000e-04');
model.variable('var_xs_CRCC6').set('chid1', '0.00000000e+00');
model.variable('var_xs_CRCC6').set('chid2', '0.00000000e+00');
model.variable('var_xs_CRCC6').set('chid3', '0.00000000e+00');
model.variable('var_xs_CRCC6').set('chid4', '0.00000000e+00');
model.variable('var_xs_CRCC6').set('chid5', '0.00000000e+00');
model.variable('var_xs_CRCC6').set('chid6', '0.00000000e+00');
model.variable('var_xs_CRCC6').set('chid7', '0.00000000e+00');
model.variable('var_xs_CRCC6').set('chid8', '0.00000000e+00');
model.variable('var_xs_CRCC6').set('chip1', '0.00000000e+00');
model.variable('var_xs_CRCC6').set('chip2', '0.00000000e+00');
model.variable('var_xs_CRCC6').set('chip3', '0.00000000e+00');
model.variable('var_xs_CRCC6').set('chip4', '0.00000000e+00');
model.variable('var_xs_CRCC6').set('chip5', '0.00000000e+00');
model.variable('var_xs_CRCC6').set('chip6', '0.00000000e+00');
model.variable('var_xs_CRCC6').set('chip7', '0.00000000e+00');
model.variable('var_xs_CRCC6').set('chip8', '0.00000000e+00');
model.variable('var_xs_CRCC6').set('chit1', '0.00000000e+00');
model.variable('var_xs_CRCC6').set('chit2', '0.00000000e+00');
model.variable('var_xs_CRCC6').set('chit3', '0.00000000e+00');
model.variable('var_xs_CRCC6').set('chit4', '0.00000000e+00');
model.variable('var_xs_CRCC6').set('chit5', '0.00000000e+00');
model.variable('var_xs_CRCC6').set('chit6', '0.00000000e+00');
model.variable('var_xs_CRCC6').set('chit7', '0.00000000e+00');
model.variable('var_xs_CRCC6').set('chit8', '0.00000000e+00');
model.variable('var_xs_CRCC6').set('diff11', '2.21320000e+00[cm]');
model.variable('var_xs_CRCC6').set('diff12', '1.09632000e+00[cm]');
model.variable('var_xs_CRCC6').set('diff13', '1.30594000e+00[cm]');
model.variable('var_xs_CRCC6').set('diff14', '1.32082000e+00[cm]');
model.variable('var_xs_CRCC6').set('diff15', '1.31912000e+00[cm]');
model.variable('var_xs_CRCC6').set('diff16', '1.30619000e+00[cm]');
model.variable('var_xs_CRCC6').set('diff17', '1.28010000e+00[cm]');
model.variable('var_xs_CRCC6').set('diff18', '1.17081000e+00[cm]');
model.variable('var_xs_CRCC6').set('fiss1', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('fiss2', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('fiss3', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('fiss4', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('fiss5', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('fiss6', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('fiss7', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('fiss8', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('invV1', '4.83710000e-10[s/cm]');
model.variable('var_xs_CRCC6').set('invV2', '2.09094000e-09[s/cm]');
model.variable('var_xs_CRCC6').set('invV3', '3.30817000e-08[s/cm]');
model.variable('var_xs_CRCC6').set('invV4', '2.07368000e-07[s/cm]');
model.variable('var_xs_CRCC6').set('invV5', '7.07702000e-07[s/cm]');
model.variable('var_xs_CRCC6').set('invV6', '1.37468000e-06[s/cm]');
model.variable('var_xs_CRCC6').set('invV7', '2.16711000e-06[s/cm]');
model.variable('var_xs_CRCC6').set('invV8', '4.18483000e-06[s/cm]');
model.variable('var_xs_CRCC6').set('kappa1', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC6').set('kappa2', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC6').set('kappa3', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC6').set('kappa4', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC6').set('kappa5', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC6').set('kappa6', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC6').set('kappa7', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC6').set('kappa8', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC6').set('lambdas1', '1.25435000e-02[1/s]');
model.variable('var_xs_CRCC6').set('lambdas2', '3.13212000e-02[1/s]');
model.variable('var_xs_CRCC6').set('lambdas3', '1.09688000e-01[1/s]');
model.variable('var_xs_CRCC6').set('lambdas4', '3.16554000e-01[1/s]');
model.variable('var_xs_CRCC6').set('lambdas5', '1.29420000e+00[1/s]');
model.variable('var_xs_CRCC6').set('lambdas6', '8.03336000e+00[1/s]');
model.variable('var_xs_CRCC6').set('nsf1', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('nsf2', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('nsf3', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('nsf4', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('nsf5', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('nsf6', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('nsf7', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('nsf8', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('diff21', '1.30270151e+00[cm]');
model.variable('var_xs_CRCC6').set('diff22', '7.46987152e-01[cm]');
model.variable('var_xs_CRCC6').set('diff23', '9.55296375e-01[cm]');
model.variable('var_xs_CRCC6').set('diff24', '9.66549857e-01[cm]');
model.variable('var_xs_CRCC6').set('diff25', '9.65428540e-01[cm]');
model.variable('var_xs_CRCC6').set('diff26', '9.56796391e-01[cm]');
model.variable('var_xs_CRCC6').set('diff27', '9.38785941e-01[cm]');
model.variable('var_xs_CRCC6').set('diff28', '8.60251232e-01[cm]');
model.variable('var_xs_CRCC6').set('rem1', '5.36947000e-02[1/cm]');
model.variable('var_xs_CRCC6').set('rem2', '1.49343000e-02[1/cm]');
model.variable('var_xs_CRCC6').set('rem3', '6.73287000e-03[1/cm]');
model.variable('var_xs_CRCC6').set('rem4', '1.53287000e-02[1/cm]');
model.variable('var_xs_CRCC6').set('rem5', '3.68732000e-02[1/cm]');
model.variable('var_xs_CRCC6').set('rem6', '6.16316000e-02[1/cm]');
model.variable('var_xs_CRCC6').set('rem7', '6.72706000e-02[1/cm]');
model.variable('var_xs_CRCC6').set('rem8', '1.04805000e-01[1/cm]');
model.variable('var_xs_CRCC6').set('scat11', '1.43698000e-01[1/cm]');
model.variable('var_xs_CRCC6').set('scat12', '5.21751000e-02[1/cm]');
model.variable('var_xs_CRCC6').set('scat13', '4.43506000e-05[1/cm]');
model.variable('var_xs_CRCC6').set('scat14', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat15', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat16', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat17', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat18', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat21', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat22', '3.29306000e-01[1/cm]');
model.variable('var_xs_CRCC6').set('scat23', '1.48714000e-02[1/cm]');
model.variable('var_xs_CRCC6').set('scat24', '1.14717000e-07[1/cm]');
model.variable('var_xs_CRCC6').set('scat25', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat26', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat27', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat28', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat31', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat32', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat33', '2.62443000e-01[1/cm]');
model.variable('var_xs_CRCC6').set('scat34', '6.71688000e-03[1/cm]');
model.variable('var_xs_CRCC6').set('scat35', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat36', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat37', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat38', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat41', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat42', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat43', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat44', '2.50714000e-01[1/cm]');
model.variable('var_xs_CRCC6').set('scat45', '1.52426000e-02[1/cm]');
model.variable('var_xs_CRCC6').set('scat46', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat47', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat48', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat51', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat52', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat53', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat54', '1.78292000e-04[1/cm]');
model.variable('var_xs_CRCC6').set('scat55', '2.29478000e-01[1/cm]');
model.variable('var_xs_CRCC6').set('scat56', '3.60135000e-02[1/cm]');
model.variable('var_xs_CRCC6').set('scat57', '3.77267000e-04[1/cm]');
model.variable('var_xs_CRCC6').set('scat58', '2.96011000e-06[1/cm]');
model.variable('var_xs_CRCC6').set('scat61', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat62', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat63', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat64', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat65', '7.24922000e-03[1/cm]');
model.variable('var_xs_CRCC6').set('scat66', '2.07123000e-01[1/cm]');
model.variable('var_xs_CRCC6').set('scat67', '5.27797000e-02[1/cm]');
model.variable('var_xs_CRCC6').set('scat68', '1.02928000e-03[1/cm]');
model.variable('var_xs_CRCC6').set('scat71', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat72', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat73', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat74', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat75', '4.65130000e-05[1/cm]');
model.variable('var_xs_CRCC6').set('scat76', '3.73041000e-02[1/cm]');
model.variable('var_xs_CRCC6').set('scat77', '2.06639000e-01[1/cm]');
model.variable('var_xs_CRCC6').set('scat78', '2.90183000e-02[1/cm]');
model.variable('var_xs_CRCC6').set('scat81', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat82', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat83', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat84', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC6').set('scat85', '1.33791000e-06[1/cm]');
model.variable('var_xs_CRCC6').set('scat86', '2.48058000e-03[1/cm]');
model.variable('var_xs_CRCC6').set('scat87', '1.00580000e-01[1/cm]');
model.variable('var_xs_CRCC6').set('scat88', '1.94110000e-01[1/cm]');
model.variable('var_xs_CRCC6').set('tot1', '1.97392000e-01[1/cm]');
model.variable('var_xs_CRCC6').set('tot2', '3.44240000e-01[1/cm]');
model.variable('var_xs_CRCC6').set('tot3', '2.69176000e-01[1/cm]');
model.variable('var_xs_CRCC6').set('tot4', '2.66042000e-01[1/cm]');
model.variable('var_xs_CRCC6').set('tot5', '2.66351000e-01[1/cm]');
model.variable('var_xs_CRCC6').set('tot6', '2.68754000e-01[1/cm]');
model.variable('var_xs_CRCC6').set('tot7', '2.73910000e-01[1/cm]');
model.variable('var_xs_CRCC6').set('tot8', '2.98916000e-01[1/cm]');
model.variable('var_xs_CRCC6').selection.geom('geom1', 3);
model.variable('var_xs_CRCC6').selection.set([13]);
model.variable.create('var_xs_CRCC7');
model.variable('var_xs_CRCC7').model('mod1');
model.variable('var_xs_CRCC7').set('beta1', '5.38503000e-03');
model.variable('var_xs_CRCC7').set('betas1', '1.64712000e-04');
model.variable('var_xs_CRCC7').set('betas2', '9.85399000e-04');
model.variable('var_xs_CRCC7').set('betas3', '8.56807000e-04');
model.variable('var_xs_CRCC7').set('betas4', '2.40172000e-03');
model.variable('var_xs_CRCC7').set('betas5', '7.27014000e-04');
model.variable('var_xs_CRCC7').set('betas6', '2.49379000e-04');
model.variable('var_xs_CRCC7').set('chid1', '0.00000000e+00');
model.variable('var_xs_CRCC7').set('chid2', '0.00000000e+00');
model.variable('var_xs_CRCC7').set('chid3', '0.00000000e+00');
model.variable('var_xs_CRCC7').set('chid4', '0.00000000e+00');
model.variable('var_xs_CRCC7').set('chid5', '0.00000000e+00');
model.variable('var_xs_CRCC7').set('chid6', '0.00000000e+00');
model.variable('var_xs_CRCC7').set('chid7', '0.00000000e+00');
model.variable('var_xs_CRCC7').set('chid8', '0.00000000e+00');
model.variable('var_xs_CRCC7').set('chip1', '0.00000000e+00');
model.variable('var_xs_CRCC7').set('chip2', '0.00000000e+00');
model.variable('var_xs_CRCC7').set('chip3', '0.00000000e+00');
model.variable('var_xs_CRCC7').set('chip4', '0.00000000e+00');
model.variable('var_xs_CRCC7').set('chip5', '0.00000000e+00');
model.variable('var_xs_CRCC7').set('chip6', '0.00000000e+00');
model.variable('var_xs_CRCC7').set('chip7', '0.00000000e+00');
model.variable('var_xs_CRCC7').set('chip8', '0.00000000e+00');
model.variable('var_xs_CRCC7').set('chit1', '0.00000000e+00');
model.variable('var_xs_CRCC7').set('chit2', '0.00000000e+00');
model.variable('var_xs_CRCC7').set('chit3', '0.00000000e+00');
model.variable('var_xs_CRCC7').set('chit4', '0.00000000e+00');
model.variable('var_xs_CRCC7').set('chit5', '0.00000000e+00');
model.variable('var_xs_CRCC7').set('chit6', '0.00000000e+00');
model.variable('var_xs_CRCC7').set('chit7', '0.00000000e+00');
model.variable('var_xs_CRCC7').set('chit8', '0.00000000e+00');
model.variable('var_xs_CRCC7').set('diff11', '2.21320000e+00[cm]');
model.variable('var_xs_CRCC7').set('diff12', '1.09632000e+00[cm]');
model.variable('var_xs_CRCC7').set('diff13', '1.30594000e+00[cm]');
model.variable('var_xs_CRCC7').set('diff14', '1.32082000e+00[cm]');
model.variable('var_xs_CRCC7').set('diff15', '1.31912000e+00[cm]');
model.variable('var_xs_CRCC7').set('diff16', '1.30619000e+00[cm]');
model.variable('var_xs_CRCC7').set('diff17', '1.28010000e+00[cm]');
model.variable('var_xs_CRCC7').set('diff18', '1.17081000e+00[cm]');
model.variable('var_xs_CRCC7').set('fiss1', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('fiss2', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('fiss3', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('fiss4', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('fiss5', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('fiss6', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('fiss7', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('fiss8', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('invV1', '4.83710000e-10[s/cm]');
model.variable('var_xs_CRCC7').set('invV2', '2.09094000e-09[s/cm]');
model.variable('var_xs_CRCC7').set('invV3', '3.30817000e-08[s/cm]');
model.variable('var_xs_CRCC7').set('invV4', '2.07368000e-07[s/cm]');
model.variable('var_xs_CRCC7').set('invV5', '7.07702000e-07[s/cm]');
model.variable('var_xs_CRCC7').set('invV6', '1.37468000e-06[s/cm]');
model.variable('var_xs_CRCC7').set('invV7', '2.16711000e-06[s/cm]');
model.variable('var_xs_CRCC7').set('invV8', '4.18483000e-06[s/cm]');
model.variable('var_xs_CRCC7').set('kappa1', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC7').set('kappa2', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC7').set('kappa3', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC7').set('kappa4', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC7').set('kappa5', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC7').set('kappa6', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC7').set('kappa7', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC7').set('kappa8', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC7').set('lambdas1', '1.25435000e-02[1/s]');
model.variable('var_xs_CRCC7').set('lambdas2', '3.13212000e-02[1/s]');
model.variable('var_xs_CRCC7').set('lambdas3', '1.09688000e-01[1/s]');
model.variable('var_xs_CRCC7').set('lambdas4', '3.16554000e-01[1/s]');
model.variable('var_xs_CRCC7').set('lambdas5', '1.29420000e+00[1/s]');
model.variable('var_xs_CRCC7').set('lambdas6', '8.03336000e+00[1/s]');
model.variable('var_xs_CRCC7').set('nsf1', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('nsf2', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('nsf3', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('nsf4', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('nsf5', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('nsf6', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('nsf7', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('nsf8', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('diff21', '1.30270151e+00[cm]');
model.variable('var_xs_CRCC7').set('diff22', '7.46987152e-01[cm]');
model.variable('var_xs_CRCC7').set('diff23', '9.55296375e-01[cm]');
model.variable('var_xs_CRCC7').set('diff24', '9.66549857e-01[cm]');
model.variable('var_xs_CRCC7').set('diff25', '9.65428540e-01[cm]');
model.variable('var_xs_CRCC7').set('diff26', '9.56796391e-01[cm]');
model.variable('var_xs_CRCC7').set('diff27', '9.38785941e-01[cm]');
model.variable('var_xs_CRCC7').set('diff28', '8.60251232e-01[cm]');
model.variable('var_xs_CRCC7').set('rem1', '5.36947000e-02[1/cm]');
model.variable('var_xs_CRCC7').set('rem2', '1.49343000e-02[1/cm]');
model.variable('var_xs_CRCC7').set('rem3', '6.73287000e-03[1/cm]');
model.variable('var_xs_CRCC7').set('rem4', '1.53287000e-02[1/cm]');
model.variable('var_xs_CRCC7').set('rem5', '3.68732000e-02[1/cm]');
model.variable('var_xs_CRCC7').set('rem6', '6.16316000e-02[1/cm]');
model.variable('var_xs_CRCC7').set('rem7', '6.72706000e-02[1/cm]');
model.variable('var_xs_CRCC7').set('rem8', '1.04805000e-01[1/cm]');
model.variable('var_xs_CRCC7').set('scat11', '1.43698000e-01[1/cm]');
model.variable('var_xs_CRCC7').set('scat12', '5.21751000e-02[1/cm]');
model.variable('var_xs_CRCC7').set('scat13', '4.43506000e-05[1/cm]');
model.variable('var_xs_CRCC7').set('scat14', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat15', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat16', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat17', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat18', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat21', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat22', '3.29306000e-01[1/cm]');
model.variable('var_xs_CRCC7').set('scat23', '1.48714000e-02[1/cm]');
model.variable('var_xs_CRCC7').set('scat24', '1.14717000e-07[1/cm]');
model.variable('var_xs_CRCC7').set('scat25', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat26', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat27', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat28', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat31', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat32', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat33', '2.62443000e-01[1/cm]');
model.variable('var_xs_CRCC7').set('scat34', '6.71688000e-03[1/cm]');
model.variable('var_xs_CRCC7').set('scat35', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat36', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat37', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat38', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat41', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat42', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat43', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat44', '2.50714000e-01[1/cm]');
model.variable('var_xs_CRCC7').set('scat45', '1.52426000e-02[1/cm]');
model.variable('var_xs_CRCC7').set('scat46', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat47', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat48', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat51', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat52', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat53', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat54', '1.78292000e-04[1/cm]');
model.variable('var_xs_CRCC7').set('scat55', '2.29478000e-01[1/cm]');
model.variable('var_xs_CRCC7').set('scat56', '3.60135000e-02[1/cm]');
model.variable('var_xs_CRCC7').set('scat57', '3.77267000e-04[1/cm]');
model.variable('var_xs_CRCC7').set('scat58', '2.96011000e-06[1/cm]');
model.variable('var_xs_CRCC7').set('scat61', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat62', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat63', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat64', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat65', '7.24922000e-03[1/cm]');
model.variable('var_xs_CRCC7').set('scat66', '2.07123000e-01[1/cm]');
model.variable('var_xs_CRCC7').set('scat67', '5.27797000e-02[1/cm]');
model.variable('var_xs_CRCC7').set('scat68', '1.02928000e-03[1/cm]');
model.variable('var_xs_CRCC7').set('scat71', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat72', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat73', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat74', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat75', '4.65130000e-05[1/cm]');
model.variable('var_xs_CRCC7').set('scat76', '3.73041000e-02[1/cm]');
model.variable('var_xs_CRCC7').set('scat77', '2.06639000e-01[1/cm]');
model.variable('var_xs_CRCC7').set('scat78', '2.90183000e-02[1/cm]');
model.variable('var_xs_CRCC7').set('scat81', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat82', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat83', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat84', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC7').set('scat85', '1.33791000e-06[1/cm]');
model.variable('var_xs_CRCC7').set('scat86', '2.48058000e-03[1/cm]');
model.variable('var_xs_CRCC7').set('scat87', '1.00580000e-01[1/cm]');
model.variable('var_xs_CRCC7').set('scat88', '1.94110000e-01[1/cm]');
model.variable('var_xs_CRCC7').set('tot1', '1.97392000e-01[1/cm]');
model.variable('var_xs_CRCC7').set('tot2', '3.44240000e-01[1/cm]');
model.variable('var_xs_CRCC7').set('tot3', '2.69176000e-01[1/cm]');
model.variable('var_xs_CRCC7').set('tot4', '2.66042000e-01[1/cm]');
model.variable('var_xs_CRCC7').set('tot5', '2.66351000e-01[1/cm]');
model.variable('var_xs_CRCC7').set('tot6', '2.68754000e-01[1/cm]');
model.variable('var_xs_CRCC7').set('tot7', '2.73910000e-01[1/cm]');
model.variable('var_xs_CRCC7').set('tot8', '2.98916000e-01[1/cm]');
model.variable('var_xs_CRCC7').selection.geom('geom1', 3);
model.variable('var_xs_CRCC7').selection.set([15]);
model.variable.create('var_xs_CRCC8_1');
model.variable('var_xs_CRCC8_1').model('mod1');
model.variable('var_xs_CRCC8_1').set('beta1', '5.38503000e-03');
model.variable('var_xs_CRCC8_1').set('betas1', '1.64712000e-04');
model.variable('var_xs_CRCC8_1').set('betas2', '9.85399000e-04');
model.variable('var_xs_CRCC8_1').set('betas3', '8.56807000e-04');
model.variable('var_xs_CRCC8_1').set('betas4', '2.40172000e-03');
model.variable('var_xs_CRCC8_1').set('betas5', '7.27014000e-04');
model.variable('var_xs_CRCC8_1').set('betas6', '2.49379000e-04');
model.variable('var_xs_CRCC8_1').set('chid1', '0.00000000e+00');
model.variable('var_xs_CRCC8_1').set('chid2', '0.00000000e+00');
model.variable('var_xs_CRCC8_1').set('chid3', '0.00000000e+00');
model.variable('var_xs_CRCC8_1').set('chid4', '0.00000000e+00');
model.variable('var_xs_CRCC8_1').set('chid5', '0.00000000e+00');
model.variable('var_xs_CRCC8_1').set('chid6', '0.00000000e+00');
model.variable('var_xs_CRCC8_1').set('chid7', '0.00000000e+00');
model.variable('var_xs_CRCC8_1').set('chid8', '0.00000000e+00');
model.variable('var_xs_CRCC8_1').set('chip1', '0.00000000e+00');
model.variable('var_xs_CRCC8_1').set('chip2', '0.00000000e+00');
model.variable('var_xs_CRCC8_1').set('chip3', '0.00000000e+00');
model.variable('var_xs_CRCC8_1').set('chip4', '0.00000000e+00');
model.variable('var_xs_CRCC8_1').set('chip5', '0.00000000e+00');
model.variable('var_xs_CRCC8_1').set('chip6', '0.00000000e+00');
model.variable('var_xs_CRCC8_1').set('chip7', '0.00000000e+00');
model.variable('var_xs_CRCC8_1').set('chip8', '0.00000000e+00');
model.variable('var_xs_CRCC8_1').set('chit1', '0.00000000e+00');
model.variable('var_xs_CRCC8_1').set('chit2', '0.00000000e+00');
model.variable('var_xs_CRCC8_1').set('chit3', '0.00000000e+00');
model.variable('var_xs_CRCC8_1').set('chit4', '0.00000000e+00');
model.variable('var_xs_CRCC8_1').set('chit5', '0.00000000e+00');
model.variable('var_xs_CRCC8_1').set('chit6', '0.00000000e+00');
model.variable('var_xs_CRCC8_1').set('chit7', '0.00000000e+00');
model.variable('var_xs_CRCC8_1').set('chit8', '0.00000000e+00');
model.variable('var_xs_CRCC8_1').set('diff11', '2.21320000e+00[cm]');
model.variable('var_xs_CRCC8_1').set('diff12', '1.09632000e+00[cm]');
model.variable('var_xs_CRCC8_1').set('diff13', '1.30594000e+00[cm]');
model.variable('var_xs_CRCC8_1').set('diff14', '1.32082000e+00[cm]');
model.variable('var_xs_CRCC8_1').set('diff15', '1.31912000e+00[cm]');
model.variable('var_xs_CRCC8_1').set('diff16', '1.30619000e+00[cm]');
model.variable('var_xs_CRCC8_1').set('diff17', '1.28010000e+00[cm]');
model.variable('var_xs_CRCC8_1').set('diff18', '1.17081000e+00[cm]');
model.variable('var_xs_CRCC8_1').set('fiss1', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('fiss2', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('fiss3', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('fiss4', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('fiss5', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('fiss6', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('fiss7', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('fiss8', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('invV1', '4.83710000e-10[s/cm]');
model.variable('var_xs_CRCC8_1').set('invV2', '2.09094000e-09[s/cm]');
model.variable('var_xs_CRCC8_1').set('invV3', '3.30817000e-08[s/cm]');
model.variable('var_xs_CRCC8_1').set('invV4', '2.07368000e-07[s/cm]');
model.variable('var_xs_CRCC8_1').set('invV5', '7.07702000e-07[s/cm]');
model.variable('var_xs_CRCC8_1').set('invV6', '1.37468000e-06[s/cm]');
model.variable('var_xs_CRCC8_1').set('invV7', '2.16711000e-06[s/cm]');
model.variable('var_xs_CRCC8_1').set('invV8', '4.18483000e-06[s/cm]');
model.variable('var_xs_CRCC8_1').set('kappa1', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC8_1').set('kappa2', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC8_1').set('kappa3', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC8_1').set('kappa4', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC8_1').set('kappa5', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC8_1').set('kappa6', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC8_1').set('kappa7', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC8_1').set('kappa8', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC8_1').set('lambdas1', '1.25435000e-02[1/s]');
model.variable('var_xs_CRCC8_1').set('lambdas2', '3.13212000e-02[1/s]');
model.variable('var_xs_CRCC8_1').set('lambdas3', '1.09688000e-01[1/s]');
model.variable('var_xs_CRCC8_1').set('lambdas4', '3.16554000e-01[1/s]');
model.variable('var_xs_CRCC8_1').set('lambdas5', '1.29420000e+00[1/s]');
model.variable('var_xs_CRCC8_1').set('lambdas6', '8.03336000e+00[1/s]');
model.variable('var_xs_CRCC8_1').set('nsf1', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('nsf2', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('nsf3', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('nsf4', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('nsf5', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('nsf6', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('nsf7', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('nsf8', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('diff21', '1.30270151e+00[cm]');
model.variable('var_xs_CRCC8_1').set('diff22', '7.46987152e-01[cm]');
model.variable('var_xs_CRCC8_1').set('diff23', '9.55296375e-01[cm]');
model.variable('var_xs_CRCC8_1').set('diff24', '9.66549857e-01[cm]');
model.variable('var_xs_CRCC8_1').set('diff25', '9.65428540e-01[cm]');
model.variable('var_xs_CRCC8_1').set('diff26', '9.56796391e-01[cm]');
model.variable('var_xs_CRCC8_1').set('diff27', '9.38785941e-01[cm]');
model.variable('var_xs_CRCC8_1').set('diff28', '8.60251232e-01[cm]');
model.variable('var_xs_CRCC8_1').set('rem1', '5.36947000e-02[1/cm]');
model.variable('var_xs_CRCC8_1').set('rem2', '1.49343000e-02[1/cm]');
model.variable('var_xs_CRCC8_1').set('rem3', '6.73287000e-03[1/cm]');
model.variable('var_xs_CRCC8_1').set('rem4', '1.53287000e-02[1/cm]');
model.variable('var_xs_CRCC8_1').set('rem5', '3.68732000e-02[1/cm]');
model.variable('var_xs_CRCC8_1').set('rem6', '6.16316000e-02[1/cm]');
model.variable('var_xs_CRCC8_1').set('rem7', '6.72706000e-02[1/cm]');
model.variable('var_xs_CRCC8_1').set('rem8', '1.04805000e-01[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat11', '1.43698000e-01[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat12', '5.21751000e-02[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat13', '4.43506000e-05[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat14', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat15', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat16', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat17', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat18', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat21', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat22', '3.29306000e-01[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat23', '1.48714000e-02[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat24', '1.14717000e-07[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat25', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat26', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat27', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat28', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat31', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat32', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat33', '2.62443000e-01[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat34', '6.71688000e-03[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat35', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat36', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat37', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat38', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat41', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat42', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat43', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat44', '2.50714000e-01[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat45', '1.52426000e-02[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat46', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat47', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat48', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat51', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat52', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat53', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat54', '1.78292000e-04[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat55', '2.29478000e-01[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat56', '3.60135000e-02[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat57', '3.77267000e-04[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat58', '2.96011000e-06[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat61', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat62', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat63', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat64', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat65', '7.24922000e-03[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat66', '2.07123000e-01[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat67', '5.27797000e-02[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat68', '1.02928000e-03[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat71', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat72', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat73', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat74', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat75', '4.65130000e-05[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat76', '3.73041000e-02[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat77', '2.06639000e-01[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat78', '2.90183000e-02[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat81', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat82', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat83', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat84', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat85', '1.33791000e-06[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat86', '2.48058000e-03[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat87', '1.00580000e-01[1/cm]');
model.variable('var_xs_CRCC8_1').set('scat88', '1.94110000e-01[1/cm]');
model.variable('var_xs_CRCC8_1').set('tot1', '1.97392000e-01[1/cm]');
model.variable('var_xs_CRCC8_1').set('tot2', '3.44240000e-01[1/cm]');
model.variable('var_xs_CRCC8_1').set('tot3', '2.69176000e-01[1/cm]');
model.variable('var_xs_CRCC8_1').set('tot4', '2.66042000e-01[1/cm]');
model.variable('var_xs_CRCC8_1').set('tot5', '2.66351000e-01[1/cm]');
model.variable('var_xs_CRCC8_1').set('tot6', '2.68754000e-01[1/cm]');
model.variable('var_xs_CRCC8_1').set('tot7', '2.73910000e-01[1/cm]');
model.variable('var_xs_CRCC8_1').set('tot8', '2.98916000e-01[1/cm]');
model.variable('var_xs_CRCC8_1').selection.geom('geom1', 3);
model.variable('var_xs_CRCC8_1').selection.set([17]);
model.variable.create('var_xs_CRCC8_2');
model.variable('var_xs_CRCC8_2').model('mod1');
model.variable('var_xs_CRCC8_2').set('beta1', '5.38503000e-03');
model.variable('var_xs_CRCC8_2').set('betas1', '1.64712000e-04');
model.variable('var_xs_CRCC8_2').set('betas2', '9.85399000e-04');
model.variable('var_xs_CRCC8_2').set('betas3', '8.56807000e-04');
model.variable('var_xs_CRCC8_2').set('betas4', '2.40172000e-03');
model.variable('var_xs_CRCC8_2').set('betas5', '7.27014000e-04');
model.variable('var_xs_CRCC8_2').set('betas6', '2.49379000e-04');
model.variable('var_xs_CRCC8_2').set('chid1', '0.00000000e+00');
model.variable('var_xs_CRCC8_2').set('chid2', '0.00000000e+00');
model.variable('var_xs_CRCC8_2').set('chid3', '0.00000000e+00');
model.variable('var_xs_CRCC8_2').set('chid4', '0.00000000e+00');
model.variable('var_xs_CRCC8_2').set('chid5', '0.00000000e+00');
model.variable('var_xs_CRCC8_2').set('chid6', '0.00000000e+00');
model.variable('var_xs_CRCC8_2').set('chid7', '0.00000000e+00');
model.variable('var_xs_CRCC8_2').set('chid8', '0.00000000e+00');
model.variable('var_xs_CRCC8_2').set('chip1', '0.00000000e+00');
model.variable('var_xs_CRCC8_2').set('chip2', '0.00000000e+00');
model.variable('var_xs_CRCC8_2').set('chip3', '0.00000000e+00');
model.variable('var_xs_CRCC8_2').set('chip4', '0.00000000e+00');
model.variable('var_xs_CRCC8_2').set('chip5', '0.00000000e+00');
model.variable('var_xs_CRCC8_2').set('chip6', '0.00000000e+00');
model.variable('var_xs_CRCC8_2').set('chip7', '0.00000000e+00');
model.variable('var_xs_CRCC8_2').set('chip8', '0.00000000e+00');
model.variable('var_xs_CRCC8_2').set('chit1', '0.00000000e+00');
model.variable('var_xs_CRCC8_2').set('chit2', '0.00000000e+00');
model.variable('var_xs_CRCC8_2').set('chit3', '0.00000000e+00');
model.variable('var_xs_CRCC8_2').set('chit4', '0.00000000e+00');
model.variable('var_xs_CRCC8_2').set('chit5', '0.00000000e+00');
model.variable('var_xs_CRCC8_2').set('chit6', '0.00000000e+00');
model.variable('var_xs_CRCC8_2').set('chit7', '0.00000000e+00');
model.variable('var_xs_CRCC8_2').set('chit8', '0.00000000e+00');
model.variable('var_xs_CRCC8_2').set('diff11', '2.21320000e+00[cm]');
model.variable('var_xs_CRCC8_2').set('diff12', '1.09632000e+00[cm]');
model.variable('var_xs_CRCC8_2').set('diff13', '1.30594000e+00[cm]');
model.variable('var_xs_CRCC8_2').set('diff14', '1.32082000e+00[cm]');
model.variable('var_xs_CRCC8_2').set('diff15', '1.31912000e+00[cm]');
model.variable('var_xs_CRCC8_2').set('diff16', '1.30619000e+00[cm]');
model.variable('var_xs_CRCC8_2').set('diff17', '1.28010000e+00[cm]');
model.variable('var_xs_CRCC8_2').set('diff18', '1.17081000e+00[cm]');
model.variable('var_xs_CRCC8_2').set('fiss1', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('fiss2', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('fiss3', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('fiss4', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('fiss5', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('fiss6', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('fiss7', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('fiss8', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('invV1', '4.83710000e-10[s/cm]');
model.variable('var_xs_CRCC8_2').set('invV2', '2.09094000e-09[s/cm]');
model.variable('var_xs_CRCC8_2').set('invV3', '3.30817000e-08[s/cm]');
model.variable('var_xs_CRCC8_2').set('invV4', '2.07368000e-07[s/cm]');
model.variable('var_xs_CRCC8_2').set('invV5', '7.07702000e-07[s/cm]');
model.variable('var_xs_CRCC8_2').set('invV6', '1.37468000e-06[s/cm]');
model.variable('var_xs_CRCC8_2').set('invV7', '2.16711000e-06[s/cm]');
model.variable('var_xs_CRCC8_2').set('invV8', '4.18483000e-06[s/cm]');
model.variable('var_xs_CRCC8_2').set('kappa1', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC8_2').set('kappa2', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC8_2').set('kappa3', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC8_2').set('kappa4', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC8_2').set('kappa5', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC8_2').set('kappa6', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC8_2').set('kappa7', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC8_2').set('kappa8', '0.00000000e+00[MeV]');
model.variable('var_xs_CRCC8_2').set('lambdas1', '1.25435000e-02[1/s]');
model.variable('var_xs_CRCC8_2').set('lambdas2', '3.13212000e-02[1/s]');
model.variable('var_xs_CRCC8_2').set('lambdas3', '1.09688000e-01[1/s]');
model.variable('var_xs_CRCC8_2').set('lambdas4', '3.16554000e-01[1/s]');
model.variable('var_xs_CRCC8_2').set('lambdas5', '1.29420000e+00[1/s]');
model.variable('var_xs_CRCC8_2').set('lambdas6', '8.03336000e+00[1/s]');
model.variable('var_xs_CRCC8_2').set('nsf1', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('nsf2', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('nsf3', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('nsf4', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('nsf5', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('nsf6', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('nsf7', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('nsf8', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('diff21', '1.30270151e+00[cm]');
model.variable('var_xs_CRCC8_2').set('diff22', '7.46987152e-01[cm]');
model.variable('var_xs_CRCC8_2').set('diff23', '9.55296375e-01[cm]');
model.variable('var_xs_CRCC8_2').set('diff24', '9.66549857e-01[cm]');
model.variable('var_xs_CRCC8_2').set('diff25', '9.65428540e-01[cm]');
model.variable('var_xs_CRCC8_2').set('diff26', '9.56796391e-01[cm]');
model.variable('var_xs_CRCC8_2').set('diff27', '9.38785941e-01[cm]');
model.variable('var_xs_CRCC8_2').set('diff28', '8.60251232e-01[cm]');
model.variable('var_xs_CRCC8_2').set('rem1', '5.36947000e-02[1/cm]');
model.variable('var_xs_CRCC8_2').set('rem2', '1.49343000e-02[1/cm]');
model.variable('var_xs_CRCC8_2').set('rem3', '6.73287000e-03[1/cm]');
model.variable('var_xs_CRCC8_2').set('rem4', '1.53287000e-02[1/cm]');
model.variable('var_xs_CRCC8_2').set('rem5', '3.68732000e-02[1/cm]');
model.variable('var_xs_CRCC8_2').set('rem6', '6.16316000e-02[1/cm]');
model.variable('var_xs_CRCC8_2').set('rem7', '6.72706000e-02[1/cm]');
model.variable('var_xs_CRCC8_2').set('rem8', '1.04805000e-01[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat11', '1.43698000e-01[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat12', '5.21751000e-02[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat13', '4.43506000e-05[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat14', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat15', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat16', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat17', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat18', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat21', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat22', '3.29306000e-01[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat23', '1.48714000e-02[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat24', '1.14717000e-07[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat25', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat26', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat27', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat28', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat31', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat32', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat33', '2.62443000e-01[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat34', '6.71688000e-03[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat35', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat36', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat37', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat38', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat41', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat42', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat43', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat44', '2.50714000e-01[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat45', '1.52426000e-02[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat46', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat47', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat48', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat51', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat52', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat53', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat54', '1.78292000e-04[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat55', '2.29478000e-01[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat56', '3.60135000e-02[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat57', '3.77267000e-04[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat58', '2.96011000e-06[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat61', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat62', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat63', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat64', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat65', '7.24922000e-03[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat66', '2.07123000e-01[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat67', '5.27797000e-02[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat68', '1.02928000e-03[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat71', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat72', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat73', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat74', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat75', '4.65130000e-05[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat76', '3.73041000e-02[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat77', '2.06639000e-01[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat78', '2.90183000e-02[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat81', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat82', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat83', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat84', '0.00000000e+00[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat85', '1.33791000e-06[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat86', '2.48058000e-03[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat87', '1.00580000e-01[1/cm]');
model.variable('var_xs_CRCC8_2').set('scat88', '1.94110000e-01[1/cm]');
model.variable('var_xs_CRCC8_2').set('tot1', '1.97392000e-01[1/cm]');
model.variable('var_xs_CRCC8_2').set('tot2', '3.44240000e-01[1/cm]');
model.variable('var_xs_CRCC8_2').set('tot3', '2.69176000e-01[1/cm]');
model.variable('var_xs_CRCC8_2').set('tot4', '2.66042000e-01[1/cm]');
model.variable('var_xs_CRCC8_2').set('tot5', '2.66351000e-01[1/cm]');
model.variable('var_xs_CRCC8_2').set('tot6', '2.68754000e-01[1/cm]');
model.variable('var_xs_CRCC8_2').set('tot7', '2.73910000e-01[1/cm]');
model.variable('var_xs_CRCC8_2').set('tot8', '2.98916000e-01[1/cm]');
model.variable('var_xs_CRCC8_2').selection.geom('geom1', 3);
model.variable('var_xs_CRCC8_2').selection.set([16]);
model.variable.create('var_xs_fuel');
model.variable('var_xs_fuel').model('mod1');
model.variable('var_xs_fuel').set('beta1', '5.38503000e-03');
model.variable('var_xs_fuel').set('betas1', '1.64712000e-04');
model.variable('var_xs_fuel').set('betas2', '9.85399000e-04');
model.variable('var_xs_fuel').set('betas3', '8.56807000e-04');
model.variable('var_xs_fuel').set('betas4', '2.40172000e-03');
model.variable('var_xs_fuel').set('betas5', '7.27014000e-04');
model.variable('var_xs_fuel').set('betas6', '2.49379000e-04');
model.variable('var_xs_fuel').set('chid1', '3.69684000e-02');
model.variable('var_xs_fuel').set('chid2', '9.40452000e-01');
model.variable('var_xs_fuel').set('chid3', '2.25463000e-02');
model.variable('var_xs_fuel').set('chid4', '2.56709000e-05');
model.variable('var_xs_fuel').set('chid5', '3.70360000e-06');
model.variable('var_xs_fuel').set('chid6', '3.63444000e-06');
model.variable('var_xs_fuel').set('chid7', '0.00000000e+00');
model.variable('var_xs_fuel').set('chid8', '0.00000000e+00');
model.variable('var_xs_fuel').set('chip1', '5.76119000e-01');
model.variable('var_xs_fuel').set('chip2', '4.22335000e-01');
model.variable('var_xs_fuel').set('chip3', '1.54535000e-03');
model.variable('var_xs_fuel').set('chip4', '1.18016000e-07');
model.variable('var_xs_fuel').set('chip5', '0.00000000e+00');
model.variable('var_xs_fuel').set('chip6', '0.00000000e+00');
model.variable('var_xs_fuel').set('chip7', '0.00000000e+00');
model.variable('var_xs_fuel').set('chip8', '0.00000000e+00');
model.variable('var_xs_fuel').set('chit1', '5.73215658e-01');
model.variable('var_xs_fuel').set('chit2', '4.25125076e-01');
model.variable('var_xs_fuel').set('chit3', '1.65844075e-03');
model.variable('var_xs_fuel').set('chit4', '2.55619047e-07');
model.variable('var_xs_fuel').set('chit5', '1.99439971e-08');
model.variable('var_xs_fuel').set('chit6', '1.95715684e-08');
model.variable('var_xs_fuel').set('chit7', '0.00000000e+00');
model.variable('var_xs_fuel').set('chit8', '0.00000000e+00');
model.variable('var_xs_fuel').set('diff11', '2.31159000e+00[cm]');
model.variable('var_xs_fuel').set('diff12', '1.12199000e+00[cm]');
model.variable('var_xs_fuel').set('diff13', '1.00891000e+00[cm]');
model.variable('var_xs_fuel').set('diff14', '9.89409000e-01[cm]');
model.variable('var_xs_fuel').set('diff15', '1.00371000e+00[cm]');
model.variable('var_xs_fuel').set('diff16', '9.80752000e-01[cm]');
model.variable('var_xs_fuel').set('diff17', '9.51883000e-01[cm]');
model.variable('var_xs_fuel').set('diff18', '8.52412000e-01[cm]');
model.variable('var_xs_fuel').set('fiss1', '9.94611000e-05[1/cm]');
model.variable('var_xs_fuel').set('fiss2', '2.71736000e-05[1/cm]');
model.variable('var_xs_fuel').set('fiss3', '1.96695000e-04[1/cm]');
model.variable('var_xs_fuel').set('fiss4', '7.87637000e-04[1/cm]');
model.variable('var_xs_fuel').set('fiss5', '7.09040000e-04[1/cm]');
model.variable('var_xs_fuel').set('fiss6', '5.00230000e-03[1/cm]');
model.variable('var_xs_fuel').set('fiss7', '4.57511000e-03[1/cm]');
model.variable('var_xs_fuel').set('fiss8', '8.91462000e-03[1/cm]');
model.variable('var_xs_fuel').set('invV1', '4.78184000e-10[s/cm]');
model.variable('var_xs_fuel').set('invV2', '1.95808000e-09[s/cm]');
model.variable('var_xs_fuel').set('invV3', '3.02780000e-08[s/cm]');
model.variable('var_xs_fuel').set('invV4', '2.00394000e-07[s/cm]');
model.variable('var_xs_fuel').set('invV5', '6.56741000e-07[s/cm]');
model.variable('var_xs_fuel').set('invV6', '1.35560000e-06[s/cm]');
model.variable('var_xs_fuel').set('invV7', '2.16378000e-06[s/cm]');
model.variable('var_xs_fuel').set('invV8', '4.14396000e-06[s/cm]');
model.variable('var_xs_fuel').set('kappa1', '2.05992000e+02[MeV]');
model.variable('var_xs_fuel').set('kappa2', '2.03329000e+02[MeV]');
model.variable('var_xs_fuel').set('kappa3', '2.03104000e+02[MeV]');
model.variable('var_xs_fuel').set('kappa4', '2.03627000e+02[MeV]');
model.variable('var_xs_fuel').set('kappa5', '2.03017000e+02[MeV]');
model.variable('var_xs_fuel').set('kappa6', '2.05503000e+02[MeV]');
model.variable('var_xs_fuel').set('kappa7', '2.03869000e+02[MeV]');
model.variable('var_xs_fuel').set('kappa8', '2.03334000e+02[MeV]');
model.variable('var_xs_fuel').set('lambdas1', '1.25435000e-02[1/s]');
model.variable('var_xs_fuel').set('lambdas2', '3.13212000e-02[1/s]');
model.variable('var_xs_fuel').set('lambdas3', '1.09688000e-01[1/s]');
model.variable('var_xs_fuel').set('lambdas4', '3.16554000e-01[1/s]');
model.variable('var_xs_fuel').set('lambdas5', '1.29420000e+00[1/s]');
model.variable('var_xs_fuel').set('lambdas6', '8.03336000e+00[1/s]');
model.variable('var_xs_fuel').set('nsf1', '2.76849000e-04[1/cm]');
model.variable('var_xs_fuel').set('nsf2', '6.88618000e-05[1/cm]');
model.variable('var_xs_fuel').set('nsf3', '4.90315000e-04[1/cm]');
model.variable('var_xs_fuel').set('nsf4', '1.98718000e-03[1/cm]');
model.variable('var_xs_fuel').set('nsf5', '1.76569000e-03[1/cm]');
model.variable('var_xs_fuel').set('nsf6', '1.33368000e-02[1/cm]');
model.variable('var_xs_fuel').set('nsf7', '1.16528000e-02[1/cm]');
model.variable('var_xs_fuel').set('nsf8', '2.23832000e-02[1/cm]');
model.variable('var_xs_fuel').set('diff21', '1.46630433e+00[cm]');
model.variable('var_xs_fuel').set('diff22', '7.55400484e-01[cm]');
model.variable('var_xs_fuel').set('diff23', '7.35938665e-01[cm]');
model.variable('var_xs_fuel').set('diff24', '7.22849473e-01[cm]');
model.variable('var_xs_fuel').set('diff25', '7.33547448e-01[cm]');
model.variable('var_xs_fuel').set('diff26', '7.20999016e-01[cm]');
model.variable('var_xs_fuel').set('diff27', '7.09459420e-01[cm]');
model.variable('var_xs_fuel').set('diff28', '6.59245998e-01[cm]');
model.variable('var_xs_fuel').set('rem1', '3.98912000e-02[1/cm]');
model.variable('var_xs_fuel').set('rem2', '1.47397000e-02[1/cm]');
model.variable('var_xs_fuel').set('rem3', '8.37622000e-03[1/cm]');
model.variable('var_xs_fuel').set('rem4', '2.46316000e-02[1/cm]');
model.variable('var_xs_fuel').set('rem5', '3.46631000e-02[1/cm]');
model.variable('var_xs_fuel').set('rem6', '7.49013000e-02[1/cm]');
model.variable('var_xs_fuel').set('rem7', '6.94437000e-02[1/cm]');
model.variable('var_xs_fuel').set('rem8', '9.69007000e-02[1/cm]');
model.variable('var_xs_fuel').set('scat11', '1.35477000e-01[1/cm]');
model.variable('var_xs_fuel').set('scat12', '3.90463000e-02[1/cm]');
model.variable('var_xs_fuel').set('scat13', '2.30632000e-05[1/cm]');
model.variable('var_xs_fuel').set('scat14', '3.19822000e-09[1/cm]');
model.variable('var_xs_fuel').set('scat15', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat16', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat17', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat18', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat21', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat22', '3.25666000e-01[1/cm]');
model.variable('var_xs_fuel').set('scat23', '1.46479000e-02[1/cm]');
model.variable('var_xs_fuel').set('scat24', '8.91917000e-09[1/cm]');
model.variable('var_xs_fuel').set('scat25', '3.73609000e-10[1/cm]');
model.variable('var_xs_fuel').set('scat26', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat27', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat28', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat31', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat32', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat33', '3.41032000e-01[1/cm]');
model.variable('var_xs_fuel').set('scat34', '7.51648000e-03[1/cm]');
model.variable('var_xs_fuel').set('scat35', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat36', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat37', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat38', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat41', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat42', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat43', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat44', '3.31103000e-01[1/cm]');
model.variable('var_xs_fuel').set('scat45', '1.78298000e-02[1/cm]');
model.variable('var_xs_fuel').set('scat46', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat47', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat48', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat51', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat52', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat53', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat54', '2.01995000e-04[1/cm]');
model.variable('var_xs_fuel').set('scat55', '3.15884000e-01[1/cm]');
model.variable('var_xs_fuel').set('scat56', '3.04347000e-02[1/cm]');
model.variable('var_xs_fuel').set('scat57', '3.68723000e-04[1/cm]');
model.variable('var_xs_fuel').set('scat58', '2.35183000e-07[1/cm]');
model.variable('var_xs_fuel').set('scat61', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat62', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat63', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat64', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat65', '9.90353000e-03[1/cm]');
model.variable('var_xs_fuel').set('scat66', '2.81747000e-01[1/cm]');
model.variable('var_xs_fuel').set('scat67', '5.49574000e-02[1/cm]');
model.variable('var_xs_fuel').set('scat68', '2.00478000e-03[1/cm]');
model.variable('var_xs_fuel').set('scat71', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat72', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat73', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat74', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat75', '7.71422000e-05[1/cm]');
model.variable('var_xs_fuel').set('scat76', '3.77158000e-02[1/cm]');
model.variable('var_xs_fuel').set('scat77', '2.93005000e-01[1/cm]');
model.variable('var_xs_fuel').set('scat78', '2.41158000e-02[1/cm]');
model.variable('var_xs_fuel').set('scat81', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat82', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat83', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat84', '0.00000000e+00[1/cm]');
model.variable('var_xs_fuel').set('scat85', '2.70585000e-08[1/cm]');
model.variable('var_xs_fuel').set('scat86', '4.69766000e-03[1/cm]');
model.variable('var_xs_fuel').set('scat87', '7.82798000e-02[1/cm]');
model.variable('var_xs_fuel').set('scat88', '2.93155000e-01[1/cm]');
model.variable('var_xs_fuel').set('tot1', '1.75368000e-01[1/cm]');
model.variable('var_xs_fuel').set('tot2', '3.40406000e-01[1/cm]');
model.variable('var_xs_fuel').set('tot3', '3.49408000e-01[1/cm]');
model.variable('var_xs_fuel').set('tot4', '3.55735000e-01[1/cm]');
model.variable('var_xs_fuel').set('tot5', '3.50547000e-01[1/cm]');
model.variable('var_xs_fuel').set('tot6', '3.56648000e-01[1/cm]');
model.variable('var_xs_fuel').set('tot7', '3.62449000e-01[1/cm]');
model.variable('var_xs_fuel').set('tot8', '3.90056000e-01[1/cm]');
model.variable('var_xs_fuel').selection.geom('geom1', 3);
model.variable('var_xs_fuel').selection.set([7]);
model.variable.create('var18');
model.variable('var18').model('mod1');
model.variable('var18').set('Pdensity', 'kappa1*fiss1*Flux1+kappa2*fiss2*Flux2+kappa3*fiss3*Flux3+kappa4*fiss4*Flux4+kappa5*fiss5*Flux5+kappa6*fiss6*Flux6+kappa7*fiss7*Flux7+kappa8*fiss8*Flux8', 'power density');
model.variable('var18').set('PdensityN', 'Pdensity*Pop/Pint', 'power density normalized to Pop');
model.variable('var18').set('Pint', 'intop1(Pdensity)', 'integrated total core power');
model.variable('var18').set('PintN', 'intop1(PdensityN)', 'integrated total core power normalized to Pop, should be equal to Pop');
model.variable.create('var22');
model.variable('var22').model('mod1');
model.variable('var22').set('sumDelayedN', 'lambdas1*Conc1+lambdas2*Conc2+lambdas3*Conc3+lambdas4*Conc4+lambdas5*Conc5+lambdas6*Conc6', 'sum of lambda*C_i, for diffusion equation');
model.variable('var22').set('sumN', 'nsf1*Flux1+nsf2*Flux2+nsf3*Flux3+nsf4*Flux4+nsf5*Flux5+nsf6*Flux6+nsf7*Flux7+nsf8*Flux8', 'sum of nuSigmafPhi_g, for delayed neutrons equations');
model.variable.create('var_T_fuel');
model.variable('var_T_fuel').model('mod1');
model.variable('var_T_fuel').set('T_fuel_1', 'T_fuel');
model.variable('var_T_fuel').set('T_fuel_2', 'T_fuel');
model.variable('var_T_fuel').set('T_fuel_3', 'T_fuel');
model.variable('var_T_fuel').set('T_fuel_4', 'T_fuel');
model.variable('var_T_fuel').set('T_fuel_5', 'T_fuel');
model.variable('var_T_fuel').set('T_fuel_6', 'T_fuel');
model.variable('var_T_fuel').set('T_fuel_7', 'T_fuel');
model.variable('var_T_fuel').set('T_fuel_8', 'T_fuel');
model.variable('var_T_fuel').set('T_fuel_9', 'T_fuel');
model.variable('var_T_fuel').set('T_fuel_10', 'T_fuel');
model.variable('var_T_fuel').set('T_fuel_11', 'T_fuel');
model.variable('var_T_fuel').set('T_fuel_12', 'T_fuel');
model.variable('var_T_fuel').set('T_fuel_13', 'T_fuel');
model.variable('var_T_fuel').set('T_fuel_14', 'T_fuel');
model.variable('var_T_fuel').set('T_fuel_15', 'T_fuel');
model.variable('var_T_fuel').set('T_fuel_16', 'T_fuel');
model.variable('var_T_fuel').set('T_fuel_17', 'T_fuel');
model.variable('var_T_fuel').set('T_fuel_18', 'T_fuel');
model.variable('var_T_fuel').set('T_fuel_19', 'T_fuel');
model.variable('var_T_fuel').set('T_fuel_20', 'T_fuel');
model.variable('var_T_fuel').set('T_fuel_21', 'T_fuel');
model.variable('var_T_fuel').set('T_fuel_22', 'T_fuel');
model.variable('var_T_fuel').set('T_fuel_23', 'T_fuel');
model.variable('var_T_fuel').set('T_fuel_24', 'T_fuel');

model.material.create('mat1', 'Common', 'mod1');
model.material.create('mat2', 'Common', 'mod1');
model.material.create('mat3', 'Common', 'mod1');
model.material.create('mat4', 'Common', 'mod1');
model.material('mat1').selection.set([6 7]);
model.material('mat2').selection.set([4 5 8 9 10 11 12 13 14 15 16 17]);
model.material('mat4').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');
model.material('mat4').propertyGroup.create('Murnaghan', 'Murnaghan');
model.material('mat4').propertyGroup.create('Lame', ['Lam' native2unicode(hex2dec({'00' 'e9'}), 'unicode') ' parameters']);

model.physics.create('br', 'Brinkman', 'geom1');
model.physics('br').selection.set([6 7]);
model.physics('br').feature('fmp1').create('fd1', 'Forchheimer', 3);
model.physics('br').feature('fmp1').feature('fd1').selection.set([6 7]);
model.physics('br').create('out1', 'Outlet', 2);
model.physics('br').create('inl2', 'Inlet', 2);
model.physics('br').create('inl3', 'InletBoundary', 2);
model.physics('br').feature('inl3').selection.set([51 52 57 58 126 129 152 155]);
model.physics.create('ht', 'HeatTransferInFluids', 'geom1');
model.physics('ht').field('temperature').field('T_flibe');
model.physics('ht').selection.set([6 7]);
model.physics('ht').create('temp1', 'TemperatureBoundary', 2);
model.physics('ht').feature('temp1').selection.set([19 20 27 28 29 32 34]);
model.physics('ht').create('hs1', 'HeatSource', 3);
model.physics('ht').feature('hs1').selection.set([7]);
model.physics('ht').create('hs2', 'HeatSource', 3);
model.physics('ht').feature('hs2').selection.set([7]);
model.physics('ht').create('ofl1', 'ConvectiveOutflow', 2);
model.physics('ht').feature('ofl1').selection.set([23 24 35 36 39]);
model.physics.create('ht3', 'HeatTransferInFluids', 'geom1');
model.physics('ht3').identifier('ht3');
model.physics('ht3').field('temperature').field('T_fuel');
model.physics('ht3').selection.set([7]);
model.physics('ht3').create('solid1', 'SolidHeatTransferModel', 3);
model.physics('ht3').feature('solid1').selection.set([7]);
model.physics('ht3').create('hs1', 'HeatSource', 3);
model.physics('ht3').feature('hs1').selection.set([7]);
model.physics('ht3').create('hs2', 'HeatSource', 3);
model.physics('ht3').feature('hs2').selection.set([7]);
model.physics('ht3').create('hs3', 'HeatSource', 3);
model.physics('ht3').feature('hs3').selection.set([7]);
model.physics('ht3').create('temp1', 'TemperatureBoundary', 2);
model.physics.create('neutrondiffusion', 'CoefficientFormPDE', 'geom1');
model.physics('neutrondiffusion').identifier('neutrondiffusion');
model.physics('neutrondiffusion').field('dimensionless').field('Flux');
model.physics('neutrondiffusion').field('dimensionless').component({'Flux1' 'Flux2' 'Flux3' 'Flux4' 'Flux5' 'Flux6' 'Flux7' 'Flux8' 'Conc1' 'Conc2'  ...
'Conc3' 'Conc4' 'Conc5' 'Conc6'});
model.physics('neutrondiffusion').create('dir1', 'DirichletBoundary', 2);
model.physics('neutrondiffusion').feature('dir1').selection.set([21 22 23 24 33 34 49 50 51 52 55 56 57 58 63 64 67 68 75 76 77 78 83 84 87 88 95 96 99 100 111 112 117 125 126 128 129 132 134 138 139 142 143 145 146 152 154 155 159 161 164 171 184 185 188 189 197 198 199 200]);
model.physics('neutrondiffusion').create('flux1', 'FluxBoundary', 2);

model.mesh('mesh1').autoMeshSize(7);

model.variable('var4').label('fuel properties');
model.variable('var_xs_inlet').active(false);
model.variable('var_xs_inlet').label('xs_inlet');
model.variable('var_xs_outlet_high').active(false);
model.variable('var_xs_outlet_high').label('xs_outlet_high');
model.variable('var_xs_outlet_low').active(false);
model.variable('var_xs_outlet_low').label('xs_outlet_low');
model.variable('var_xs_CR').label('xs_CR');
model.variable('var_xs_Blanket').label('xs_Blanket');
model.variable('var_xs_ORCC').label('xs_ORCC');
model.variable('var_xs_OR').label('xs_OR');
model.variable('var_xs_CB').label('xs_CB');
model.variable('var_xs_DC').label('xs_DC');
model.variable('var_xs_VS').label('xs_VS');
model.variable('var_xs_CRCC1').label('xs_CRCC1');
model.variable('var_xs_CRCC2').label('xs_CRCC2');
model.variable('var_xs_CRCC3').label('xs_CRCC3');
model.variable('var_xs_CRCC4').label('xs_CRCC4');
model.variable('var_xs_CRCC5').label('xs_CRCC5');
model.variable('var_xs_CRCC6').label('xs_CRCC6');
model.variable('var_xs_CRCC7').label('xs_CRCC7');
model.variable('var_xs_CRCC8_1').label('xs_CRCC8_1');
model.variable('var_xs_CRCC8_2').label('xs_CRCC8_2');
model.variable('var_xs_fuel').label('xs_fuel');
model.variable('var18').label('power');
model.variable('var22').label('delayed');
model.variable('var_T_fuel').label('Variables');

model.view('view1').set('renderwireframe', true);
model.view('view2').axis.set('abstractviewrratio', '2.21810245513916');
model.view('view2').axis.set('abstractviewlratio', '-2.2181026935577393');
model.view('view2').axis.set('abstractviewxscale', '0.01674426905810833');
model.view('view2').axis.set('abstractviewbratio', '-0.05000000074505806');
model.view('view2').axis.set('xmax', '5.689605236053467');
model.view('view2').axis.set('xmin', '-3.9216055870056152');
model.view('view2').axis.set('abstractviewyscale', '0.01674426905810833');
model.view('view2').axis.set('ymax', '5.977380752563477');
model.view('view2').axis.set('ymin', '0.16711902618408203');
model.view('view2').axis.set('abstractviewtratio', '0.05000000074505806');

model.material('mat1').label('Salt-with porosity and permeability');
model.material('mat1').propertyGroup('def').func.label('Functions');
model.material('mat1').propertyGroup('def').set('ratioofspecificheat', '1');
model.material('mat1').propertyGroup('def').set('dynamicviscosity', 'mu_flibe(T_flibe)');
model.material('mat1').propertyGroup('def').set('hydraulicpermeability', {'Kbr' '0' '0' '0' 'Kbr' '0' '0' '0' 'Kbr'});
model.material('mat1').propertyGroup('def').set('porosity', 'ep');
model.material('mat1').propertyGroup('def').set('thermalconductivity', {'1.1' '0' '0' '0' '1.1' '0' '0' '0' '1.1'});
model.material('mat1').propertyGroup('def').set('density', 'rho_flibe(T_flibe)');
model.material('mat1').propertyGroup('def').set('heatcapacity', '2386');
model.material('mat2').label('graphite based on built in steel');
model.material('mat2').propertyGroup('def').set('porosity', '0.2');
model.material('mat2').propertyGroup('def').set('hydraulicpermeability', {'1.55*10^(-13)' '0' '0' '0' '1.55*10^(-13)' '0' '0' '0' '1.55*10^(-13)'});
model.material('mat2').propertyGroup('def').set('ratioofspecificheat', '1');
model.material('mat2').propertyGroup('def').set('thermalconductivity', {'640[W/(m*K)]' '0' '0' '0' '640[W/(m*K)]' '0' '0' '0' '640[W/(m*K)]'});
model.material('mat2').propertyGroup('def').set('heatcapacity', '684[J/(kg*K)]');
model.material('mat2').propertyGroup('def').set('density', '1960[kg/m^3]');
model.material('mat3').label('Salt-channels, hydraulicpermeability is different from porous media salt');
model.material('mat3').propertyGroup('def').func.label('Functions');
model.material('mat3').propertyGroup('def').set('ratioofspecificheat', '1');
model.material('mat3').propertyGroup('def').set('dynamicviscosity', 'mu_flibe(T_flibe)');
model.material('mat3').propertyGroup('def').set('hydraulicpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.material('mat3').propertyGroup('def').set('porosity', 'ep');
model.material('mat3').propertyGroup('def').set('thermalconductivity', {'1.1' '0' '0' '0' '1.1' '0' '0' '0' '1.1'});
model.material('mat3').propertyGroup('def').set('density', 'rho_flibe(T_flibe)');
model.material('mat3').propertyGroup('def').set('heatcapacity', '2386');
model.material('mat4').label('Structural steel');
model.material('mat4').set('ambient', 'custom');
model.material('mat4').set('specular', 'custom');
model.material('mat4').set('fresnel', '0.9');
model.material('mat4').set('noise', 'on');
model.material('mat4').set('family', 'custom');
model.material('mat4').set('diffuse', 'custom');
model.material('mat4').set('noisefreq', '1');
model.material('mat4').set('customambient', {'0.6666666666666666' '0.6666666666666666' '0.6666666666666666'});
model.material('mat4').set('lighting', 'cooktorrance');
model.material('mat4').set('roughness', '0.3');
model.material('mat4').set('customspecular', {'0.7843137254901961' '0.7843137254901961' '0.7843137254901961'});
model.material('mat4').set('customdiffuse', {'0.6666666666666666' '0.6666666666666666' '0.6666666666666666'});
model.material('mat4').set('fresnel', '0.9');
model.material('mat4').propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.material('mat4').propertyGroup('def').set('heatcapacity', '475[J/(kg*K)]');
model.material('mat4').propertyGroup('def').set('thermalconductivity', {'44.5[W/(m*K)]' '0' '0' '0' '44.5[W/(m*K)]' '0' '0' '0' '44.5[W/(m*K)]'});
model.material('mat4').propertyGroup('def').set('electricconductivity', {'4.032e6[S/m]' '0' '0' '0' '4.032e6[S/m]' '0' '0' '0' '4.032e6[S/m]'});
model.material('mat4').propertyGroup('def').set('relpermittivity', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.material('mat4').propertyGroup('def').set('thermalexpansioncoefficient', {'12.3e-6[1/K]' '0' '0' '0' '12.3e-6[1/K]' '0' '0' '0' '12.3e-6[1/K]'});
model.material('mat4').propertyGroup('def').set('density', '7850[kg/m^3]');
model.material('mat4').propertyGroup('Enu').set('youngsmodulus', '200e9[Pa]');
model.material('mat4').propertyGroup('Enu').set('poissonsratio', '0.30');
model.material('mat4').propertyGroup('Murnaghan').set('l', '');
model.material('mat4').propertyGroup('Murnaghan').set('m', '');
model.material('mat4').propertyGroup('Murnaghan').set('n', '');
model.material('mat4').propertyGroup('Murnaghan').set('l', '-3.0e11[Pa]');
model.material('mat4').propertyGroup('Murnaghan').set('m', '-6.2e11[Pa]');
model.material('mat4').propertyGroup('Murnaghan').set('n', '-7.2e11[Pa]');
model.material('mat4').propertyGroup('Lame').set('lambLame', '');
model.material('mat4').propertyGroup('Lame').set('muLame', '');
model.material('mat4').propertyGroup('Lame').set('lambLame', '1.15e11[Pa]');
model.material('mat4').propertyGroup('Lame').set('muLame', '7.69e10[Pa]');

model.physics('br').active(false);
model.physics('br').label('Momentum - Porous Media Flow');
model.physics('br').prop('ShapeProperty').set('valueType', {'complex';  ...
'complex';  ...
'real';  ...
'real';  ...
'real';  ...
'real';  ...
'real';  ...
'real';  ...
'real';  ...
'real';  ...
'real'});
model.physics('br').prop('PhysicalModelProperty').set('StokesFlowProp', '0');
model.physics('br').prop('PhysicalModelProperty').set('TurbulenceModel', 'keps');
model.physics('br').prop('ConsistentStabilization').set('CrosswindDiffusionOldFormNS', '1');
model.physics('br').prop('AdvancedSettingProperty').set('locCFL', '1.3^min(niterCMP-1,9)+if(niterCMP>25,9*1.3^min(niterCMP-25,9),0)+if(niterCMP>50,90*1.3^min(niterCMP-50,9),0)');
model.physics('br').feature('fmp1').set('rho', 'rho_flibe(T_flibe)');
model.physics('br').feature('fmp1').set('kappa', {'0'; '0'; '0'; '0'; '0'; '0'; '0'; '0'; '0'});
model.physics('br').feature('fmp1').set('minput_strainreferencetemperature', '0');
model.physics('br').feature('fmp1').set('editModelInputs', '1');
model.physics('br').feature('fmp1').label('Fluid and Matrix Properties');
model.physics('br').feature('fmp1').feature('fd1').set('betaF', 'bF');
model.physics('br').feature('fmp1').feature('fd1').label('Forchheimer Drag');
model.physics('br').feature('wall1').set('BoundaryCondition', 'Slip');
model.physics('br').feature('wall1').set('zeta', '-0.1[V]');
model.physics('br').feature('wall1').set('constraintType', 'symmetricConstraint');
model.physics('br').feature('wall1').label('Wall');
model.physics('br').feature('out1').set('BoundaryCondition', 'Pressure');
model.physics('br').feature('inl2').set('U0in', 'vel_in(z, 1.29)');
model.physics('br').feature('inl2').set('IT', '0.05');
model.physics('br').feature('inl2').set('LT', '0.01[m]');
model.physics('br').feature('inl2').set('k0', '0.005[m^2/s^2]');
model.physics('br').feature('inl2').set('ep0', '0.005[m^2/s^3]');
model.physics('br').feature('inl2').set('om0', '20[1/s]');
model.physics('br').feature('inl3').set('BoundaryCondition', 'MassFlow');
model.physics('br').feature('inl3').set('U0in', '0.5');
model.physics('br').feature('inl3').set('mfr', 'mL*bottomInletFraction');
model.physics('br').feature('inl3').set('IT', '0.05');
model.physics('br').feature('inl3').set('LT', '0.01[m]');
model.physics('br').feature('inl3').set('k0', '0.005[m^2/s^2]');
model.physics('br').feature('inl3').set('ep0', '0.005[m^2/s^3]');
model.physics('br').feature('inl3').set('om0', '20[1/s]');
model.physics('ht').active(false);
model.physics('ht').label('Heat Transfer - Flibe');
model.physics('ht').prop('ShapeProperty').set('valueType', 'complex');
model.physics('ht').prop('ShapeProperty').set('order_temperature', '2');
model.physics('ht').prop('ShapeProperty').set('boundaryFlux_temperature', '0');
model.physics('ht').prop('ConsistentStabilization').set('glim', '0.01[K]/ht.helem');
model.physics('ht').prop('ConsistentStabilization').set('StreamlineDiffusionOldForm', '1');
model.physics('ht').prop('ConsistentStabilization').set('heatCrosswindDiffusion', '0');
model.physics('ht').prop('RadiationProperty').set('fieldName', 'root.J');
model.physics('ht').feature('fluid1').set('k', {'0.6*'; '0'; '0'; '0'; '0.6*'; '0'; '0'; '0'; '0.6*'});
model.physics('ht').feature('fluid1').set('minput_pressure', '0');
model.physics('ht').feature('fluid1').set('minput_velocity', {'0'; 'v_inlet'; '0'});
model.physics('ht').feature('fluid1').set('minput_strainreferencetemperature', '0');
model.physics('ht').feature('fluid1').label('Fluid');
model.physics('ht').feature('init1').set('Tinit', 'T0_flibe');
model.physics('ht').feature('init1').label('Initial Temperature');
model.physics('ht').feature('ins1').label('Thermal Insulation');
model.physics('ht').feature('temp1').set('T0', 'T_inlet');
model.physics('ht').feature('temp1').label('Inlet Temperature');
model.physics('ht').feature('hs1').set('Q0', 'h_conv*pb_area/fuel_v*T_fuel');
model.physics('ht').feature('hs1').label('heat transfer from fuel-cst term');
model.physics('ht').feature('hs2').set('heatSourceType', 'LinearSource');
model.physics('ht').feature('hs2').set('qs', '-h_conv*pb_area/fuel_v');
model.physics('ht').feature('hs2').label('heat transfer from fuel - linear term');
model.physics('ht').feature('ofl1').label('Outflow');
model.physics('ht3').active(false);
model.physics('ht3').label('Heat Transfer in Fuel Pebble');
model.physics('ht3').comments('fuel temperature');
model.physics('ht3').prop('ConsistentStabilization').set('glim', '(0.01[K])/ht3.helem');
model.physics('ht3').feature('fluid1').label('overridden');
model.physics('ht3').feature('init1').set('Tinit', 'T0_fuel');
model.physics('ht3').feature('solid1').set('k', {'k_fuel'; '0'; '0'; '0'; 'k_fuel'; '0'; '0'; '0'; 'k_fuel'});
model.physics('ht3').feature('solid1').set('rho', 'rho_fuel*(1-porosity)');
model.physics('ht3').feature('solid1').set('Cp', 'cp_fuel');
model.physics('ht3').feature('solid1').label('Heat Transfer in Solids(smeared fuel pebbles)');
model.physics('ht3').feature('hs1').set('P0', '1E7');
model.physics('ht3').feature('hs1').set('Q0', 'Pdensity*Pop/Pint');
model.physics('ht3').feature('hs1').label('Nuclear heat generation');
model.physics('ht3').feature('hs2').set('heatSourceType', 'LinearSource');
model.physics('ht3').feature('hs2').set('qs', '-h_conv*pb_area/fuel_v');
model.physics('ht3').feature('hs2').label('heat tranfer to flibe - linear term');
model.physics('ht3').feature('hs3').set('Q0', 'h_conv*pb_area/fuel_v*T_flibe');
model.physics('ht3').feature('hs3').label('heat transfer to flibe - cst term');
model.physics('neutrondiffusion').prop('ShapeProperty').set('order', '1');
model.physics('neutrondiffusion').prop('Units').set('SourceTermQuantity', 'productionrate');
model.physics('neutrondiffusion').prop('Units').set('DependentVariableQuantity', 'particleflux');
model.physics('neutrondiffusion').feature('cfeq1').set('c', {'diff11' '0' '0' '0' 'diff11' '0' '0' '0' 'diff11';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'diff12' '0' '0' '0' 'diff12' '0' '0' '0' 'diff12';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'diff13' '0' '0' '0' 'diff13' '0' '0' '0' 'diff13';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'diff14' '0' '0' '0' 'diff14' '0' '0' '0' 'diff14';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'diff15' '0' '0' '0' 'diff15' '0' '0' '0' 'diff15';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'diff16' '0' '0' '0' 'diff16' '0' '0' '0' 'diff16';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'diff17' '0' '0' '0' 'diff17' '0' '0' '0' 'diff17';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'diff18' '0' '0' '0' 'diff18' '0' '0' '0' 'diff18';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0';  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0'});
model.physics('neutrondiffusion').feature('cfeq1').set('a', {'(rem1-(1-beta1)*chip1*nsf1*lambda)';  ...
'(-scat12-(1-beta1)*chip2*nsf1*lambda)';  ...
'(-scat13-(1-beta1)*chip3*nsf1*lambda)';  ...
'(-scat14-(1-beta1)*chip4*nsf1*lambda)';  ...
'(-scat15-(1-beta1)*chip5*nsf1*lambda)';  ...
'(-scat16-(1-beta1)*chip6*nsf1*lambda)';  ...
'(-scat17-(1-beta1)*chip7*nsf1*lambda)';  ...
'(-scat18-(1-beta1)*chip8*nsf1*lambda)';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'(-scat21-(1-beta1)*chip1*nsf2*lambda)';  ...
'(rem2-(1-beta1)*chip2*nsf2*lambda)';  ...
'(-scat23-(1-beta1)*chip3*nsf2*lambda)';  ...
'(-scat24-(1-beta1)*chip4*nsf2*lambda)';  ...
'(-scat25-(1-beta1)*chip5*nsf2*lambda)';  ...
'(-scat26-(1-beta1)*chip6*nsf2*lambda)';  ...
'(-scat27-(1-beta1)*chip7*nsf2*lambda)';  ...
'(-scat28-(1-beta1)*chip8*nsf2*lambda)';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'(-scat31-(1-beta1)*chip1*nsf3*lambda)';  ...
'(-scat32-(1-beta1)*chip2*nsf3*lambda)';  ...
'(rem3-(1-beta1)*chip3*nsf3*lambda)';  ...
'(-scat34-(1-beta1)*chip4*nsf3*lambda)';  ...
'(-scat35-(1-beta1)*chip5*nsf3*lambda)';  ...
'(-scat36-(1-beta1)*chip6*nsf3*lambda)';  ...
'(-scat37-(1-beta1)*chip7*nsf3*lambda)';  ...
'(-scat38-(1-beta1)*chip8*nsf3*lambda)';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'(-scat41-(1-beta1)*chip1*nsf4*lambda)';  ...
'(-scat42-(1-beta1)*chip2*nsf4*lambda)';  ...
'(-scat43-(1-beta1)*chip3*nsf4*lambda)';  ...
'(rem4-(1-beta1)*chip4*nsf4*lambda)';  ...
'(-scat45-(1-beta1)*chip5*nsf4*lambda)';  ...
'(-scat46-(1-beta1)*chip6*nsf4*lambda)';  ...
'(-scat47-(1-beta1)*chip7*nsf4*lambda)';  ...
'(-scat48-(1-beta1)*chip8*nsf4*lambda)';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'(-scat51-(1-beta1)*chip1*nsf5*lambda)';  ...
'(-scat52-(1-beta1)*chip2*nsf5*lambda)';  ...
'(-scat53-(1-beta1)*chip3*nsf5*lambda)';  ...
'(-scat54-(1-beta1)*chip4*nsf5*lambda)';  ...
'(rem5-(1-beta1)*chip5*nsf5*lambda)';  ...
'(-scat56-(1-beta1)*chip6*nsf5*lambda)';  ...
'(-scat57-(1-beta1)*chip7*nsf5*lambda)';  ...
'(-scat58-(1-beta1)*chip8*nsf5*lambda)';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'(-scat61-(1-beta1)*chip1*nsf6*lambda)';  ...
'(-scat62-(1-beta1)*chip2*nsf6*lambda)';  ...
'(-scat63-(1-beta1)*chip3*nsf6*lambda)';  ...
'(-scat64-(1-beta1)*chip4*nsf6*lambda)';  ...
'(-scat65-(1-beta1)*chip5*nsf6*lambda)';  ...
'(rem6-(1-beta1)*chip6*nsf6*lambda)';  ...
'(-scat67-(1-beta1)*chip7*nsf6*lambda)';  ...
'(-scat68-(1-beta1)*chip8*nsf6*lambda)';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'(-scat71-(1-beta1)*chip1*nsf7*lambda)';  ...
'(-scat72-(1-beta1)*chip2*nsf7*lambda)';  ...
'(-scat73-(1-beta1)*chip3*nsf7*lambda)';  ...
'(-scat74-(1-beta1)*chip4*nsf7*lambda)';  ...
'(-scat75-(1-beta1)*chip5*nsf7*lambda)';  ...
'(-scat76-(1-beta1)*chip6*nsf7*lambda)';  ...
'(rem7-(1-beta1)*chip7*nsf7*lambda)';  ...
'(-scat78-(1-beta1)*chip8*nsf7*lambda)';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'(-scat81-(1-beta1)*chip1*nsf8*lambda)';  ...
'(-scat82-(1-beta1)*chip2*nsf8*lambda)';  ...
'(-scat83-(1-beta1)*chip3*nsf8*lambda)';  ...
'(-scat84-(1-beta1)*chip4*nsf8*lambda)';  ...
'(-scat85-(1-beta1)*chip5*nsf8*lambda)';  ...
'(-scat86-(1-beta1)*chip6*nsf8*lambda)';  ...
'(-scat87-(1-beta1)*chip7*nsf8*lambda)';  ...
'(rem8-(1-beta1)*chip8*nsf8*lambda)';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'lambdas1';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'lambdas2';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'lambdas3';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'lambdas4';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'lambdas5';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'lambdas6'});
model.physics('neutrondiffusion').feature('cfeq1').set('f', {'chid1*lambda*sumDelayedN';  ...
'chid2*lambda*sumDelayedN';  ...
'chid3*lambda*sumDelayedN';  ...
'chid4*lambda*sumDelayedN';  ...
'chid5*lambda*sumDelayedN';  ...
'chid6*lambda*sumDelayedN';  ...
'chid7*lambda*sumDelayedN';  ...
'chid8*lambda*sumDelayedN';  ...
'betas1*sumN';  ...
'betas2*sumN';  ...
'betas3*sumN';  ...
'betas4*sumN';  ...
'betas5*sumN';  ...
'betas6*sumN'});
model.physics('neutrondiffusion').feature('cfeq1').set('da', {'invV1*eigenMode';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'invV2*eigenMode';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'invV3*eigenMode';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'invV4*eigenMode';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'invV5*eigenMode';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'invV6*eigenMode';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'invV7*eigenMode';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'invV8*eigenMode';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'eigenMode';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'eigenMode';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'eigenMode';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'eigenMode';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'eigenMode';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'eigenMode'});
model.physics('neutrondiffusion').feature('init1').set('Flux1', '1');
model.physics('neutrondiffusion').feature('init1').set('Flux2', '1');
model.physics('neutrondiffusion').feature('init1').set('Flux3', '1');
model.physics('neutrondiffusion').feature('init1').set('Flux4', '1');
model.physics('neutrondiffusion').feature('init1').set('Flux5', '1');
model.physics('neutrondiffusion').feature('init1').set('Flux6', '1');
model.physics('neutrondiffusion').feature('init1').set('Flux7', '1');
model.physics('neutrondiffusion').feature('init1').set('Flux8', '1');
model.physics('neutrondiffusion').feature('init1').set('Conc1', '1');
model.physics('neutrondiffusion').feature('init1').set('Conc2', '1');
model.physics('neutrondiffusion').feature('init1').set('Conc3', '1');
model.physics('neutrondiffusion').feature('init1').set('Conc4', '1');
model.physics('neutrondiffusion').feature('init1').set('Conc5', '1');
model.physics('neutrondiffusion').feature('init1').set('Conc6', '1');

model.mesh('mesh1').run;

model.frame('material1').sorder(1);

model.physics('ht3').feature('solid1').set('k_mat', 'userdef');
model.physics('ht3').feature('solid1').set('rho_mat', 'userdef');
model.physics('ht3').feature('solid1').set('Cp_mat', 'userdef');

model.study.create('std2');
model.study('std2').create('eigv', 'Eigenvalue');
model.study('std2').feature('eigv').set('activate', {'br' 'off' 'ht' 'off' 'ht3' 'off' 'neutrondiffusion' 'on'});

model.sol.create('sol16');
model.sol('sol16').study('std2');
model.sol('sol16').attach('std2');
model.sol('sol16').create('st1', 'StudyStep');
model.sol('sol16').create('v1', 'Variables');
model.sol('sol16').create('e1', 'Eigenvalue');
model.sol('sol16').feature('e1').create('d1', 'Direct');
model.sol('sol16').feature('e1').create('i1', 'Iterative');

model.result.create('pg1', 'PlotGroup3D');
model.result('pg1').create('slc1', 'Slice');

model.study('std2').label('Eigenvalue study');
model.study('std2').feature('eigv').set('eigwhich', 'sr');
model.study('std2').feature('eigv').set('neigsactive', true);
model.study('std2').feature('eigv').set('usesol', 'on');
model.study('std2').feature('eigv').set('useinitsol', 'on');
model.study('std2').feature('eigv').set('shiftactive', true);
model.study('std2').feature('eigv').set('shift', '1');
model.study('std2').feature('eigv').set('neigs', '1');

model.sol('sol16').attach('std2');
model.sol('sol16').feature('e1').set('krylovdim', '5');
model.sol('sol16').feature('e1').set('maxeigit', '100');
model.sol('sol16').feature('e1').set('shift', '1');
model.sol('sol16').feature('e1').set('keeplog', true);
model.sol('sol16').feature('e1').set('neigs', '1');
model.sol('sol16').feature('e1').set('eigwhich', 'sr');
model.sol('sol16').feature('e1').feature('i1').set('maxlinit', '1000');
model.sol('sol16').feature('e1').feature('i1').feature('ilDef').set('prefun', 'spooles');
model.sol('sol16').runAll;

model.result('pg1').feature('slc1').set('resolution', 'normal');

out = model;
