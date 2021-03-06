
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
WORKING_DIRECTORY         (idx, [1: 54])  = '/global/home/users/xwa9860/FIG/res/temp_coef/flibe/846' ;
HOSTNAME                  (idx, [1: 12])  = 'n0100.savio1' ;
CPU_TYPE                  (idx, [1: 41])  = 'Intel(R) Xeon(R) CPU E5-2670 v2 @ 2.50GHz' ;
CPU_MHZ                   (idx, 1)        = 1046.0 ;
START_DATE                (idx, [1: 24])  = 'Fri Jan 19 15:14:31 2018' ;
COMPLETE_DATE             (idx, [1: 24])  = 'Fri Jan 19 15:48:26 2018' ;

% Run parameters:

POP                       (idx, 1)        = 10000 ;
CYCLES                    (idx, 1)        = 2000 ;
SKIP                      (idx, 1)        = 500 ;
BATCH_INTERVAL            (idx, 1)        = 1 ;
SRC_NORM_MODE             (idx, 1)        = 2 ;
SEED                      (idx, 1)        = 1516403671 ;
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
OMP_HISTORY_PROFILE       (idx, [1:  20]) = [  1.01283E+00  9.92452E-01  9.82656E-01  9.86844E-01  1.02171E+00  9.80634E-01  1.01555E+00  9.97349E-01  9.98592E-01  9.86331E-01  1.02159E+00  9.97981E-01  1.01272E+00  1.00109E+00  1.01406E+00  9.80266E-01  1.01714E+00  9.80615E-01  9.92293E-01  1.00728E+00  ];
SHARE_BUF_ARRAY           (idx, 1)        = 0 ;
SHARE_RES2_ARRAY          (idx, 1)        = 1 ;

% File paths:

XS_DATA_FILE_PATH         (idx, [1: 71])  = '/global/home/groups/ac_nuclear/serpent/xsdata/endfb7/sss_endfb7u.xsdata' ;
DECAY_DATA_FILE_PATH      (idx, [1:  3])  = 'N/A' ;
SFY_DATA_FILE_PATH        (idx, [1:  3])  = 'N/A' ;
NFY_DATA_FILE_PATH        (idx, [1:  3])  = 'N/A' ;
BRA_DATA_FILE_PATH        (idx, [1:  3])  = 'N/A' ;

% Collision and reaction sampling (neutrons/photons):

