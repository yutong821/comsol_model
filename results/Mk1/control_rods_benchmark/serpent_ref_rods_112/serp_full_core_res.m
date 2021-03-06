
% Increase counter:

if (exist('idx', 'var'));
  idx = idx + 1;
else;
  idx = 1;
end;

% Version, title and date:

VERSION                   (idx, [1: 14])  = 'Serpent 2.1.29' ;
COMPILE_DATE              (idx, [1: 20])  = 'Jun 28 2017 19:26:40' ;
DEBUG                     (idx, 1)        = 0 ;
TITLE                     (idx, [1:  8])  = 'FHR core' ;
CONFIDENTIAL_DATA         (idx, 1)        = 0 ;
INPUT_FILE_NAME           (idx, [1: 14])  = 'serp_full_core' ;
WORKING_DIRECTORY         (idx, [1: 59])  = '/global/home/users/xwa9860/FIG/res/multi_zones/ref/rods_112' ;
HOSTNAME                  (idx, [1: 12])  = 'n0021.savio1' ;
CPU_TYPE                  (idx, [1: 41])  = 'Intel(R) Xeon(R) CPU E5-2670 v2 @ 2.50GHz' ;
CPU_MHZ                   (idx, 1)        = 1046.0 ;
START_DATE                (idx, [1: 24])  = 'Sun Nov 19 15:04:14 2017' ;
COMPLETE_DATE             (idx, [1: 24])  = 'Sun Nov 19 16:28:34 2017' ;

% Run parameters:

POP                       (idx, 1)        = 10000 ;
CYCLES                    (idx, 1)        = 2000 ;
SKIP                      (idx, 1)        = 500 ;
BATCH_INTERVAL            (idx, 1)        = 1 ;
SRC_NORM_MODE             (idx, 1)        = 2 ;
SEED                      (idx, 1)        = 1511132654 ;
UFS_MODE                  (idx, 1)        = 0 ;
UFS_ORDER                 (idx, 1)        = 1.00000;
NEUTRON_TRANSPORT_MODE    (idx, 1)        = 1 ;
PHOTON_TRANSPORT_MODE     (idx, 1)        = 0 ;
GROUP_CONSTANT_GENERATION (idx, 1)        = 1 ;
B1_CALCULATION            (idx, [1:  3])  = [ 0 0 0 ];
B1_BURNUP_CORRECTION      (idx, 1)        = 0 ;
IMPLICIT_REACTION_RATES   (idx, 1)        = 1 ;

% Optimization:

OPTIMIZATION_MODE         (idx, 1)        = 4 ;
RECONSTRUCT_MICROXS       (idx, 1)        = 1 ;
RECONSTRUCT_MACROXS       (idx, 1)        = 1 ;
MG_MAJORANT_MODE          (idx, 1)        = 0 ;

% Parallelization:

MPI_TASKS                 (idx, 1)        = 1 ;
OMP_THREADS               (idx, 1)        = 20 ;
MPI_REPRODUCIBILITY       (idx, 1)        = 0 ;
OMP_REPRODUCIBILITY       (idx, 1)        = 1 ;
OMP_HISTORY_PROFILE       (idx, [1:  20]) = [  9.92435E-01  1.00419E+00  1.00197E+00  9.98562E-01  1.00106E+00  1.00279E+00  1.00031E+00  1.00029E+00  9.97088E-01  1.00212E+00  9.99669E-01  1.00184E+00  1.00139E+00  9.99446E-01  9.99741E-01  1.00012E+00  9.99224E-01  9.97325E-01  9.96982E-01  1.00345E+00  ];
SHARE_BUF_ARRAY           (idx, 1)        = 0 ;
SHARE_RES2_ARRAY          (idx, 1)        = 1 ;

% File paths:

XS_DATA_FILE_PATH         (idx, [1: 71])  = '/global/home/groups/ac_nuclear/serpent/xsdata/endfb7/sss_endfb7u.xsdata' ;
DECAY_DATA_FILE_PATH      (idx, [1:  3])  = 'N/A' ;
SFY_DATA_FILE_PATH        (idx, [1:  3])  = 'N/A' ;
NFY_DATA_FILE_PATH        (idx, [1:  3])  = 'N/A' ;
BRA_DATA_FILE_PATH        (idx, [1:  3])  = 'N/A' ;

% Collision and reaction sampling (neutrons/photons):

