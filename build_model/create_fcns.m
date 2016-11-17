% create functions 
model.func.create('an3', 'Analytic');
model.func.create('an4', 'Analytic');
model.func.create('an5', 'Analytic');
model.func.create('an6', 'Analytic');
model.func.create('step1', 'Step');
model.func('an3').label('FLiBe Thermal Conductivity');
model.func('an3').set('args', {'T'});
model.func('an3').set('argunit', 'K');
model.func('an3').set('expr', '0.7662+(0.0005*(T-273.15))');
model.func('an3').set('plotargs', {'T' '600' '800'});
model.func('an3').set('funcname', 'k_flibe');
model.func('an3').set('fununit', 'W/(m*K)');
model.func('an4').label('FLiBe Density');
model.func('an4').set('args', {'T'});
model.func('an4').set('argunit', 'K');
model.func('an4').set('expr', '2279.92-0.488*(T-273.15)');
model.func('an4').set('plotargs', {'T' '600' '800'});
model.func('an4').set('funcname', 'rho_flibe');
model.func('an4').set('fununit', 'kg/m^3');
model.func('an5').label('FLiBe Heat Capacity');
model.func('an5').set('args', {'T'});
model.func('an5').set('argunit', 'K');
model.func('an5').set('expr', '2415.78');
model.func('an5').set('plotargs', {'T' '600' '800'});
model.func('an5').set('funcname', 'Cp_flibe');
model.func('an5').set('fununit', 'J/(kg*K)');
model.func('an6').label('FLiBe Dynamic Viscosity');
model.func('an6').set('args', {'T'});
model.func('an6').set('argunit', 'K');
model.func('an6').set('expr', '((4.638)*10^5)/((T-273.15)^2.79)');
model.func('an6').set('plotargs', {'T' '600' '800'});
model.func('an6').set('funcname', 'mu_flibe');
model.func('an6').set('fununit', 'Pa*s');
%define step function for reactivity insertion
model.func('step1').label('step_fun');
model.func('step1').set('funcname', 'step_fun');
model.func('step1').set('to', 'reactivity_insertion+1');
model.func('step1').set('smooth', '0');
model.func('step1').set('from', '1');
model.func('step1').set('location', '0.1');
%define ramp function for overcooling 
model.func.create('rm1', 'Ramp');
model.func('rm1').set('location', '150');
model.func('rm1').set('cutoffactive', 'on');
model.func('rm1').set('slope', 'OCSlope');
model.func('rm1').set('location', 'OCOnset');
model.func('rm1').set('cutoff', '-100');


