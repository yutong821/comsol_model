
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
WORKING_DIRECTORY         (idx, [1: 55])  = '/global/home/users/xwa9860/FIG/res/temp_coef/flibe/1461' ;
HOSTNAME                  (idx, [1: 12])  = 'n0126.savio1' ;
CPU_TYPE                  (idx, [1: 41])  = 'Intel(R) Xeon(R) CPU E5-2670 v2 @ 2.50GHz' ;
CPU_MHZ                   (idx, 1)        = 1060.0 ;
START_DATE                (idx, [1: 24])  = 'Fri Jan 19 15:14:21 2018' ;
COMPLETE_DATE             (idx, [1: 24])  = 'Fri Jan 19 15:49:20 2018' ;

% Run parameters:

POP                       (idx, 1)        = 10000 ;
CYCLES                    (idx, 1)        = 2000 ;
SKIP                      (idx, 1)        = 500 ;
BATCH_INTERVAL            (idx, 1)        = 1 ;
SRC_NORM_MODE             (idx, 1)        = 2 ;
SEED                      (idx, 1)        = 1516403661 ;
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
OMP_HISTORY_PROFILE       (idx, [1:  20]) = [  1.01744E+00  9.89789E-01  1.01161E+00  9.84682E-01  9.80014E-01  1.00235E+00  1.00076E+00  9.93342E-01  9.96266E-01  1.01016E+00  1.00935E+00  9.91351E-01  9.88974E-01  9.96217E-01  1.00534E+00  1.00062E+00  1.01214E+00  9.91268E-01  1.02005E+00  9.98271E-01  ];
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
ST_FRAC                   (idx, [1:   4]) = [  9.48987E-02 0.00031  0.00000E+00 0.0E+00 ];
DT_FRAC                   (idx, [1:   4]) = [  9.05101E-01 3.2E-05  0.00000E+00 0.0E+00 ];
DT_EFF                    (idx, [1:   4]) = [  2.43017E-01 5.4E-05  0.00000E+00 0.0E+00 ];
REA_SAMPLING_EFF          (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
REA_SAMPLING_FAIL         (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_COL_EFF               (idx, [1:   4]) = [  2.48953E-01 5.4E-05  0.00000E+00 0.0E+00 ];
AVG_TRACKING_LOOPS        (idx, [1:   8]) = [  1.04442E+01 0.00033  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
AVG_TRACKS                (idx, [1:   4]) = [  1.87509E+02 0.00025  0.00000E+00 0.0E+00 ];
AVG_REAL_COL              (idx, [1:   4]) = [  1.87490E+02 0.00025  0.00000E+00 0.0E+00 ];
AVG_VIRT_COL              (idx, [1:   4]) = [  5.65645E+02 0.00031  0.00000E+00 0.0E+00 ];
AVG_SURF_CROSS            (idx, [1:   4]) = [  7.24490E+01 0.00022  0.00000E+00 0.0E+00 ];
LOST_PARTICLES            (idx, 1)        = 0 ;

% Run statistics:

CYCLE_IDX                 (idx, 1)        = 2000 ;
SOURCE_POPULATION         (idx, 1)        = 20003697 ;
MEAN_POP_SIZE             (idx, [1:  2])  = [  1.00018E+04 0.00043 ];
MEAN_POP_WGT              (idx, [1:  2])  = [  1.00018E+04 0.00043 ];
SIMULATION_COMPLETED      (idx, 1)        = 1 ;

% Running times:

TOT_CPU_TIME              (idx, 1)        =  6.85487E+02 ;
RUNNING_TIME              (idx, 1)        =  3.49882E+01 ;
INIT_TIME                 (idx, [1:  2])  = [  5.21500E-01  5.21500E-01 ];
PROCESS_TIME              (idx, [1:  2])  = [  1.96717E-01  1.96717E-01 ];
TRANSPORT_CYCLE_TIME      (idx, [1:  3])  = [  3.42700E+01  3.42700E+01  0.00000E+00 ];
MPI_OVERHEAD_TIME         (idx, [1:  2])  = [  0.00000E+00  0.00000E+00 ];
ESTIMATED_RUNNING_TIME    (idx, [1:  2])  = [  3.49881E+01  0.00000E+00 ];
CPU_USAGE                 (idx, 1)        = 19.59193 ;
TRANSPORT_CPU_USAGE       (idx, [1:   2]) = [  1.98685E+01 0.00011 ];
OMP_PARALLEL_FRAC         (idx, 1)        =  9.78479E-01 ;

% Memory usage:

AVAIL_MEM                 (idx, 1)        = 64497.80 ;
ALLOC_MEMSIZE             (idx, 1)        = 12385.41;
MEMSIZE                   (idx, 1)        = 8605.29;
XS_MEMSIZE                (idx, 1)        = 6770.58;
MAT_MEMSIZE               (idx, 1)        = 1698.82;
RES_MEMSIZE               (idx, 1)        = 1.99;
MISC_MEMSIZE              (idx, 1)        = 133.90;
UNKNOWN_MEMSIZE           (idx, 1)        = 0.00;
UNUSED_MEMSIZE            (idx, 1)        = 3780.12;

% Geometry parameters:

TOT_CELLS                 (idx, 1)        = 346 ;
UNION_CELLS               (idx, 1)        = 0 ;

% Neutron energy grid:

NEUTRON_ERG_TOL           (idx, 1)        =  0.00000E+00 ;
NEUTRON_ERG_NE            (idx, 1)        = 668617 ;
NEUTRON_EMIN              (idx, 1)        =  1.00000E-11 ;
NEUTRON_EMAX              (idx, 1)        =  2.00000E+01 ;

% Unresolved resonance probability table sampling:

URES_DILU_CUT             (idx, 1)        =  1.00000E-09 ;
URES_EMIN                 (idx, 1)        =  1.00000E-06 ;
URES_EMAX                 (idx, 1)        =  4.56970E-01 ;
URES_AVAIL                (idx, 1)        = 106 ;
URES_USED                 (idx, 1)        = 98 ;

% Nuclides and reaction channels:

TOT_NUCLIDES              (idx, 1)        = 159 ;
TOT_TRANSPORT_NUCLIDES    (idx, 1)        = 159 ;
TOT_DOSIMETRY_NUCLIDES    (idx, 1)        = 0 ;
TOT_DECAY_NUCLIDES        (idx, 1)        = 0 ;
TOT_PHOTON_NUCLIDES       (idx, 1)        = 0 ;
TOT_REA_CHANNELS          (idx, 1)        = 4506 ;
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

NORM_COEF                 (idx, [1:   4]) = [  1.97055E+15 0.00023  0.00000E+00 0.0E+00 ];

% Analog reaction rate estimators:

CONVERSION_RATIO          (idx, [1:   2]) = [  4.45842E-01 0.00056 ];
U235_FISS                 (idx, [1:   4]) = [  4.48179E+18 0.00041  6.22838E-01 0.00029 ];
U238_FISS                 (idx, [1:   4]) = [  1.91647E+16 0.00708  2.66376E-03 0.00708 ];
PU239_FISS                (idx, [1:   4]) = [  2.09142E+18 0.00065  2.90649E-01 0.00059 ];
PU240_FISS                (idx, [1:   4]) = [  9.59335E+14 0.03219  1.33291E-04 0.03219 ];
PU241_FISS                (idx, [1:   4]) = [  5.94502E+17 0.00131  8.26186E-02 0.00127 ];
U235_CAPT                 (idx, [1:   4]) = [  1.08962E+18 0.00092  8.85061E-02 0.00090 ];
U238_CAPT                 (idx, [1:   4]) = [  3.27357E+18 0.00062  2.65871E-01 0.00048 ];
PU239_CAPT                (idx, [1:   4]) = [  1.29264E+18 0.00086  1.04998E-01 0.00084 ];
PU240_CAPT                (idx, [1:   4]) = [  1.07332E+18 0.00098  8.71751E-02 0.00092 ];
PU241_CAPT                (idx, [1:   4]) = [  2.35124E+17 0.00203  1.90976E-02 0.00202 ];
XE135_CAPT                (idx, [1:   4]) = [  2.70999E+17 0.00188  2.20125E-02 0.00187 ];
SM149_CAPT                (idx, [1:   4]) = [  1.15743E+17 0.00282  9.40146E-03 0.00281 ];

% Neutron balance (particles/weight):

BALA_SRC_NEUTRON_SRC        (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_SRC_NEUTRON_FISS       (idx, [1:  2])  = [ 20003697 2.00000E+07 ];
BALA_SRC_NEUTRON_NXN        (idx, [1:  2])  = [ 0 1.73483E+05 ];
BALA_SRC_NEUTRON_VR         (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_SRC_NEUTRON_TOT        (idx, [1:  2])  = [ 20003697 2.01735E+07 ];

BALA_LOSS_NEUTRON_CAPT       (idx, [1:  2])  = [ 12390151 1.24959E+07 ];
BALA_LOSS_NEUTRON_FISS       (idx, [1:  2])  = [ 7242428 7.30375E+06 ];
BALA_LOSS_NEUTRON_LEAK       (idx, [1:  2])  = [ 371118 3.73877E+05 ];
BALA_LOSS_NEUTRON_CUT        (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_LOSS_NEUTRON_TOT        (idx, [1:  2])  = [ 20003697 2.01735E+07 ];

BALA_NEUTRON_DIFF            (idx, [1:  2])  = [ 0 -7.07805E-08 ];

% Normalized total reaction rates (neutrons):

TOT_POWER                 (idx, [1:   2]) = [  2.36000E+08 0.0E+00 ];
TOT_POWDENS               (idx, [1:   2]) = [  5.99520E+06 0.0E+00 ];
TOT_GENRATE               (idx, [1:   2]) = [  1.87424E+19 8.5E-06 ];
TOT_FISSRATE              (idx, [1:   2]) = [  7.19764E+18 1.9E-06 ];
TOT_CAPTRATE              (idx, [1:   2]) = [  1.23110E+19 0.00027 ];
TOT_ABSRATE               (idx, [1:   2]) = [  1.95086E+19 0.00017 ];
TOT_SRCRATE               (idx, [1:   2]) = [  1.97055E+19 0.00023 ];
TOT_FLUX                  (idx, [1:   2]) = [  1.05327E+22 0.00030 ];
TOT_PHOTON_PRODRATE       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_LEAKRATE              (idx, [1:   2]) = [  3.68426E+17 0.00224 ];
ALBEDO_LEAKRATE           (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_LOSSRATE              (idx, [1:   2]) = [  1.98770E+19 0.00018 ];
TOT_CUTRATE               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_RR                    (idx, [1:   2]) = [  3.72559E+21 0.00032 ];
INI_FMASS                 (idx, 1)        =  3.93648E-05 ;
TOT_FMASS                 (idx, 1)        =  3.93648E-05 ;

% Fission neutron and energy production:

NUBAR                     (idx, [1:   2]) = [  2.60396E+00 1.0E-05 ];
FISSE                     (idx, [1:   2]) = [  2.04650E+02 1.9E-06 ];

% Criticality eigenvalues:

ANA_KEFF                  (idx, [1:   6]) = [  9.50896E-01 0.00031  9.46128E-01 0.00031  4.80980E-03 0.00526 ];
IMP_KEFF                  (idx, [1:   2]) = [  9.51144E-01 0.00018 ];
COL_KEFF                  (idx, [1:   2]) = [  9.51228E-01 0.00023 ];
ABS_KEFF                  (idx, [1:   2]) = [  9.51144E-01 0.00018 ];
ABS_KINF                  (idx, [1:   2]) = [  9.69261E-01 0.00017 ];
GEOM_ALBEDO               (idx, [1:   6]) = [  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00 ];

% ALF (Average lethargy of neutrons causing fission):
% Based on E0 = 2.000000E+01 MeV

ANA_ALF                   (idx, [1:   2]) = [  1.79538E+01 4.8E-05 ];
IMP_ALF                   (idx, [1:   2]) = [  1.79541E+01 2.2E-05 ];

% EALF (Energy corresponding to average lethargy of neutrons causing fission):

ANA_EALF                  (idx, [1:   2]) = [  3.19237E-07 0.00087 ];
IMP_EALF                  (idx, [1:   2]) = [  3.18971E-07 0.00040 ];

% AFGE (Average energy of neutrons causing fission):

ANA_AFGE                  (idx, [1:   2]) = [  1.17577E-02 0.00606 ];
IMP_AFGE                  (idx, [1:   2]) = [  1.16890E-02 0.00154 ];

% Forward-weighted delayed neutron parameters:

FWD_ANA_BETA_ZERO         (idx, [1:  14]) = [  5.41918E-03 0.00330  1.63939E-04 0.01797  1.00646E-03 0.00749  8.84698E-04 0.00789  2.38227E-03 0.00493  7.35628E-04 0.00846  2.46184E-04 0.01483 ];
FWD_ANA_LAMBDA            (idx, [1:  14]) = [  6.98862E-01 0.00766  9.98889E-03 0.01137  3.12099E-02 0.00022  1.09725E-01 0.00018  3.16453E-01 5.8E-05  1.27704E+00 0.00169  7.13348E+00 0.00886 ];

% Beta-eff using Meulekamp's method:

ADJ_MEULEKAMP_BETA_EFF    (idx, [1:  14]) = [  5.06846E-03 0.00448  1.50998E-04 0.02619  9.38187E-04 0.01087  8.38527E-04 0.01120  2.22426E-03 0.00681  6.84977E-04 0.01198  2.31521E-04 0.02143 ];
ADJ_MEULEKAMP_LAMBDA      (idx, [1:  14]) = [  7.00858E-01 0.01097  1.25637E-02 0.00051  3.12122E-02 0.00031  1.09705E-01 0.00025  3.16473E-01 8.7E-05  1.28005E+00 0.00176  8.02062E+00 0.00503 ];

% Adjoint weighted time constants using Nauchi's method:

ADJ_NAUCHI_GEN_TIME       (idx, [1:   6]) = [  5.75534E-04 0.00082  5.75633E-04 0.00082  5.54762E-04 0.01097 ];
ADJ_NAUCHI_LIFETIME       (idx, [1:   6]) = [  5.47165E-04 0.00075  5.47259E-04 0.00075  5.27490E-04 0.01097 ];
ADJ_NAUCHI_BETA_EFF       (idx, [1:  14]) = [  5.05154E-03 0.00533  1.47598E-04 0.03027  9.42312E-04 0.01228  8.30273E-04 0.01290  2.20804E-03 0.00810  6.94819E-04 0.01395  2.28496E-04 0.02460 ];
ADJ_NAUCHI_LAMBDA         (idx, [1:  14]) = [  7.01635E-01 0.01294  1.25506E-02 0.00065  3.12204E-02 0.00040  1.09710E-01 0.00032  3.16454E-01 0.00011  1.28330E+00 0.00213  7.94878E+00 0.00691 ];

% Adjoint weighted time constants using IFP:

ADJ_IFP_GEN_TIME          (idx, [1:   6]) = [  5.55773E-04 0.00196  5.55829E-04 0.00197  4.86580E-04 0.02645 ];
ADJ_IFP_LIFETIME          (idx, [1:   6]) = [  5.28390E-04 0.00194  5.28444E-04 0.00195  4.62614E-04 0.02644 ];
ADJ_IFP_IMP_BETA_EFF      (idx, [1:  14]) = [  5.05710E-03 0.01775  1.38990E-04 0.11351  9.54639E-04 0.04121  8.55902E-04 0.04290  2.20156E-03 0.02654  6.79758E-04 0.04930  2.26251E-04 0.08458 ];
ADJ_IFP_IMP_LAMBDA        (idx, [1:  14]) = [  6.87120E-01 0.04204  1.25606E-02 0.00175  3.11636E-02 0.00094  1.09761E-01 0.00076  3.16499E-01 0.00027  1.26791E+00 0.00556  8.10451E+00 0.01589 ];
ADJ_IFP_ANA_BETA_EFF      (idx, [1:  14]) = [  5.02351E-03 0.01733  1.35867E-04 0.11153  9.46518E-04 0.04053  8.45274E-04 0.04213  2.19544E-03 0.02597  6.77034E-04 0.04837  2.23382E-04 0.08391 ];
ADJ_IFP_ANA_LAMBDA        (idx, [1:  14]) = [  6.84871E-01 0.04163  1.25606E-02 0.00175  3.11661E-02 0.00094  1.09758E-01 0.00076  3.16490E-01 0.00027  1.26879E+00 0.00551  8.10412E+00 0.01590 ];
ADJ_IFP_ROSSI_ALPHA       (idx, [1:   2]) = [ -9.19380E+00 0.01801 ];

% Adjoint weighted time constants using perturbation technique:

ADJ_PERT_GEN_TIME         (idx, [1:   2]) = [  5.65576E-04 0.00049 ];
ADJ_PERT_LIFETIME         (idx, [1:   2]) = [  5.37699E-04 0.00038 ];
ADJ_PERT_BETA_EFF         (idx, [1:   2]) = [  5.06986E-03 0.00330 ];
ADJ_PERT_ROSSI_ALPHA      (idx, [1:   2]) = [ -8.96820E+00 0.00334 ];

% Inverse neutron speed :

ANA_INV_SPD               (idx, [1:   2]) = [  1.05802E-06 0.00022 ];

% Analog slowing-down and thermal neutron lifetime (total/prompt/delayed):

ANA_SLOW_TIME             (idx, [1:   6]) = [  3.65918E-05 9.1E-05  3.65909E-05 9.2E-05  3.67934E-05 0.00131 ];
ANA_THERM_TIME            (idx, [1:   6]) = [  8.14490E-04 0.00041  8.14674E-04 0.00041  7.77091E-04 0.00581 ];
ANA_THERM_FRAC            (idx, [1:   6]) = [  6.59891E-01 0.00017  6.60191E-01 0.00017  6.19117E-01 0.00527 ];
ANA_DELAYED_EMTIME        (idx, [1:   2]) = [  1.13407E+01 0.00741 ];
ANA_MEAN_NCOL             (idx, [1:   4]) = [  1.87490E+02 0.00025  1.90053E+02 0.00032 ];

% Group constant generation:

GC_UNIVERSE_NAME          (idx, [1:  1])  = '0' ;

% Micro- and macro-group structures:

MICRO_NG                  (idx, 1)        = 70 ;
MICRO_E                   (idx, [1:  71]) = [  1.00000E-11  5.00000E-09  1.00000E-08  1.50000E-08  2.00000E-08  2.50000E-08  3.00000E-08  3.50000E-08  4.20000E-08  5.00000E-08  5.80000E-08  6.70000E-08  8.00000E-08  1.00000E-07  1.40000E-07  1.80000E-07  2.20000E-07  2.50000E-07  2.80000E-07  3.00000E-07  3.20000E-07  3.50000E-07  4.00000E-07  5.00000E-07  6.25000E-07  7.80000E-07  8.50000E-07  9.10000E-07  9.50000E-07  9.72000E-07  9.96000E-07  1.02000E-06  1.04500E-06  1.07100E-06  1.09700E-06  1.12300E-06  1.15000E-06  1.30000E-06  1.50000E-06  1.85500E-06  2.10000E-06  2.60000E-06  3.30000E-06  4.00000E-06  9.87700E-06  1.59680E-05  2.77000E-05  4.80520E-05  7.55014E-05  1.48728E-04  3.67262E-04  9.06898E-04  1.42510E-03  2.23945E-03  3.51910E-03  5.50000E-03  9.11800E-03  1.50300E-02  2.47800E-02  4.08500E-02  6.74300E-02  1.11000E-01  1.83000E-01  3.02500E-01  5.00000E-01  8.21000E-01  1.35300E+00  2.23100E+00  3.67900E+00  6.06550E+00  2.00000E+01 ];

MACRO_NG                  (idx, 1)        = 2 ;
MACRO_E                   (idx, [1:   3]) = [  1.00000E+37  6.25000E-07  0.00000E+00 ];

% Micro-group spectrum:

INF_MICRO_FLX             (idx, [1: 140]) = [  9.23873E+04 0.00156  4.22357E+05 0.00074  9.71546E+05 0.00039  1.79046E+06 0.00026  2.00210E+06 0.00019  2.05760E+06 0.00014  1.56978E+06 0.00013  1.23905E+06 0.00018  1.71714E+06 0.00015  1.69424E+06 0.00012  1.82575E+06 0.00010  1.81243E+06 0.00011  1.96611E+06 0.00011  1.92060E+06 0.00012  1.92804E+06 0.00013  1.69276E+06 0.00011  1.70446E+06 0.00013  1.69641E+06 0.00012  1.68737E+06 0.00012  3.34521E+06 9.1E-05  3.29203E+06 0.00011  2.41452E+06 0.00012  1.57433E+06 0.00013  1.87437E+06 0.00013  1.79361E+06 0.00013  1.52495E+06 0.00016  2.67665E+06 0.00015  5.66608E+05 0.00026  7.09627E+05 0.00025  6.41923E+05 0.00027  3.79770E+05 0.00036  6.65619E+05 0.00030  4.59323E+05 0.00034  3.99640E+05 0.00035  7.76347E+04 0.00070  7.55289E+04 0.00075  7.57358E+04 0.00071  7.70024E+04 0.00075  7.74070E+04 0.00078  7.91353E+04 0.00072  8.40647E+04 0.00065  8.11065E+04 0.00074  1.56946E+05 0.00049  2.63030E+05 0.00042  3.63434E+05 0.00038  1.20447E+06 0.00031  1.88083E+06 0.00035  2.91446E+06 0.00043  2.32618E+06 0.00049  1.80473E+06 0.00053  1.41202E+06 0.00054  1.60275E+06 0.00057  2.81864E+06 0.00057  3.39089E+06 0.00057  5.50752E+06 0.00061  6.66551E+06 0.00064  7.57205E+06 0.00065  3.89994E+06 0.00071  2.45885E+06 0.00068  1.61841E+06 0.00071  1.36791E+06 0.00070  1.29235E+06 0.00075  9.89298E+05 0.00074  6.52196E+05 0.00084  5.50345E+05 0.00087  5.05714E+05 0.00089  4.18034E+05 0.00086  2.83556E+05 0.00084  1.87409E+05 0.00099  5.86551E+04 0.00135 ];

% Integral parameters:

INF_KINF                  (idx, [1:   2]) = [  9.69349E-01 0.00024 ];

% Flux spectra in infinite geometry:

INF_FLX                   (idx, [1:   4]) = [  5.39184E+21 0.00024  5.14100E+21 0.00068 ];
INF_FISS_FLX              (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reaction cross sections:

INF_TOT                   (idx, [1:   4]) = [  3.25869E-01 2.4E-05  3.82922E-01 6.3E-05 ];
INF_CAPT                  (idx, [1:   4]) = [  1.10022E-03 0.00036  1.24083E-03 0.00048 ];
INF_ABS                   (idx, [1:   4]) = [  1.28306E-03 0.00034  2.44932E-03 0.00055 ];
INF_FISS                  (idx, [1:   4]) = [  1.82838E-04 0.00044  1.20849E-03 0.00068 ];
INF_NSF                   (idx, [1:   4]) = [  4.61121E-04 0.00043  3.16256E-03 0.00068 ];
INF_NUBAR                 (idx, [1:   4]) = [  2.52201E+00 1.5E-05  2.61696E+00 1.1E-05 ];
INF_KAPPA                 (idx, [1:   4]) = [  2.03513E+02 2.7E-06  2.04830E+02 2.0E-06 ];
INF_INVV                  (idx, [1:   4]) = [  1.16560E-07 9.7E-05  2.04561E-06 5.2E-05 ];

% Total scattering cross sections:

INF_SCATT0                (idx, [1:   4]) = [  3.24586E-01 2.4E-05  3.80473E-01 6.6E-05 ];
INF_SCATT1                (idx, [1:   4]) = [  2.05545E-02 0.00022  1.13245E-02 0.00044 ];
INF_SCATT2                (idx, [1:   4]) = [  2.35458E-03 0.00165 -4.31341E-03 0.00112 ];
INF_SCATT3                (idx, [1:   4]) = [  4.49829E-04 0.00743 -3.98344E-03 0.00079 ];
INF_SCATT4                (idx, [1:   4]) = [ -1.59960E-04 0.01749 -4.69602E-03 0.00059 ];
INF_SCATT5                (idx, [1:   4]) = [  1.14016E-04 0.01930 -2.69380E-03 0.00088 ];
INF_SCATT6                (idx, [1:   4]) = [ -3.45342E-04 0.00602 -4.57085E-03 0.00051 ];
INF_SCATT7                (idx, [1:   4]) = [  1.41759E-04 0.01489 -5.91511E-04 0.00364 ];

% Total scattering production cross sections:

INF_SCATTP0               (idx, [1:   4]) = [  3.24618E-01 2.4E-05  3.80473E-01 6.6E-05 ];
INF_SCATTP1               (idx, [1:   4]) = [  2.05628E-02 0.00022  1.13245E-02 0.00044 ];
INF_SCATTP2               (idx, [1:   4]) = [  2.35611E-03 0.00164 -4.31341E-03 0.00112 ];
INF_SCATTP3               (idx, [1:   4]) = [  4.50026E-04 0.00742 -3.98344E-03 0.00079 ];
INF_SCATTP4               (idx, [1:   4]) = [ -1.59984E-04 0.01751 -4.69602E-03 0.00059 ];
INF_SCATTP5               (idx, [1:   4]) = [  1.13982E-04 0.01929 -2.69380E-03 0.00088 ];
INF_SCATTP6               (idx, [1:   4]) = [ -3.45393E-04 0.00603 -4.57085E-03 0.00051 ];
INF_SCATTP7               (idx, [1:   4]) = [  1.41726E-04 0.01487 -5.91511E-04 0.00364 ];

% Diffusion parameters:

INF_TRANSPXS              (idx, [1:   4]) = [  2.88117E-01 3.5E-05  3.69873E-01 6.5E-05 ];
INF_DIFFCOEF              (idx, [1:   4]) = [  1.15694E+00 3.5E-05  9.01211E-01 6.5E-05 ];

% Reduced absoption and removal:

INF_RABSXS                (idx, [1:   4]) = [  1.25136E-03 0.00035  2.44932E-03 0.00055 ];
INF_REMXS                 (idx, [1:   4]) = [  5.93921E-03 0.00016  4.83532E-03 0.00052 ];

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

INF_S0                    (idx, [1:   8]) = [  3.19930E-01 2.3E-05  4.65619E-03 0.00023  2.38626E-03 0.00054  3.78086E-01 6.8E-05 ];
INF_S1                    (idx, [1:   8]) = [  2.15278E-02 0.00021 -9.73327E-04 0.00053 -2.94161E-04 0.00126  1.16187E-02 0.00043 ];
INF_S2                    (idx, [1:   8]) = [  2.55434E-03 0.00150 -1.99758E-04 0.00219 -1.46189E-04 0.00216 -4.16722E-03 0.00117 ];
INF_S3                    (idx, [1:   8]) = [  5.04936E-04 0.00662 -5.51069E-05 0.00604 -4.98058E-05 0.00482 -3.93363E-03 0.00080 ];
INF_S4                    (idx, [1:   8]) = [ -1.17651E-04 0.02360 -4.23087E-05 0.00700 -3.18206E-05 0.00692 -4.66420E-03 0.00059 ];
INF_S5                    (idx, [1:   8]) = [  1.18261E-04 0.01844 -4.24500E-06 0.05964 -7.84253E-06 0.02429 -2.68596E-03 0.00087 ];
INF_S6                    (idx, [1:   8]) = [ -3.16743E-04 0.00661 -2.85995E-05 0.00919 -2.14927E-05 0.00784 -4.54935E-03 0.00051 ];
INF_S7                    (idx, [1:   8]) = [  1.18045E-04 0.01765  2.37143E-05 0.00886  9.37580E-06 0.01818 -6.00887E-04 0.00356 ];

% Scattering production matrixes:

INF_SP0                   (idx, [1:   8]) = [  3.19962E-01 2.3E-05  4.65619E-03 0.00023  2.38626E-03 0.00054  3.78086E-01 6.8E-05 ];
INF_SP1                   (idx, [1:   8]) = [  2.15362E-02 0.00021 -9.73327E-04 0.00053 -2.94161E-04 0.00126  1.16187E-02 0.00043 ];
INF_SP2                   (idx, [1:   8]) = [  2.55587E-03 0.00150 -1.99758E-04 0.00219 -1.46189E-04 0.00216 -4.16722E-03 0.00117 ];
INF_SP3                   (idx, [1:   8]) = [  5.05133E-04 0.00662 -5.51069E-05 0.00604 -4.98058E-05 0.00482 -3.93363E-03 0.00080 ];
INF_SP4                   (idx, [1:   8]) = [ -1.17676E-04 0.02362 -4.23087E-05 0.00700 -3.18206E-05 0.00692 -4.66420E-03 0.00059 ];
INF_SP5                   (idx, [1:   8]) = [  1.18227E-04 0.01844 -4.24500E-06 0.05964 -7.84253E-06 0.02429 -2.68596E-03 0.00087 ];
INF_SP6                   (idx, [1:   8]) = [ -3.16794E-04 0.00661 -2.85995E-05 0.00919 -2.14927E-05 0.00784 -4.54935E-03 0.00051 ];
INF_SP7                   (idx, [1:   8]) = [  1.18012E-04 0.01762  2.37143E-05 0.00886  9.37580E-06 0.01818 -6.00887E-04 0.00356 ];

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

CMM_TRANSPXS              (idx, [1:   4]) = [  2.86581E-01 0.00023  4.28244E-01 0.00069 ];
CMM_TRANSPXS_X            (idx, [1:   4]) = [  2.87233E-01 0.00038  4.22658E-01 0.00099 ];
CMM_TRANSPXS_Y            (idx, [1:   4]) = [  2.87115E-01 0.00038  4.22695E-01 0.00097 ];
CMM_TRANSPXS_Z            (idx, [1:   4]) = [  2.85410E-01 0.00033  4.39911E-01 0.00115 ];
CMM_DIFFCOEF              (idx, [1:   4]) = [  1.16314E+00 0.00023  7.78409E-01 0.00069 ];
CMM_DIFFCOEF_X            (idx, [1:   4]) = [  1.16052E+00 0.00038  7.88735E-01 0.00098 ];
CMM_DIFFCOEF_Y            (idx, [1:   4]) = [  1.16099E+00 0.00038  7.88663E-01 0.00097 ];
CMM_DIFFCOEF_Z            (idx, [1:   4]) = [  1.16792E+00 0.00033  7.57829E-01 0.00115 ];

% Delayed neutron parameters (Meulekamp method):

BETA_EFF                  (idx, [1:  14]) = [  5.06846E-03 0.00448  1.50998E-04 0.02619  9.38187E-04 0.01087  8.38527E-04 0.01120  2.22426E-03 0.00681  6.84977E-04 0.01198  2.31521E-04 0.02143 ];
LAMBDA                    (idx, [1:  14]) = [  7.00858E-01 0.01097  1.25637E-02 0.00051  3.12122E-02 0.00031  1.09705E-01 0.00025  3.16473E-01 8.7E-05  1.28005E+00 0.00176  8.02062E+00 0.00503 ];