MIN_MACROXS               (idx, [1:   4]) = [  5.00000E-02 0.0E+00  0.00000E+00 0.0E+00 ];
DT_THRESH                 (idx, [1:  2])  = [  9.00000E-01  9.00000E-01 ];
ST_FRAC                   (idx, [1:   4]) = [  8.22793E-01 4.5E-05  0.00000E+00 0.0E+00 ];
DT_FRAC                   (idx, [1:   4]) = [  1.77207E-01 0.00021  0.00000E+00 0.0E+00 ];
DT_EFF                    (idx, [1:   4]) = [  2.63404E-01 3.3E-05  0.00000E+00 0.0E+00 ];
REA_SAMPLING_EFF          (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
REA_SAMPLING_FAIL         (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_COL_EFF               (idx, [1:   4]) = [  4.81807E-01 0.00013  0.00000E+00 0.0E+00 ];
AVG_TRACKING_LOOPS        (idx, [1:   8]) = [  2.79542E+01 0.00027  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
AVG_TRACKS                (idx, [1:   4]) = [  1.75106E+02 0.00025  0.00000E+00 0.0E+00 ];
AVG_REAL_COL              (idx, [1:   4]) = [  1.75089E+02 0.00025  0.00000E+00 0.0E+00 ];
AVG_VIRT_COL              (idx, [1:   4]) = [  1.88301E+02 6.5E-05  0.00000E+00 0.0E+00 ];
AVG_SURF_CROSS            (idx, [1:   4]) = [  1.07935E+03 0.00028  0.00000E+00 0.0E+00 ];
LOST_PARTICLES            (idx, 1)        = 0 ;

% Run statistics:

CYCLE_IDX                 (idx, 1)        = 2000 ;
SOURCE_POPULATION         (idx, 1)        = 20004781 ;
MEAN_POP_SIZE             (idx, [1:  2])  = [  1.00024E+04 0.00049 ];
MEAN_POP_WGT              (idx, [1:  2])  = [  1.00024E+04 0.00049 ];
SIMULATION_COMPLETED      (idx, 1)        = 1 ;

% Running times:

TOT_CPU_TIME              (idx, 1)        =  1.66618E+03 ;
RUNNING_TIME              (idx, 1)        =  8.43220E+01 ;
INIT_TIME                 (idx, [1:  2])  = [  5.28300E-01  5.28300E-01 ];
PROCESS_TIME              (idx, [1:  2])  = [  1.47633E-01  1.47633E-01 ];
TRANSPORT_CYCLE_TIME      (idx, [1:  3])  = [  8.36460E+01  8.36460E+01  0.00000E+00 ];
MPI_OVERHEAD_TIME         (idx, [1:  2])  = [  0.00000E+00  0.00000E+00 ];
ESTIMATED_RUNNING_TIME    (idx, [1:  2])  = [  8.43215E+01  0.00000E+00 ];
CPU_USAGE                 (idx, 1)        = 19.75975 ;
TRANSPORT_CPU_USAGE       (idx, [1:   2]) = [  1.98757E+01 9.6E-05 ];
OMP_PARALLEL_FRAC         (idx, 1)        =  9.89558E-01 ;

% Memory usage:

AVAIL_MEM                 (idx, 1)        = 64497.81 ;
ALLOC_MEMSIZE             (idx, 1)        = 12261.11;
MEMSIZE                   (idx, 1)        = 8467.74;
XS_MEMSIZE                (idx, 1)        = 6627.13;
MAT_MEMSIZE               (idx, 1)        = 1702.80;
RES_MEMSIZE               (idx, 1)        = 3.91;
MISC_MEMSIZE              (idx, 1)        = 133.90;
UNKNOWN_MEMSIZE           (idx, 1)        = 0.00;
UNUSED_MEMSIZE            (idx, 1)        = 3793.37;

% Geometry parameters:

TOT_CELLS                 (idx, 1)        = 346 ;
UNION_CELLS               (idx, 1)        = 0 ;

% Neutron energy grid:

NEUTRON_ERG_TOL           (idx, 1)        =  0.00000E+00 ;
NEUTRON_ERG_NE            (idx, 1)        = 668171 ;
NEUTRON_EMIN              (idx, 1)        =  1.00000E-11 ;
NEUTRON_EMAX              (idx, 1)        =  2.00000E+01 ;

% Unresolved resonance probability table sampling:

URES_DILU_CUT             (idx, 1)        =  1.00000E-09 ;
URES_EMIN                 (idx, 1)        =  1.00000E-06 ;
URES_EMAX                 (idx, 1)        =  4.56970E-01 ;
URES_AVAIL                (idx, 1)        = 106 ;
URES_USED                 (idx, 1)        = 98 ;

% Nuclides and reaction channels:

TOT_NUCLIDES              (idx, 1)        = 155 ;
TOT_TRANSPORT_NUCLIDES    (idx, 1)        = 155 ;
TOT_DOSIMETRY_NUCLIDES    (idx, 1)        = 0 ;
TOT_DECAY_NUCLIDES        (idx, 1)        = 0 ;
TOT_PHOTON_NUCLIDES       (idx, 1)        = 0 ;
TOT_REA_CHANNELS          (idx, 1)        = 4404 ;
TOT_TRANSMU_REA           (idx, 1)        = 0 ;

% Neutron physics options:

USE_DELNU                 (idx, 1)        = 1 ;
USE_URES                  (idx, 1)        = 1 ;
USE_DBRC                  (idx, 1)        = 0 ;
IMPL_CAPT                 (idx, 1)        = 0 ;
IMPL_NXN                  (idx, 1)        = 1 ;
IMPL_FISS                 (idx, 1)        = 0 ;
DOPPLER_PREPROCESSOR      (idx, 1)        = 1 ;
TMS_MODE                  (idx, 1)        = 0 ;
SAMPLE_FISS               (idx, 1)        = 1 ;
SAMPLE_CAPT               (idx, 1)        = 1 ;
SAMPLE_SCATT              (idx, 1)        = 1 ;

% Radioactivity data:

TOT_ACTIVITY              (idx, 1)        =  0.00000E+00 ;
TOT_DECAY_HEAT            (idx, 1)        =  0.00000E+00 ;
TOT_SF_RATE               (idx, 1)        =  0.00000E+00 ;
ACTINIDE_ACTIVITY         (idx, 1)        =  0.00000E+00 ;
ACTINIDE_DECAY_HEAT       (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_ACTIVITY  (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_DECAY_HEAT(idx, 1)        =  0.00000E+00 ;
INHALATION_TOXICITY       (idx, 1)        =  0.00000E+00 ;
INGESTION_TOXICITY        (idx, 1)        =  0.00000E+00 ;
ACTINIDE_INH_TOX          (idx, 1)        =  0.00000E+00 ;
ACTINIDE_ING_TOX          (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_INH_TOX   (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_ING_TOX   (idx, 1)        =  0.00000E+00 ;
SR90_ACTIVITY             (idx, 1)        =  0.00000E+00 ;
TE132_ACTIVITY            (idx, 1)        =  0.00000E+00 ;
I131_ACTIVITY             (idx, 1)        =  0.00000E+00 ;
I132_ACTIVITY             (idx, 1)        =  0.00000E+00 ;
CS134_ACTIVITY            (idx, 1)        =  0.00000E+00 ;
CS137_ACTIVITY            (idx, 1)        =  0.00000E+00 ;
PHOTON_DECAY_SOURCE       (idx, 1)        =  0.00000E+00 ;
NEUTRON_DECAY_SOURCE      (idx, 1)        =  0.00000E+00 ;
ALPHA_DECAY_SOURCE        (idx, 1)        =  0.00000E+00 ;
BETA_DECAY_SOURCE         (idx, 1)        =  0.00000E+00 ;

% Normaliation coefficient:

NORM_COEF                 (idx, [1:   4]) = [  2.21925E+15 0.00027  0.00000E+00 0.0E+00 ];

% Analog reaction rate estimators:

CONVERSION_RATIO          (idx, [1:   2]) = [  4.73140E-01 0.00061 ];
U235_FISS                 (idx, [1:   4]) = [  4.65099E+18 0.00043  6.45831E-01 0.00029 ];
U238_FISS                 (idx, [1:   4]) = [  2.03581E+16 0.00716  2.82609E-03 0.00713 ];
PU239_FISS                (idx, [1:   4]) = [  1.92755E+18 0.00070  2.67665E-01 0.00065 ];
PU240_FISS                (idx, [1:   4]) = [  9.91136E+14 0.03451  1.37689E-04 0.03451 ];
PU241_FISS                (idx, [1:   4]) = [  5.93021E+17 0.00136  8.23461E-02 0.00133 ];
U235_CAPT                 (idx, [1:   4]) = [  1.13518E+18 0.00098  7.65257E-02 0.00095 ];
U238_CAPT                 (idx, [1:   4]) = [  3.51811E+18 0.00066  2.37136E-01 0.00050 ];
PU239_CAPT                (idx, [1:   4]) = [  1.17550E+18 0.00094  7.92470E-02 0.00094 ];
PU240_CAPT                (idx, [1:   4]) = [  1.05915E+18 0.00106  7.13948E-02 0.00100 ];
PU241_CAPT                (idx, [1:   4]) = [  2.27983E+17 0.00225  1.53707E-02 0.00226 ];
XE135_CAPT                (idx, [1:   4]) = [  3.08045E+17 0.00189  2.07675E-02 0.00189 ];
SM149_CAPT                (idx, [1:   4]) = [  1.30112E+17 0.00289  8.77206E-03 0.00290 ];

% Neutron balance (particles/weight):

BALA_SRC_NEUTRON_SRC        (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_SRC_NEUTRON_FISS       (idx, [1:  2])  = [ 20004781 2.00000E+07 ];
BALA_SRC_NEUTRON_NXN        (idx, [1:  2])  = [ 0 1.85632E+05 ];
BALA_SRC_NEUTRON_VR         (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_SRC_NEUTRON_TOT        (idx, [1:  2])  = [ 20004781 2.01856E+07 ];

BALA_LOSS_NEUTRON_CAPT       (idx, [1:  2])  = [ 13249973 1.33691E+07 ];
BALA_LOSS_NEUTRON_FISS       (idx, [1:  2])  = [ 6431572 6.49065E+06 ];
BALA_LOSS_NEUTRON_LEAK       (idx, [1:  2])  = [ 323236 3.25913E+05 ];
BALA_LOSS_NEUTRON_CUT        (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_LOSS_NEUTRON_TOT        (idx, [1:  2])  = [ 20004781 2.01856E+07 ];

BALA_NEUTRON_DIFF            (idx, [1:  2])  = [ 0 -1.26660E-07 ];

% Normalized total reaction rates (neutrons):

TOT_POWER                 (idx, [1:   2]) = [  2.36000E+08 0.0E+00 ];
TOT_POWDENS               (idx, [1:   2]) = [  5.99520E+06 0.0E+00 ];
TOT_GENRATE               (idx, [1:   2]) = [  1.86849E+19 8.8E-06 ];
TOT_FISSRATE              (idx, [1:   2]) = [  7.20224E+18 1.9E-06 ];
TOT_CAPTRATE              (idx, [1:   2]) = [  1.48312E+19 0.00032 ];
TOT_ABSRATE               (idx, [1:   2]) = [  2.20335E+19 0.00021 ];
TOT_SRCRATE               (idx, [1:   2]) = [  2.21925E+19 0.00027 ];
TOT_FLUX                  (idx, [1:   2]) = [  1.08765E+22 0.00034 ];
TOT_PHOTON_PRODRATE       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_LEAKRATE              (idx, [1:   2]) = [  3.61700E+17 0.00250 ];
ALBEDO_LEAKRATE           (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_LOSSRATE              (idx, [1:   2]) = [  2.23952E+19 0.00022 ];
TOT_CUTRATE               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_RR                    (idx, [1:   2]) = [  3.92106E+21 0.00036 ];
INI_FMASS                 (idx, 1)        =  3.93648E-05 ;
TOT_FMASS                 (idx, 1)        =  3.93648E-05 ;

% Fission neutron and energy production:

NUBAR                     (idx, [1:   2]) = [  2.59432E+00 1.1E-05 ];
FISSE                     (idx, [1:   2]) = [  2.04519E+02 1.9E-06 ];

% Criticality eigenvalues:

ANA_KEFF                  (idx, [1:   6]) = [  8.41975E-01 0.00034  8.37494E-01 0.00033  4.46217E-03 0.00545 ];
IMP_KEFF                  (idx, [1:   2]) = [  8.42169E-01 0.00022 ];
COL_KEFF                  (idx, [1:   2]) = [  8.42072E-01 0.00027 ];
ABS_KEFF                  (idx, [1:   2]) = [  8.42169E-01 0.00022 ];
ABS_KINF                  (idx, [1:   2]) = [  8.56121E-01 0.00021 ];
GEOM_ALBEDO               (idx, [1:   6]) = [  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00 ];

% ALF (Average lethargy of neutrons causing fission):
% Based on E0 = 2.000000E+01 MeV

ANA_ALF                   (idx, [1:   2]) = [  1.80204E+01 5.5E-05 ];
IMP_ALF                   (idx, [1:   2]) = [  1.80191E+01 2.5E-05 ];

% EALF (Energy corresponding to average lethargy of neutrons causing fission):

ANA_EALF                  (idx, [1:   2]) = [  2.98734E-07 0.00099 ];
IMP_EALF                  (idx, [1:   2]) = [  2.98901E-07 0.00045 ];

% AFGE (Average energy of neutrons causing fission):

ANA_AFGE                  (idx, [1:   2]) = [  1.25049E-02 0.00610 ];
IMP_AFGE                  (idx, [1:   2]) = [  1.25433E-02 0.00165 ];

% Forward-weighted delayed neutron parameters:

FWD_ANA_BETA_ZERO         (idx, [1:  14]) = [  6.27779E-03 0.00323  1.89442E-04 0.01779  1.17148E-03 0.00716  1.01371E-03 0.00786  2.75907E-03 0.00472  8.51528E-04 0.00847  2.92567E-04 0.01455 ];
FWD_ANA_LAMBDA            (idx, [1:  14]) = [  7.07506E-01 0.00749  9.95530E-03 0.01143  3.12428E-02 0.00022  1.09762E-01 0.00017  3.16504E-01 5.5E-05  1.28305E+00 0.00140  7.23061E+00 0.00839 ];

% Beta-eff using Meulekamp's method:

ADJ_MEULEKAMP_BETA_EFF    (idx, [1:  14]) = [  5.32881E-03 0.00469  1.63528E-04 0.02632  9.75366E-04 0.01083  8.68309E-04 0.01171  2.33988E-03 0.00700  7.28462E-04 0.01292  2.53261E-04 0.02185 ];
ADJ_MEULEKAMP_LAMBDA      (idx, [1:  14]) = [  7.18266E-01 0.01151  1.25553E-02 0.00049  3.12363E-02 0.00032  1.09744E-01 0.00026  3.16453E-01 8.0E-05  1.28235E+00 0.00178  8.00203E+00 0.00509 ];

% Adjoint weighted time constants using Nauchi's method:

ADJ_NAUCHI_GEN_TIME       (idx, [1:   6]) = [  5.73348E-04 0.00093  5.73452E-04 0.00093  5.50373E-04 0.01189 ];
ADJ_NAUCHI_LIFETIME       (idx, [1:   6]) = [  4.82634E-04 0.00087  4.82722E-04 0.00087  4.63343E-04 0.01188 ];
ADJ_NAUCHI_BETA_EFF       (idx, [1:  14]) = [  5.30393E-03 0.00545  1.69721E-04 0.03073  9.90292E-04 0.01263  8.51198E-04 0.01383  2.33029E-03 0.00804  7.16614E-04 0.01493  2.45811E-04 0.02592 ];
ADJ_NAUCHI_LAMBDA         (idx, [1:  14]) = [  7.08075E-01 0.01379  1.25638E-02 0.00071  3.12363E-02 0.00041  1.09751E-01 0.00034  3.16440E-01 9.9E-05  1.28351E+00 0.00229  8.03300E+00 0.00674 ];

% Adjoint weighted time constants using IFP:

ADJ_IFP_GEN_TIME          (idx, [1:   6]) = [  5.60220E-04 0.00230  5.60192E-04 0.00231  5.23138E-04 0.03017 ];
ADJ_IFP_LIFETIME          (idx, [1:   6]) = [  4.71571E-04 0.00226  4.71546E-04 0.00227  4.40361E-04 0.03016 ];
ADJ_IFP_IMP_BETA_EFF      (idx, [1:  14]) = [  5.28274E-03 0.01817  1.92392E-04 0.10732  1.00973E-03 0.04034  8.33307E-04 0.04513  2.22552E-03 0.02853  7.53194E-04 0.04900  2.68597E-04 0.07857 ];
ADJ_IFP_IMP_LAMBDA        (idx, [1:  14]) = [  7.60261E-01 0.04166  1.25449E-02 0.00154  3.12321E-02 0.00095  1.09887E-01 0.00085  3.16300E-01 0.00026  1.27661E+00 0.00535  8.11175E+00 0.01460 ];
ADJ_IFP_ANA_BETA_EFF      (idx, [1:  14]) = [  5.31360E-03 0.01786  1.91626E-04 0.10795  1.01351E-03 0.03953  8.42850E-04 0.04444  2.23724E-03 0.02795  7.62099E-04 0.04770  2.66267E-04 0.07703 ];
ADJ_IFP_ANA_LAMBDA        (idx, [1:  14]) = [  7.49517E-01 0.04084  1.25449E-02 0.00154  3.12342E-02 0.00095  1.09883E-01 0.00085  3.16300E-01 0.00026  1.27701E+00 0.00533  8.10449E+00 0.01465 ];
ADJ_IFP_ROSSI_ALPHA       (idx, [1:   2]) = [ -9.54763E+00 0.01846 ];

% Adjoint weighted time constants using perturbation technique:

ADJ_PERT_GEN_TIME         (idx, [1:   2]) = [  5.68301E-04 0.00058 ];
ADJ_PERT_LIFETIME         (idx, [1:   2]) = [  4.78384E-04 0.00047 ];
ADJ_PERT_BETA_EFF         (idx, [1:   2]) = [  5.32819E-03 0.00364 ];
ADJ_PERT_ROSSI_ALPHA      (idx, [1:   2]) = [ -9.38239E+00 0.00369 ];

% Inverse neutron speed :

ANA_INV_SPD               (idx, [1:   2]) = [  1.04795E-06 0.00024 ];

% Analog slowing-down and thermal neutron lifetime (total/prompt/delayed):

ANA_SLOW_TIME             (idx, [1:   6]) = [  3.56520E-05 9.0E-05  3.56511E-05 9.0E-05  3.58268E-05 0.00128 ];
ANA_THERM_TIME            (idx, [1:   6]) = [  7.70345E-04 0.00043  7.70540E-04 0.00043  7.32223E-04 0.00584 ];
ANA_THERM_FRAC            (idx, [1:   6]) = [  6.32521E-01 0.00018  6.33240E-01 0.00018  5.30237E-01 0.00522 ];
ANA_DELAYED_EMTIME        (idx, [1:   2]) = [  1.13895E+01 0.00732 ];
ANA_MEAN_NCOL             (idx, [1:   4]) = [  1.75089E+02 0.00025  1.73440E+02 0.00034 ];

% Group constant generation:

GC_UNIVERSE_NAME          (idx, [1:  1])  = '0' ;

% Micro- and macro-group structures:

MICRO_NG                  (idx, 1)        = 70 ;
MICRO_E                   (idx, [1:  71]) = [  1.00000E-11  5.00000E-09  1.00000E-08  1.50000E-08  2.00000E-08  2.50000E-08  3.00000E-08  3.50000E-08  4.20000E-08  5.00000E-08  5.80000E-08  6.70000E-08  8.00000E-08  1.00000E-07  1.40000E-07  1.80000E-07  2.20000E-07  2.50000E-07  2.80000E-07  3.00000E-07  3.20000E-07  3.50000E-07  4.00000E-07  5.00000E-07  6.25000E-07  7.80000E-07  8.50000E-07  9.10000E-07  9.50000E-07  9.72000E-07  9.96000E-07  1.02000E-06  1.04500E-06  1.07100E-06  1.09700E-06  1.12300E-06  1.15000E-06  1.30000E-06  1.50000E-06  1.85500E-06  2.10000E-06  2.60000E-06  3.30000E-06  4.00000E-06  9.87700E-06  1.59680E-05  2.77000E-05  4.80520E-05  7.55014E-05  1.48728E-04  3.67262E-04  9.06898E-04  1.42510E-03  2.23945E-03  3.51910E-03  5.50000E-03  9.11800E-03  1.50300E-02  2.47800E-02  4.08500E-02  6.74300E-02  1.11000E-01  1.83000E-01  3.02500E-01  5.00000E-01  8.21000E-01  1.35300E+00  2.23100E+00  3.67900E+00  6.06550E+00  2.00000E+01 ];

MACRO_NG                  (idx, 1)        = 2 ;
MACRO_E                   (idx, [1:   3]) = [  1.00000E+37  6.25000E-07  0.00000E+00 ];

% Micro-group spectrum:

INF_MICRO_FLX             (idx, [1: 140]) = [  8.67663E+04 0.00181  3.96997E+05 0.00075  9.17279E+05 0.00044  1.68412E+06 0.00024  1.88859E+06 0.00023  1.95562E+06 0.00015  1.46824E+06 0.00016  1.14800E+06 0.00017  1.63712E+06 0.00014  1.61717E+06 0.00012  1.75691E+06 9.6E-05  1.74612E+06 0.00011  1.90392E+06 0.00012  1.85784E+06 0.00011  1.86311E+06 0.00011  1.63438E+06 0.00012  1.64350E+06 0.00012  1.63339E+06 0.00012  1.62242E+06 0.00011  3.20933E+06 8.9E-05  3.14894E+06 0.00010  2.30395E+06 0.00012  1.49927E+06 0.00014  1.77960E+06 0.00016  1.70583E+06 0.00015  1.44509E+06 0.00018  2.52839E+06 0.00019  5.29956E+05 0.00030  6.62699E+05 0.00030  5.97176E+05 0.00029  3.51598E+05 0.00040  6.13146E+05 0.00032  4.20187E+05 0.00040  3.62621E+05 0.00037  6.97520E+04 0.00078  6.76843E+04 0.00072  6.75188E+04 0.00076  6.82300E+04 0.00075  6.83485E+04 0.00067  6.93221E+04 0.00077  7.31054E+04 0.00072  6.99341E+04 0.00067  1.34216E+05 0.00059  2.20466E+05 0.00048  2.96122E+05 0.00048  9.32222E+05 0.00036  1.41718E+06 0.00045  2.25025E+06 0.00052  1.85487E+06 0.00059  1.47091E+06 0.00062  1.16963E+06 0.00062  1.34239E+06 0.00064  2.39278E+06 0.00065  2.93305E+06 0.00067  4.86357E+06 0.00069  6.01814E+06 0.00069  6.98764E+06 0.00071  3.65434E+06 0.00071  2.32288E+06 0.00073  1.53715E+06 0.00074  1.30343E+06 0.00079  1.23370E+06 0.00073  9.50072E+05 0.00071  6.26383E+05 0.00081  5.32704E+05 0.00093  4.86424E+05 0.00093  4.02203E+05 0.00094  2.76141E+05 0.00096  1.81919E+05 0.00091  5.73795E+04 0.00151 ];

% Integral parameters:

INF_KINF                  (idx, [1:   2]) = [  8.56020E-01 0.00025 ];

% Flux spectra in infinite geometry:

INF_FLX                   (idx, [1:   4]) = [  5.74299E+21 0.00023  5.13370E+21 0.00071 ];
INF_FISS_FLX              (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reaction cross sections:

INF_TOT                   (idx, [1:   4]) = [  3.36777E-01 2.2E-05  3.87049E-01 7.0E-05 ];
INF_CAPT                  (idx, [1:   4]) = [  1.26676E-03 0.00039  1.47195E-03 0.00050 ];
INF_ABS                   (idx, [1:   4]) = [  1.44831E-03 0.00037  2.67204E-03 0.00056 ];
INF_FISS                  (idx, [1:   4]) = [  1.81551E-04 0.00046  1.20009E-03 0.00070 ];
INF_NSF                   (idx, [1:   4]) = [  4.57989E-04 0.00046  3.12798E-03 0.00070 ];
INF_NUBAR                 (idx, [1:   4]) = [  2.52265E+00 1.7E-05  2.60645E+00 1.2E-05 ];
INF_KAPPA                 (idx, [1:   4]) = [  2.03524E+02 3.0E-06  2.04688E+02 2.1E-06 ];
INF_INVV                  (idx, [1:   4]) = [  1.10544E-07 0.00014  2.09683E-06 4.7E-05 ];

% Total scattering cross sections:

INF_SCATT0                (idx, [1:   4]) = [  3.35328E-01 2.3E-05  3.84377E-01 7.3E-05 ];
INF_SCATT1                (idx, [1:   4]) = [  2.12601E-02 0.00023  1.13228E-02 0.00046 ];
INF_SCATT2                (idx, [1:   4]) = [  2.52336E-03 0.00155 -4.37734E-03 0.00099 ];
INF_SCATT3                (idx, [1:   4]) = [  4.90790E-04 0.00562 -4.02094E-03 0.00088 ];
INF_SCATT4                (idx, [1:   4]) = [ -1.28090E-04 0.02095 -4.63898E-03 0.00069 ];
INF_SCATT5                (idx, [1:   4]) = [  1.18134E-04 0.01968 -2.70452E-03 0.00103 ];
INF_SCATT6                (idx, [1:   4]) = [ -3.04284E-04 0.00728 -4.44052E-03 0.00066 ];
INF_SCATT7                (idx, [1:   4]) = [  1.19569E-04 0.01560 -6.15534E-04 0.00331 ];

% Total scattering production cross sections:

INF_SCATTP0               (idx, [1:   4]) = [  3.35364E-01 2.3E-05  3.84377E-01 7.3E-05 ];
INF_SCATTP1               (idx, [1:   4]) = [  2.12696E-02 0.00023  1.13228E-02 0.00046 ];
INF_SCATTP2               (idx, [1:   4]) = [  2.52512E-03 0.00155 -4.37734E-03 0.00099 ];
INF_SCATTP3               (idx, [1:   4]) = [  4.91021E-04 0.00563 -4.02094E-03 0.00088 ];
INF_SCATTP4               (idx, [1:   4]) = [ -1.28078E-04 0.02098 -4.63898E-03 0.00069 ];
INF_SCATTP5               (idx, [1:   4]) = [  1.18103E-04 0.01972 -2.70452E-03 0.00103 ];
INF_SCATTP6               (idx, [1:   4]) = [ -3.04283E-04 0.00728 -4.44052E-03 0.00066 ];
INF_SCATTP7               (idx, [1:   4]) = [  1.19545E-04 0.01564 -6.15534E-04 0.00331 ];

% Diffusion parameters:

INF_TRANSPXS              (idx, [1:   4]) = [  2.98518E-01 3.9E-05  3.74298E-01 7.2E-05 ];
INF_DIFFCOEF              (idx, [1:   4]) = [  1.11663E+00 3.9E-05  8.90557E-01 7.2E-05 ];

% Reduced absoption and removal:

INF_RABSXS                (idx, [1:   4]) = [  1.41244E-03 0.00039  2.67204E-03 0.00056 ];
INF_REMXS                 (idx, [1:   4]) = [  5.41667E-03 0.00016  4.39260E-03 0.00049 ];

% Poison cross sections:

INF_I135_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_XE135_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM147_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148M_YIELD          (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM149_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_SM149_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_I135_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_XE135_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM147_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148M_MICRO_ABS      (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM149_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_SM149_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_XE135_MACRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_SM149_MACRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Fission spectra:

INF_CHIT                  (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_CHIP                  (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_CHID                  (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Scattering matrixes:

INF_S0                    (idx, [1:   8]) = [  3.31360E-01 2.1E-05  3.96771E-03 0.00030  1.72084E-03 0.00049  3.82656E-01 7.3E-05 ];
INF_S1                    (idx, [1:   8]) = [  2.21368E-02 0.00022 -8.76712E-04 0.00051 -1.87934E-04 0.00174  1.15107E-02 0.00045 ];
INF_S2                    (idx, [1:   8]) = [  2.68308E-03 0.00142 -1.59724E-04 0.00232 -1.11516E-04 0.00245 -4.26583E-03 0.00102 ];
INF_S3                    (idx, [1:   8]) = [  5.32174E-04 0.00522 -4.13840E-05 0.00675 -3.94739E-05 0.00526 -3.98147E-03 0.00088 ];
INF_S4                    (idx, [1:   8]) = [ -9.45764E-05 0.02821 -3.35134E-05 0.00829 -2.48698E-05 0.00763 -4.61411E-03 0.00068 ];
INF_S5                    (idx, [1:   8]) = [  1.20696E-04 0.01930 -2.56239E-06 0.08212 -5.91377E-06 0.02701 -2.69861E-03 0.00104 ];
INF_S6                    (idx, [1:   8]) = [ -2.81712E-04 0.00780 -2.25722E-05 0.00986 -1.70374E-05 0.00926 -4.42348E-03 0.00066 ];
INF_S7                    (idx, [1:   8]) = [  1.00006E-04 0.01874  1.95627E-05 0.01043  7.24882E-06 0.01860 -6.22783E-04 0.00328 ];

% Scattering production matrixes:

INF_SP0                   (idx, [1:   8]) = [  3.31396E-01 2.1E-05  3.96771E-03 0.00030  1.72084E-03 0.00049  3.82656E-01 7.3E-05 ];
INF_SP1                   (idx, [1:   8]) = [  2.21464E-02 0.00022 -8.76712E-04 0.00051 -1.87934E-04 0.00174  1.15107E-02 0.00045 ];
INF_SP2                   (idx, [1:   8]) = [  2.68484E-03 0.00143 -1.59724E-04 0.00232 -1.11516E-04 0.00245 -4.26583E-03 0.00102 ];
INF_SP3                   (idx, [1:   8]) = [  5.32405E-04 0.00524 -4.13840E-05 0.00675 -3.94739E-05 0.00526 -3.98147E-03 0.00088 ];
INF_SP4                   (idx, [1:   8]) = [ -9.45641E-05 0.02826 -3.35134E-05 0.00829 -2.48698E-05 0.00763 -4.61411E-03 0.00068 ];
INF_SP5                   (idx, [1:   8]) = [  1.20666E-04 0.01934 -2.56239E-06 0.08212 -5.91377E-06 0.02701 -2.69861E-03 0.00104 ];
INF_SP6                   (idx, [1:   8]) = [ -2.81711E-04 0.00781 -2.25722E-05 0.00986 -1.70374E-05 0.00926 -4.42348E-03 0.00066 ];
INF_SP7                   (idx, [1:   8]) = [  9.99821E-05 0.01879  1.95627E-05 0.01043  7.24882E-06 0.01860 -6.22783E-04 0.00328 ];

% Micro-group spectrum:

B1_MICRO_FLX              (idx, [1: 140]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Integral parameters:

B1_KINF                   (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_KEFF                   (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_B2                     (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_ERR                    (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];

% Critical spectra in infinite geometry:

B1_FLX                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_FISS_FLX               (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reaction cross sections:

B1_TOT                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_CAPT                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_ABS                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_FISS                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_NSF                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_NUBAR                  (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_KAPPA                  (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_INVV                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Total scattering cross sections:

B1_SCATT0                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT1                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT2                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT3                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT4                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT5                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT6                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT7                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Total scattering production cross sections:

B1_SCATTP0                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP1                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP2                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP3                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP4                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP5                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP6                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP7                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Diffusion parameters:

B1_TRANSPXS               (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_DIFFCOEF               (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reduced absoption and removal:

B1_RABSXS                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_REMXS                  (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Poison cross sections:

B1_I135_YIELD             (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_XE135_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM147_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148M_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM149_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SM149_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_I135_MICRO_ABS         (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_XE135_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM147_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148M_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM149_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SM149_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_XE135_MACRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SM149_MACRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Fission spectra:

B1_CHIT                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_CHIP                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_CHID                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Scattering matrixes:

B1_S0                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S1                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S2                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S3                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S4                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S5                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S6                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S7                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Scattering production matrixes:

B1_SP0                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP1                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP2                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP3                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP4                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP5                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP6                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP7                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Additional diffusion parameters:

CMM_TRANSPXS              (idx, [1:   4]) = [  2.97388E-01 0.00023  4.34746E-01 0.00069 ];
CMM_TRANSPXS_X            (idx, [1:   4]) = [  2.98134E-01 0.00037  4.34189E-01 0.00098 ];
CMM_TRANSPXS_Y            (idx, [1:   4]) = [  2.97974E-01 0.00036  4.34377E-01 0.00099 ];
CMM_TRANSPXS_Z            (idx, [1:   4]) = [  2.96071E-01 0.00035  4.35755E-01 0.00115 ];
CMM_DIFFCOEF              (idx, [1:   4]) = [  1.12088E+00 0.00023  7.66767E-01 0.00069 ];
CMM_DIFFCOEF_X            (idx, [1:   4]) = [  1.11808E+00 0.00037  7.67788E-01 0.00097 ];
CMM_DIFFCOEF_Y            (idx, [1:   4]) = [  1.11868E+00 0.00036  7.67457E-01 0.00099 ];
CMM_DIFFCOEF_Z            (idx, [1:   4]) = [  1.12587E+00 0.00035  7.65055E-01 0.00115 ];

% Delayed neutron parameters (Meulekamp method):

BETA_EFF                  (idx, [1:  14]) = [  5.32881E-03 0.00469  1.63528E-04 0.02632  9.75366E-04 0.01083  8.68309E-04 0.01171  2.33988E-03 0.00700  7.28462E-04 0.01292  2.53261E-04 0.02185 ];
LAMBDA                    (idx, [1:  14]) = [  7.18266E-01 0.01151  1.25553E-02 0.00049  3.12363E-02 0.00032  1.09744E-01 0.00026  3.16453E-01 8.0E-05  1.28235E+00 0.00178  8.00203E+00 0.00509 ];