MIN_MACROXS               (idx, [1:   4]) = [  5.00000E-02 1.1E-09  0.00000E+00 0.0E+00 ];
DT_THRESH                 (idx, [1:  2])  = [  9.00000E-01  9.00000E-01 ];
ST_FRAC                   (idx, [1:   4]) = [  8.41848E-02 0.00033  0.00000E+00 0.0E+00 ];
DT_FRAC                   (idx, [1:   4]) = [  9.15815E-01 3.0E-05  0.00000E+00 0.0E+00 ];
DT_EFF                    (idx, [1:   4]) = [  2.45746E-01 5.7E-05  0.00000E+00 0.0E+00 ];
REA_SAMPLING_EFF          (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
REA_SAMPLING_FAIL         (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_COL_EFF               (idx, [1:   4]) = [  2.50897E-01 5.7E-05  0.00000E+00 0.0E+00 ];
AVG_TRACKING_LOOPS        (idx, [1:   8]) = [  1.02416E+01 0.00033  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
AVG_TRACKS                (idx, [1:   4]) = [  1.83976E+02 0.00024  0.00000E+00 0.0E+00 ];
AVG_REAL_COL              (idx, [1:   4]) = [  1.83959E+02 0.00024  0.00000E+00 0.0E+00 ];
AVG_VIRT_COL              (idx, [1:   4]) = [  5.49268E+02 0.00031  0.00000E+00 0.0E+00 ];
AVG_SURF_CROSS            (idx, [1:   4]) = [  6.19420E+01 0.00024  0.00000E+00 0.0E+00 ];
LOST_PARTICLES            (idx, 1)        = 0 ;

% Run statistics:

CYCLE_IDX                 (idx, 1)        = 2000 ;
SOURCE_POPULATION         (idx, 1)        = 20003409 ;
MEAN_POP_SIZE             (idx, [1:  2])  = [  1.00017E+04 0.00042 ];
MEAN_POP_WGT              (idx, [1:  2])  = [  1.00017E+04 0.00042 ];
SIMULATION_COMPLETED      (idx, 1)        = 1 ;

% Running times:

TOT_CPU_TIME              (idx, 1)        =  6.64175E+02 ;
RUNNING_TIME              (idx, 1)        =  3.39069E+01 ;
INIT_TIME                 (idx, [1:  2])  = [  5.09733E-01  5.09733E-01 ];
PROCESS_TIME              (idx, [1:  2])  = [  1.92800E-01  1.92783E-01 ];
TRANSPORT_CYCLE_TIME      (idx, [1:  3])  = [  3.32043E+01  3.32043E+01  0.00000E+00 ];
MPI_OVERHEAD_TIME         (idx, [1:  2])  = [  0.00000E+00  0.00000E+00 ];
ESTIMATED_RUNNING_TIME    (idx, [1:  2])  = [  3.39067E+01  0.00000E+00 ];
CPU_USAGE                 (idx, 1)        = 19.58821 ;
TRANSPORT_CPU_USAGE       (idx, [1:   2]) = [  1.98670E+01 0.00010 ];
OMP_PARALLEL_FRAC         (idx, 1)        =  9.78272E-01 ;

% Memory usage:

AVAIL_MEM                 (idx, 1)        = 64497.81 ;
ALLOC_MEMSIZE             (idx, 1)        = 12385.37;
MEMSIZE                   (idx, 1)        = 8605.24;
XS_MEMSIZE                (idx, 1)        = 6770.54;
MAT_MEMSIZE               (idx, 1)        = 1698.81;
RES_MEMSIZE               (idx, 1)        = 1.99;
MISC_MEMSIZE              (idx, 1)        = 133.90;
UNKNOWN_MEMSIZE           (idx, 1)        = 0.00;
UNUSED_MEMSIZE            (idx, 1)        = 3780.12;

% Geometry parameters:

TOT_CELLS                 (idx, 1)        = 346 ;
UNION_CELLS               (idx, 1)        = 0 ;

% Neutron energy grid:

NEUTRON_ERG_TOL           (idx, 1)        =  0.00000E+00 ;
NEUTRON_ERG_NE            (idx, 1)        = 668613 ;
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

NORM_COEF                 (idx, [1:   4]) = [  1.94300E+15 0.00024  0.00000E+00 0.0E+00 ];

% Analog reaction rate estimators:

CONVERSION_RATIO          (idx, [1:   2]) = [  4.35706E-01 0.00058 ];
U235_FISS                 (idx, [1:   4]) = [  4.59882E+18 0.00039  6.38436E-01 0.00027 ];
U238_FISS                 (idx, [1:   4]) = [  1.75904E+16 0.00735  2.44130E-03 0.00732 ];
PU239_FISS                (idx, [1:   4]) = [  1.98153E+18 0.00065  2.75091E-01 0.00059 ];
PU240_FISS                (idx, [1:   4]) = [  9.46771E+14 0.03218  1.31417E-04 0.03218 ];
PU241_FISS                (idx, [1:   4]) = [  5.96507E+17 0.00125  8.28125E-02 0.00123 ];
U235_CAPT                 (idx, [1:   4]) = [  1.09794E+18 0.00094  9.08997E-02 0.00091 ];
U238_CAPT                 (idx, [1:   4]) = [  3.21366E+18 0.00062  2.66033E-01 0.00048 ];
PU239_CAPT                (idx, [1:   4]) = [  1.20948E+18 0.00088  1.00138E-01 0.00088 ];
PU240_CAPT                (idx, [1:   4]) = [  1.00199E+18 0.00103  8.29502E-02 0.00097 ];
PU241_CAPT                (idx, [1:   4]) = [  2.30066E+17 0.00209  1.90470E-02 0.00207 ];
XE135_CAPT                (idx, [1:   4]) = [  3.05158E+17 0.00172  2.52658E-02 0.00172 ];
SM149_CAPT                (idx, [1:   4]) = [  1.27909E+17 0.00278  1.05905E-02 0.00279 ];

% Neutron balance (particles/weight):

BALA_SRC_NEUTRON_SRC        (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_SRC_NEUTRON_FISS       (idx, [1:  2])  = [ 20003409 2.00000E+07 ];
BALA_SRC_NEUTRON_NXN        (idx, [1:  2])  = [ 0 1.87927E+05 ];
BALA_SRC_NEUTRON_VR         (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_SRC_NEUTRON_TOT        (idx, [1:  2])  = [ 20003409 2.01879E+07 ];

BALA_LOSS_NEUTRON_CAPT       (idx, [1:  2])  = [ 12319512 1.24334E+07 ];
BALA_LOSS_NEUTRON_FISS       (idx, [1:  2])  = [ 7347277 7.41504E+06 ];
BALA_LOSS_NEUTRON_LEAK       (idx, [1:  2])  = [ 336620 3.39445E+05 ];
BALA_LOSS_NEUTRON_CUT        (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_LOSS_NEUTRON_TOT        (idx, [1:  2])  = [ 20003409 2.01879E+07 ];

BALA_NEUTRON_DIFF            (idx, [1:  2])  = [ 0 -2.30968E-07 ];

% Normalized total reaction rates (neutrons):

TOT_POWER                 (idx, [1:   2]) = [  2.36000E+08 0.0E+00 ];
TOT_POWDENS               (idx, [1:   2]) = [  5.99520E+06 0.0E+00 ];
TOT_GENRATE               (idx, [1:   2]) = [  1.87034E+19 8.4E-06 ];
TOT_FISSRATE              (idx, [1:   2]) = [  7.20073E+18 1.9E-06 ];
TOT_CAPTRATE              (idx, [1:   2]) = [  1.20798E+19 0.00027 ];
TOT_ABSRATE               (idx, [1:   2]) = [  1.92806E+19 0.00017 ];
TOT_SRCRATE               (idx, [1:   2]) = [  1.94300E+19 0.00024 ];
TOT_FLUX                  (idx, [1:   2]) = [  9.88458E+21 0.00031 ];
TOT_PHOTON_PRODRATE       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_LEAKRATE              (idx, [1:   2]) = [  3.29842E+17 0.00236 ];
ALBEDO_LEAKRATE           (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_LOSSRATE              (idx, [1:   2]) = [  1.96104E+19 0.00018 ];
TOT_CUTRATE               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_RR                    (idx, [1:   2]) = [  3.60689E+21 0.00032 ];
INI_FMASS                 (idx, 1)        =  3.93648E-05 ;
TOT_FMASS                 (idx, 1)        =  3.93648E-05 ;

% Fission neutron and energy production:

NUBAR                     (idx, [1:   2]) = [  2.59743E+00 1.0E-05 ];
FISSE                     (idx, [1:   2]) = [  2.04562E+02 1.9E-06 ];

% Criticality eigenvalues:

ANA_KEFF                  (idx, [1:   6]) = [  9.63050E-01 0.00030  9.58051E-01 0.00030  4.98833E-03 0.00509 ];
IMP_KEFF                  (idx, [1:   2]) = [  9.62774E-01 0.00018 ];
COL_KEFF                  (idx, [1:   2]) = [  9.62715E-01 0.00024 ];
ABS_KEFF                  (idx, [1:   2]) = [  9.62774E-01 0.00018 ];
ABS_KINF                  (idx, [1:   2]) = [  9.79397E-01 0.00017 ];
GEOM_ALBEDO               (idx, [1:   6]) = [  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00 ];

% ALF (Average lethargy of neutrons causing fission):
% Based on E0 = 2.000000E+01 MeV

ANA_ALF                   (idx, [1:   2]) = [  1.80907E+01 5.0E-05 ];
IMP_ALF                   (idx, [1:   2]) = [  1.80896E+01 2.3E-05 ];

% EALF (Energy corresponding to average lethargy of neutrons causing fission):

ANA_EALF                  (idx, [1:   2]) = [  2.78404E-07 0.00091 ];
IMP_EALF                  (idx, [1:   2]) = [  2.78541E-07 0.00041 ];

% AFGE (Average energy of neutrons causing fission):

ANA_AFGE                  (idx, [1:   2]) = [  1.08148E-02 0.00638 ];
IMP_AFGE                  (idx, [1:   2]) = [  1.08723E-02 0.00165 ];

% Forward-weighted delayed neutron parameters:

FWD_ANA_BETA_ZERO         (idx, [1:  14]) = [  5.45557E-03 0.00323  1.70147E-04 0.01727  1.00287E-03 0.00739  8.80030E-04 0.00774  2.41874E-03 0.00487  7.38104E-04 0.00845  2.45683E-04 0.01480 ];
FWD_ANA_LAMBDA            (idx, [1:  14]) = [  6.93568E-01 0.00764  1.01870E-02 0.01081  3.12206E-02 0.00054  1.09728E-01 0.00018  3.16465E-01 5.7E-05  1.28134E+00 0.00143  7.17527E+00 0.00844 ];

% Beta-eff using Meulekamp's method:

ADJ_MEULEKAMP_BETA_EFF    (idx, [1:  14]) = [  5.19321E-03 0.00443  1.57599E-04 0.02492  9.58183E-04 0.01083  8.35900E-04 0.01095  2.30693E-03 0.00664  6.98213E-04 0.01204  2.36387E-04 0.02128 ];
ADJ_MEULEKAMP_LAMBDA      (idx, [1:  14]) = [  6.95626E-01 0.01120  1.25598E-02 0.00049  3.12298E-02 0.00030  1.09731E-01 0.00025  3.16461E-01 7.6E-05  1.28342E+00 0.00167  7.84545E+00 0.00556 ];

% Adjoint weighted time constants using Nauchi's method:

ADJ_NAUCHI_GEN_TIME       (idx, [1:   6]) = [  5.54083E-04 0.00080  5.54229E-04 0.00080  5.26819E-04 0.01101 ];
ADJ_NAUCHI_LIFETIME       (idx, [1:   6]) = [  5.33520E-04 0.00075  5.33660E-04 0.00075  5.07222E-04 0.01099 ];
ADJ_NAUCHI_BETA_EFF       (idx, [1:  14]) = [  5.18555E-03 0.00513  1.63946E-04 0.02959  9.46806E-04 0.01231  8.44508E-04 0.01291  2.30195E-03 0.00757  6.96544E-04 0.01407  2.31797E-04 0.02423 ];
ADJ_NAUCHI_LAMBDA         (idx, [1:  14]) = [  6.91058E-01 0.01276  1.25569E-02 0.00066  3.12250E-02 0.00039  1.09731E-01 0.00032  3.16430E-01 9.1E-05  1.28153E+00 0.00220  7.92859E+00 0.00683 ];

% Adjoint weighted time constants using IFP:

ADJ_IFP_GEN_TIME          (idx, [1:   6]) = [  5.36056E-04 0.00197  5.36215E-04 0.00198  4.87470E-04 0.02574 ];
ADJ_IFP_LIFETIME          (idx, [1:   6]) = [  5.16148E-04 0.00194  5.16300E-04 0.00195  4.69730E-04 0.02580 ];
ADJ_IFP_IMP_BETA_EFF      (idx, [1:  14]) = [  5.10276E-03 0.01736  1.64027E-04 0.09309  8.81975E-04 0.04024  8.15822E-04 0.04441  2.35539E-03 0.02580  6.74082E-04 0.04757  2.11465E-04 0.08229 ];
ADJ_IFP_IMP_LAMBDA        (idx, [1:  14]) = [  6.97829E-01 0.04207  1.25290E-02 0.00120  3.12568E-02 0.00089  1.09787E-01 0.00077  3.16457E-01 0.00027  1.27890E+00 0.00522  7.92827E+00 0.01708 ];
ADJ_IFP_ANA_BETA_EFF      (idx, [1:  14]) = [  5.08882E-03 0.01698  1.63857E-04 0.09242  8.90856E-04 0.03953  8.07293E-04 0.04378  2.34921E-03 0.02516  6.62977E-04 0.04683  2.14634E-04 0.08045 ];
ADJ_IFP_ANA_LAMBDA        (idx, [1:  14]) = [  6.97695E-01 0.04177  1.25280E-02 0.00118  3.12563E-02 0.00089  1.09789E-01 0.00077  3.16453E-01 0.00027  1.27963E+00 0.00519  7.93271E+00 0.01695 ];
ADJ_IFP_ROSSI_ALPHA       (idx, [1:   2]) = [ -9.58148E+00 0.01754 ];

% Adjoint weighted time constants using perturbation technique:

ADJ_PERT_GEN_TIME         (idx, [1:   2]) = [  5.45381E-04 0.00051 ];
ADJ_PERT_LIFETIME         (idx, [1:   2]) = [  5.25134E-04 0.00041 ];
ADJ_PERT_BETA_EFF         (idx, [1:   2]) = [  5.17023E-03 0.00340 ];
ADJ_PERT_ROSSI_ALPHA      (idx, [1:   2]) = [ -9.48535E+00 0.00345 ];

% Inverse neutron speed :

ANA_INV_SPD               (idx, [1:   2]) = [  1.08650E-06 0.00021 ];

% Analog slowing-down and thermal neutron lifetime (total/prompt/delayed):

ANA_SLOW_TIME             (idx, [1:   6]) = [  3.52533E-05 8.8E-05  3.52527E-05 8.8E-05  3.53844E-05 0.00123 ];
ANA_THERM_TIME            (idx, [1:   6]) = [  7.91441E-04 0.00041  7.91622E-04 0.00041  7.56240E-04 0.00562 ];
ANA_THERM_FRAC            (idx, [1:   6]) = [  6.64193E-01 0.00016  6.64449E-01 0.00017  6.31382E-01 0.00515 ];
ANA_DELAYED_EMTIME        (idx, [1:   2]) = [  1.12368E+01 0.00705 ];
ANA_MEAN_NCOL             (idx, [1:   4]) = [  1.83959E+02 0.00024  1.86475E+02 0.00032 ];

% Group constant generation:

GC_UNIVERSE_NAME          (idx, [1:  1])  = '0' ;

% Micro- and macro-group structures:

MICRO_NG                  (idx, 1)        = 70 ;
MICRO_E                   (idx, [1:  71]) = [  1.00000E-11  5.00000E-09  1.00000E-08  1.50000E-08  2.00000E-08  2.50000E-08  3.00000E-08  3.50000E-08  4.20000E-08  5.00000E-08  5.80000E-08  6.70000E-08  8.00000E-08  1.00000E-07  1.40000E-07  1.80000E-07  2.20000E-07  2.50000E-07  2.80000E-07  3.00000E-07  3.20000E-07  3.50000E-07  4.00000E-07  5.00000E-07  6.25000E-07  7.80000E-07  8.50000E-07  9.10000E-07  9.50000E-07  9.72000E-07  9.96000E-07  1.02000E-06  1.04500E-06  1.07100E-06  1.09700E-06  1.12300E-06  1.15000E-06  1.30000E-06  1.50000E-06  1.85500E-06  2.10000E-06  2.60000E-06  3.30000E-06  4.00000E-06  9.87700E-06  1.59680E-05  2.77000E-05  4.80520E-05  7.55014E-05  1.48728E-04  3.67262E-04  9.06898E-04  1.42510E-03  2.23945E-03  3.51910E-03  5.50000E-03  9.11800E-03  1.50300E-02  2.47800E-02  4.08500E-02  6.74300E-02  1.11000E-01  1.83000E-01  3.02500E-01  5.00000E-01  8.21000E-01  1.35300E+00  2.23100E+00  3.67900E+00  6.06550E+00  2.00000E+01 ];

MACRO_NG                  (idx, 1)        = 2 ;
MACRO_E                   (idx, [1:   3]) = [  1.00000E+37  6.25000E-07  0.00000E+00 ];

% Micro-group spectrum:

INF_MICRO_FLX             (idx, [1: 140]) = [  8.53713E+04 0.00167  3.91259E+05 0.00080  9.04246E+05 0.00042  1.66051E+06 0.00027  1.86131E+06 0.00020  1.92877E+06 0.00016  1.44665E+06 0.00015  1.13327E+06 0.00018  1.61773E+06 0.00013  1.59881E+06 0.00011  1.73947E+06 0.00011  1.73134E+06 0.00011  1.88941E+06 0.00011  1.84529E+06 0.00011  1.85299E+06 9.5E-05  1.62805E+06 0.00012  1.63919E+06 0.00013  1.63171E+06 0.00011  1.62346E+06 0.00013  3.22114E+06 9.2E-05  3.17227E+06 8.7E-05  2.32956E+06 0.00011  1.51942E+06 0.00014  1.80889E+06 0.00015  1.73595E+06 0.00015  1.47535E+06 0.00016  2.58941E+06 0.00016  5.46631E+05 0.00028  6.83882E+05 0.00026  6.16778E+05 0.00025  3.63922E+05 0.00033  6.35729E+05 0.00029  4.36286E+05 0.00032  3.77183E+05 0.00039  7.27519E+04 0.00065  7.05622E+04 0.00066  7.04689E+04 0.00072  7.12761E+04 0.00079  7.14344E+04 0.00077  7.26229E+04 0.00061  7.66932E+04 0.00061  7.34913E+04 0.00071  1.41053E+05 0.00057  2.32830E+05 0.00041  3.14315E+05 0.00042  9.99030E+05 0.00031  1.52719E+06 0.00037  2.41959E+06 0.00043  1.98966E+06 0.00050  1.57616E+06 0.00051  1.24966E+06 0.00059  1.43484E+06 0.00052  2.56111E+06 0.00054  3.13575E+06 0.00055  5.20088E+06 0.00056  6.44694E+06 0.00055  7.50647E+06 0.00056  3.94058E+06 0.00058  2.50984E+06 0.00059  1.66554E+06 0.00062  1.41385E+06 0.00064  1.34075E+06 0.00063  1.03477E+06 0.00068  6.83907E+05 0.00071  5.82563E+05 0.00078  5.31074E+05 0.00078  4.41166E+05 0.00079  3.03711E+05 0.00091  1.99755E+05 0.00091  6.31845E+04 0.00139 ];

% Integral parameters:

INF_KINF                  (idx, [1:   2]) = [  9.79337E-01 0.00022 ];

% Flux spectra in infinite geometry:

INF_FLX                   (idx, [1:   4]) = [  5.05061E+21 0.00021  4.83409E+21 0.00060 ];
INF_FISS_FLX              (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reaction cross sections:

INF_TOT                   (idx, [1:   4]) = [  3.41296E-01 1.7E-05  3.89561E-01 5.6E-05 ];
INF_CAPT                  (idx, [1:   4]) = [  1.13960E-03 0.00033  1.30831E-03 0.00046 ];
INF_ABS                   (idx, [1:   4]) = [  1.32542E-03 0.00032  2.60395E-03 0.00051 ];
INF_FISS                  (idx, [1:   4]) = [  1.85819E-04 0.00047  1.29564E-03 0.00060 ];
INF_NSF                   (idx, [1:   4]) = [  4.68684E-04 0.00046  3.37993E-03 0.00060 ];
INF_NUBAR                 (idx, [1:   4]) = [  2.52226E+00 1.8E-05  2.60870E+00 1.1E-05 ];
INF_KAPPA                 (idx, [1:   4]) = [  2.03520E+02 3.0E-06  2.04718E+02 2.1E-06 ];
INF_INVV                  (idx, [1:   4]) = [  1.13998E-07 9.7E-05  2.10276E-06 4.5E-05 ];

% Total scattering cross sections:

INF_SCATT0                (idx, [1:   4]) = [  3.39971E-01 1.8E-05  3.86956E-01 5.8E-05 ];
INF_SCATT1                (idx, [1:   4]) = [  2.15105E-02 0.00023  1.13222E-02 0.00047 ];
INF_SCATT2                (idx, [1:   4]) = [  2.51093E-03 0.00145 -4.44845E-03 0.00092 ];
INF_SCATT3                (idx, [1:   4]) = [  4.75689E-04 0.00623 -4.06862E-03 0.00086 ];
INF_SCATT4                (idx, [1:   4]) = [ -1.36239E-04 0.02120 -4.70936E-03 0.00061 ];
INF_SCATT5                (idx, [1:   4]) = [  1.22061E-04 0.02142 -2.72524E-03 0.00097 ];
INF_SCATT6                (idx, [1:   4]) = [ -3.32377E-04 0.00641 -4.52662E-03 0.00053 ];
INF_SCATT7                (idx, [1:   4]) = [  1.38839E-04 0.01596 -6.18843E-04 0.00358 ];

% Total scattering production cross sections:

INF_SCATTP0               (idx, [1:   4]) = [  3.40007E-01 1.8E-05  3.86956E-01 5.8E-05 ];
INF_SCATTP1               (idx, [1:   4]) = [  2.15200E-02 0.00023  1.13222E-02 0.00047 ];
INF_SCATTP2               (idx, [1:   4]) = [  2.51266E-03 0.00144 -4.44845E-03 0.00092 ];
INF_SCATTP3               (idx, [1:   4]) = [  4.75911E-04 0.00623 -4.06862E-03 0.00086 ];
INF_SCATTP4               (idx, [1:   4]) = [ -1.36238E-04 0.02122 -4.70936E-03 0.00061 ];
INF_SCATTP5               (idx, [1:   4]) = [  1.22033E-04 0.02142 -2.72524E-03 0.00097 ];
INF_SCATTP6               (idx, [1:   4]) = [ -3.32396E-04 0.00641 -4.52662E-03 0.00053 ];
INF_SCATTP7               (idx, [1:   4]) = [  1.38812E-04 0.01596 -6.18843E-04 0.00358 ];

% Diffusion parameters:

INF_TRANSPXS              (idx, [1:   4]) = [  3.02930E-01 3.7E-05  3.76805E-01 5.9E-05 ];
INF_DIFFCOEF              (idx, [1:   4]) = [  1.10036E+00 3.7E-05  8.84631E-01 5.9E-05 ];

% Reduced absoption and removal:

INF_RABSXS                (idx, [1:   4]) = [  1.28927E-03 0.00033  2.60395E-03 0.00051 ];
INF_REMXS                 (idx, [1:   4]) = [  5.60091E-03 0.00015  4.42098E-03 0.00047 ];

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

INF_S0                    (idx, [1:   8]) = [  3.35695E-01 1.7E-05  4.27576E-03 0.00023  1.81648E-03 0.00051  3.85140E-01 5.9E-05 ];
INF_S1                    (idx, [1:   8]) = [  2.24443E-02 0.00022 -9.33752E-04 0.00057 -2.03694E-04 0.00161  1.15259E-02 0.00046 ];
INF_S2                    (idx, [1:   8]) = [  2.68511E-03 0.00134 -1.74177E-04 0.00220 -1.15966E-04 0.00225 -4.33249E-03 0.00095 ];
INF_S3                    (idx, [1:   8]) = [  5.22828E-04 0.00567 -4.71391E-05 0.00650 -4.09937E-05 0.00455 -4.02763E-03 0.00086 ];
INF_S4                    (idx, [1:   8]) = [ -1.00831E-04 0.02884 -3.54075E-05 0.00843 -2.69139E-05 0.00729 -4.68244E-03 0.00061 ];
INF_S5                    (idx, [1:   8]) = [  1.25847E-04 0.02038 -3.78555E-06 0.07723 -6.47768E-06 0.02479 -2.71876E-03 0.00097 ];
INF_S6                    (idx, [1:   8]) = [ -3.07469E-04 0.00710 -2.49075E-05 0.00944 -1.81929E-05 0.00785 -4.50843E-03 0.00053 ];
INF_S7                    (idx, [1:   8]) = [  1.17604E-04 0.01875  2.12351E-05 0.01110  8.21470E-06 0.01953 -6.27058E-04 0.00350 ];

% Scattering production matrixes:

INF_SP0                   (idx, [1:   8]) = [  3.35731E-01 1.7E-05  4.27576E-03 0.00023  1.81648E-03 0.00051  3.85140E-01 5.9E-05 ];
INF_SP1                   (idx, [1:   8]) = [  2.24538E-02 0.00022 -9.33752E-04 0.00057 -2.03694E-04 0.00161  1.15259E-02 0.00046 ];
INF_SP2                   (idx, [1:   8]) = [  2.68684E-03 0.00134 -1.74177E-04 0.00220 -1.15966E-04 0.00225 -4.33249E-03 0.00095 ];
INF_SP3                   (idx, [1:   8]) = [  5.23050E-04 0.00567 -4.71391E-05 0.00650 -4.09937E-05 0.00455 -4.02763E-03 0.00086 ];
INF_SP4                   (idx, [1:   8]) = [ -1.00831E-04 0.02886 -3.54075E-05 0.00843 -2.69139E-05 0.00729 -4.68244E-03 0.00061 ];
INF_SP5                   (idx, [1:   8]) = [  1.25818E-04 0.02039 -3.78555E-06 0.07723 -6.47768E-06 0.02479 -2.71876E-03 0.00097 ];
INF_SP6                   (idx, [1:   8]) = [ -3.07489E-04 0.00710 -2.49075E-05 0.00944 -1.81929E-05 0.00785 -4.50843E-03 0.00053 ];
INF_SP7                   (idx, [1:   8]) = [  1.17577E-04 0.01875  2.12351E-05 0.01110  8.21470E-06 0.01953 -6.27058E-04 0.00350 ];

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

CMM_TRANSPXS              (idx, [1:   4]) = [  3.00911E-01 0.00019  4.32243E-01 0.00068 ];
CMM_TRANSPXS_X            (idx, [1:   4]) = [  3.01310E-01 0.00028  4.26205E-01 0.00095 ];
CMM_TRANSPXS_Y            (idx, [1:   4]) = [  3.01265E-01 0.00037  4.25623E-01 0.00105 ];
CMM_TRANSPXS_Z            (idx, [1:   4]) = [  3.00168E-01 0.00036  4.45556E-01 0.00100 ];
CMM_DIFFCOEF              (idx, [1:   4]) = [  1.10775E+00 0.00019  7.71207E-01 0.00068 ];
CMM_DIFFCOEF_X            (idx, [1:   4]) = [  1.10629E+00 0.00028  7.82166E-01 0.00095 ];
CMM_DIFFCOEF_Y            (idx, [1:   4]) = [  1.10646E+00 0.00037  7.83253E-01 0.00106 ];
CMM_DIFFCOEF_Z            (idx, [1:   4]) = [  1.11050E+00 0.00036  7.48203E-01 0.00100 ];

% Delayed neutron parameters (Meulekamp method):

BETA_EFF                  (idx, [1:  14]) = [  5.19321E-03 0.00443  1.57599E-04 0.02492  9.58183E-04 0.01083  8.35900E-04 0.01095  2.30693E-03 0.00664  6.98213E-04 0.01204  2.36387E-04 0.02128 ];
LAMBDA                    (idx, [1:  14]) = [  6.95626E-01 0.01120  1.25598E-02 0.00049  3.12298E-02 0.00030  1.09731E-01 0.00025  3.16461E-01 7.6E-05  1.28342E+00 0.00167  7.84545E+00 0.00556 ];

