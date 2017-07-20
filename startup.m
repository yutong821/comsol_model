
mname = mfilename;
mydir = which(mname); mydir = mydir(1:end-2-numel(mname));


addpath(mydir(1:end-1));
addpath([mydir, 'TMSR/XS_data'])
addpath([mydir, 'build_model'])
addpath([mydir, 'build_model\neutronics'])
addpath([mydir, 'build_model\therm'])
addpath([mydir, 'data_process'])
addpath([mydir, 'solvers'])
addpath([mydir, 'tests'])
addpath([mydir, 'TMSR'])
%addpath([mydir, 'MK1'])

clear mydir mname

