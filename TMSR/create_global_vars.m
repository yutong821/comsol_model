
model.param.set('v_inlet', '0.14[m/s]', 'upwards velocity, uniform in the core 0.14[m/s]');
model.param.set('T0_flibe', '1051[K]', 'initial temperature for flibe salt, 672[degC] for TMSR');
model.param.set('T_inlet', '672[degC]','nominal value is 672');
model.param.set('T0_fuel', '900[K]', 'initial temperature for fuel pebbles, 800[degC]');
%model.param.set('Tp1','0[degC]');
%model.param.set('Tp00', 1, 'placeholder for the bias term in linear regression of cross sections on temperature');

model.param.set('pb_h', '0.4501[m]', 'a parameter for pebble height, defined as in picture ''core_dim_definition''. Calculated with MATLAB Livelink, file ''volume.m''');
model.param.set('z0', '20[cm]-4.899[cm]', 'height of pebble boundary when pb_h =0');
model.param.set('zin', 'z0+pb_h', 'inner height that fuel pebble regions starts');
model.param.set('zout', '0.53+pb_h', 'outer height that fuel pebble starts');
model.param.set('pb_diam', '0.06[m]', 'fuel pebble diameter');
model.param.set('r0','0[m]');
model.param.set('r1', '0.017334031858766[m]');
model.param.set('r2', '0.021839511618407[m]');
model.param.set('r3', '0.025000000000000[m]');
model.param.set('r4', '0.027500000000000[m]');
%radius of TRISTO
model.param.set('R0', '0[m]');
model.param.set('R1', '0.000173340318588[m]');
model.param.set('R2', '0.000218395116184[m]');
model.param.set('R3', '0.000250000000000[m]');
% model.param.set('R4', '0.000365000000000[m]');
model.param.set('R4', '0.092000000000000[m]');

%volume for each part
model.param.set('V_fuel', '4/3*pi*0.00025^3/3[m^3]');
model.param.set('V_coat', '4/3*pi*(0.00046^3-0.00025^3)[m^3]');
model.param.set('V_graphite_shell', '4/3*pi*(0.06^3-0.055^3)[m^3]');

% Tp0 is zero
model.param.set('Tp0', '0');

model.param.set('rfuel_zone','0.025[m]')
model.param.set('V_zone', '4/3*pi*rfuel_zone^3/pb_zone', 'volume of each zone in a pebble times number of pebbles');
model.param.set('pb_zone', '3', 'number of radial zones in the pebbles');

model.param.set('pb_area', 'pb_nb*4*(pb_diam/2)^2*pi', 'heat transfer area between flibe and pebbles');
model.param.set('pb_nb', '11000', 'number of pebbles in the core');
model.param.set('triso_nb', '11558', 'number of trisos in each core');
model.param.set('pb_v', 'pb_nb*4/3*(pb_diam/2)^3*pi', 'volume of fuel pebbles');
model.param.set('fuel_v', 'pb_v/0.6', 'volume of upper region of the core');

model.param.set('porosity', '0.4', 'portion of coolant in the fuel region');


model.param.set('Pnominal', '10*10^6[W]', 'Total nominal power');
model.param.set('Pop', 'Pnominal', 'operation power');
model.param.set('h_conv', '6000[W/m^2/K]', 'placeholder');


