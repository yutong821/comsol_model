
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
WORKING_DIRECTORY         (idx, [1: 77])  = '/global/home/users/xwa9860/FIG/res/multi_zones/packing_fraction_no_rods/pf_40' ;
HOSTNAME                  (idx, [1: 12])  = 'n0110.savio1' ;
CPU_TYPE                  (idx, [1: 41])  = 'Intel(R) Xeon(R) CPU E5-2670 v2 @ 2.50GHz' ;
CPU_MHZ                   (idx, 1)        = 1047.0 ;
START_DATE                (idx, [1: 24])  = 'Mon Jan  8 13:39:55 2018' ;
COMPLETE_DATE             (idx, [1: 24])  = 'Mon Jan  8 14:20:32 2018' ;

% Run parameters:

POP                       (idx, 1)        = 10000 ;
CYCLES                    (idx, 1)        = 2000 ;
SKIP                      (idx, 1)        = 500 ;
BATCH_INTERVAL            (idx, 1)        = 1 ;
SRC_NORM_MODE             (idx, 1)        = 2 ;
SEED                      (idx, 1)        = 1515447595 ;
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
OMP_HISTORY_PROFILE       (idx, [1:  20]) = [  9.90033E-01  9.91434E-01  9.90652E-01  9.95278E-01  1.00502E+00  9.95665E-01  1.00150E+00  1.00825E+00  9.97712E-01  9.96426E-01  1.00693E+00  1.00199E+00  1.00558E+00  1.00393E+00  9.99227E-01  1.00682E+00  1.00237E+00  1.00468E+00  9.92779E-01  1.00372E+00  ];
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
ST_FRAC                   (idx, [1:   4]) = [  7.17134E-02 0.00030  0.00000E+00 0.0E+00 ];
DT_FRAC                   (idx, [1:   4]) = [  9.28287E-01 2.3E-05  0.00000E+00 0.0E+00 ];
DT_EFF                    (idx, [1:   4]) = [  2.32437E-01 4.6E-05  0.00000E+00 0.0E+00 ];
REA_SAMPLING_EFF          (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
REA_SAMPLING_FAIL         (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_COL_EFF               (idx, [1:   4]) = [  2.38221E-01 4.6E-05  0.00000E+00 0.0E+00 ];
AVG_TRACKING_LOOPS        (idx, [1:   8]) = [  9.37122E+00 0.00030  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
AVG_TRACKS                (idx, [1:   4]) = [  2.07436E+02 0.00023  0.00000E+00 0.0E+00 ];
AVG_REAL_COL              (idx, [1:   4]) = [  2.07419E+02 0.00023  0.00000E+00 0.0E+00 ];
AVG_VIRT_COL              (idx, [1:   4]) = [  6.63299E+02 0.00029  0.00000E+00 0.0E+00 ];
AVG_SURF_CROSS            (idx, [1:   4]) = [  6.02075E+01 0.00023  0.00000E+00 0.0E+00 ];
LOST_PARTICLES            (idx, 1)        = 0 ;

% Run statistics:

CYCLE_IDX                 (idx, 1)        = 2000 ;
SOURCE_POPULATION         (idx, 1)        = 20003922 ;
MEAN_POP_SIZE             (idx, [1:  2])  = [  1.00020E+04 0.00043 ];
MEAN_POP_WGT              (idx, [1:  2])  = [  1.00020E+04 0.00043 ];
SIMULATION_COMPLETED      (idx, 1)        = 1 ;

% Running times:

TOT_CPU_TIME              (idx, 1)        =  7.92525E+02 ;
RUNNING_TIME              (idx, 1)        =  4.06287E+01 ;
INIT_TIME                 (idx, [1:  2])  = [  7.31383E-01  7.31383E-01 ];
PROCESS_TIME              (idx, [1:  2])  = [  1.54600E-01  1.54600E-01 ];
TRANSPORT_CYCLE_TIME      (idx, [1:  3])  = [  3.97427E+01  3.97427E+01  0.00000E+00 ];
MPI_OVERHEAD_TIME         (idx, [1:  2])  = [  0.00000E+00  0.00000E+00 ];
ESTIMATED_RUNNING_TIME    (idx, [1:  2])  = [  4.06284E+01  0.00000E+00 ];
CPU_USAGE                 (idx, 1)        = 19.50654 ;
TRANSPORT_CPU_USAGE       (idx, [1:   2]) = [  1.98477E+01 0.00012 ];
OMP_PARALLEL_FRAC         (idx, 1)        =  9.74150E-01 ;

% Memory usage:

AVAIL_MEM                 (idx, 1)        = 64497.80 ;
ALLOC_MEMSIZE             (idx, 1)        = 12385.39;
MEMSIZE                   (idx, 1)        = 8607.19;
XS_MEMSIZE                (idx, 1)        = 6770.56;
MAT_MEMSIZE               (idx, 1)        = 1698.82;
RES_MEMSIZE               (idx, 1)        = 3.91;
MISC_MEMSIZE              (idx, 1)        = 133.90;
UNKNOWN_MEMSIZE           (idx, 1)        = 0.00;
UNUSED_MEMSIZE            (idx, 1)        = 3778.20;

% Geometry parameters:

TOT_CELLS                 (idx, 1)        = 346 ;
UNION_CELLS               (idx, 1)        = 0 ;

% Neutron energy grid:

NEUTRON_ERG_TOL           (idx, 1)        =  0.00000E+00 ;
NEUTRON_ERG_NE            (idx, 1)        = 668615 ;
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

NORM_COEF                 (idx, [1:   4]) = [  1.94916E+15 0.00024  0.00000E+00 0.0E+00 ];

% Analog reaction rate estimators:

CONVERSION_RATIO          (idx, [1:   2]) = [  3.62541E-01 0.00065 ];
U235_FISS                 (idx, [1:   4]) = [  4.59913E+18 0.00040  6.38536E-01 0.00028 ];
U238_FISS                 (idx, [1:   4]) = [  1.19878E+16 0.00914  1.66446E-03 0.00914 ];
PU239_FISS                (idx, [1:   4]) = [  1.98284E+18 0.00066  2.75295E-01 0.00061 ];
PU240_FISS                (idx, [1:   4]) = [  7.04795E+14 0.03719  9.77312E-05 0.03717 ];
PU241_FISS                (idx, [1:   4]) = [  6.01248E+17 0.00128  8.34780E-02 0.00125 ];
U235_CAPT                 (idx, [1:   4]) = [  1.03737E+18 0.00096  8.50183E-02 0.00094 ];
U238_CAPT                 (idx, [1:   4]) = [  2.62653E+18 0.00070  2.15226E-01 0.00056 ];
PU239_CAPT                (idx, [1:   4]) = [  1.20519E+18 0.00085  9.87735E-02 0.00084 ];
PU240_CAPT                (idx, [1:   4]) = [  8.58008E+17 0.00113  7.03114E-02 0.00107 ];
PU241_CAPT                (idx, [1:   4]) = [  2.32925E+17 0.00204  1.90910E-02 0.00206 ];
XE135_CAPT                (idx, [1:   4]) = [  3.26392E+17 0.00176  2.67500E-02 0.00176 ];
SM149_CAPT                (idx, [1:   4]) = [  1.35751E+17 0.00270  1.11254E-02 0.00270 ];

% Neutron balance (particles/weight):

BALA_SRC_NEUTRON_SRC        (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_SRC_NEUTRON_FISS       (idx, [1:  2])  = [ 20003922 2.00000E+07 ];
BALA_SRC_NEUTRON_NXN        (idx, [1:  2])  = [ 0 2.52642E+05 ];
BALA_SRC_NEUTRON_VR         (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_SRC_NEUTRON_TOT        (idx, [1:  2])  = [ 20003922 2.02526E+07 ];

BALA_LOSS_NEUTRON_CAPT       (idx, [1:  2])  = [ 12367701 1.25208E+07 ];
BALA_LOSS_NEUTRON_FISS       (idx, [1:  2])  = [ 7299106 7.39100E+06 ];
BALA_LOSS_NEUTRON_LEAK       (idx, [1:  2])  = [ 337115 3.40873E+05 ];
BALA_LOSS_NEUTRON_CUT        (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_LOSS_NEUTRON_TOT        (idx, [1:  2])  = [ 20003922 2.02526E+07 ];

BALA_NEUTRON_DIFF            (idx, [1:  2])  = [ 0 -1.45286E-07 ];

% Normalized total reaction rates (neutrons):

TOT_POWER                 (idx, [1:   2]) = [  2.36000E+08 0.0E+00 ];
TOT_POWDENS               (idx, [1:   2]) = [  5.99520E+06 0.0E+00 ];
TOT_GENRATE               (idx, [1:   2]) = [  1.87046E+19 8.2E-06 ];
TOT_FISSRATE              (idx, [1:   2]) = [  7.20058E+18 1.8E-06 ];
TOT_CAPTRATE              (idx, [1:   2]) = [  1.22007E+19 0.00027 ];
TOT_ABSRATE               (idx, [1:   2]) = [  1.94013E+19 0.00017 ];
TOT_SRCRATE               (idx, [1:   2]) = [  1.94916E+19 0.00024 ];
TOT_FLUX                  (idx, [1:   2]) = [  1.15337E+22 0.00030 ];
TOT_PHOTON_PRODRATE       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_LEAKRATE              (idx, [1:   2]) = [  3.32260E+17 0.00237 ];
ALBEDO_LEAKRATE           (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_LOSSRATE              (idx, [1:   2]) = [  1.97336E+19 0.00018 ];
TOT_CUTRATE               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_RR                    (idx, [1:   2]) = [  4.09250E+21 0.00032 ];
INI_FMASS                 (idx, 1)        =  3.93648E-05 ;
TOT_FMASS                 (idx, 1)        =  3.93648E-05 ;

% Fission neutron and energy production:

NUBAR                     (idx, [1:   2]) = [  2.59765E+00 1.0E-05 ];
FISSE                     (idx, [1:   2]) = [  2.04566E+02 1.8E-06 ];

% Criticality eigenvalues:

ANA_KEFF                  (idx, [1:   6]) = [  9.60010E-01 0.00031  9.55003E-01 0.00030  4.95349E-03 0.00510 ];
IMP_KEFF                  (idx, [1:   2]) = [  9.59871E-01 0.00018 ];
COL_KEFF                  (idx, [1:   2]) = [  9.59734E-01 0.00024 ];
ABS_KEFF                  (idx, [1:   2]) = [  9.59871E-01 0.00018 ];
ABS_KINF                  (idx, [1:   2]) = [  9.76515E-01 0.00017 ];
GEOM_ALBEDO               (idx, [1:   6]) = [  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00 ];

% ALF (Average lethargy of neutrons causing fission):
% Based on E0 = 2.000000E+01 MeV

ANA_ALF                   (idx, [1:   2]) = [  1.83190E+01 4.2E-05 ];
IMP_ALF                   (idx, [1:   2]) = [  1.83180E+01 2.0E-05 ];

% EALF (Energy corresponding to average lethargy of neutrons causing fission):

ANA_EALF                  (idx, [1:   2]) = [  2.21550E-07 0.00078 ];
IMP_EALF                  (idx, [1:   2]) = [  2.21665E-07 0.00037 ];

% AFGE (Average energy of neutrons causing fission):

ANA_AFGE                  (idx, [1:   2]) = [  7.44102E-03 0.00774 ];
IMP_AFGE                  (idx, [1:   2]) = [  7.44782E-03 0.00197 ];

% Forward-weighted delayed neutron parameters:

FWD_ANA_BETA_ZERO         (idx, [1:  14]) = [  5.46711E-03 0.00325  1.65683E-04 0.01799  1.01432E-03 0.00755  8.94899E-04 0.00786  2.39843E-03 0.00476  7.44068E-04 0.00857  2.49714E-04 0.01485 ];
FWD_ANA_LAMBDA            (idx, [1:  14]) = [  7.00070E-01 0.00780  9.90750E-03 0.01156  3.12268E-02 0.00022  1.09739E-01 0.00019  3.16378E-01 5.2E-05  1.28284E+00 0.00144  7.19685E+00 0.00839 ];

% Beta-eff using Meulekamp's method:

ADJ_MEULEKAMP_BETA_EFF    (idx, [1:  14]) = [  5.14146E-03 0.00447  1.55288E-04 0.02563  9.53304E-04 0.01036  8.45943E-04 0.01070  2.24401E-03 0.00677  7.05996E-04 0.01203  2.36922E-04 0.02109 ];
ADJ_MEULEKAMP_LAMBDA      (idx, [1:  14]) = [  7.02534E-01 0.01068  1.25493E-02 0.00047  3.12317E-02 0.00030  1.09747E-01 0.00025  3.16364E-01 7.4E-05  1.28194E+00 0.00174  7.94105E+00 0.00533 ];

% Adjoint weighted time constants using Nauchi's method:

ADJ_NAUCHI_GEN_TIME       (idx, [1:   6]) = [  6.82306E-04 0.00076  6.82408E-04 0.00077  6.62285E-04 0.00969 ];
ADJ_NAUCHI_LIFETIME       (idx, [1:   6]) = [  6.54886E-04 0.00069  6.54983E-04 0.00069  6.35679E-04 0.00968 ];
ADJ_NAUCHI_BETA_EFF       (idx, [1:  14]) = [  5.15405E-03 0.00510  1.60819E-04 0.02950  9.61553E-04 0.01230  8.37262E-04 0.01257  2.24906E-03 0.00775  7.05660E-04 0.01382  2.39695E-04 0.02449 ];
ADJ_NAUCHI_LAMBDA         (idx, [1:  14]) = [  7.10108E-01 0.01292  1.25542E-02 0.00064  3.12249E-02 0.00039  1.09718E-01 0.00032  3.16389E-01 9.2E-05  1.28352E+00 0.00217  7.99499E+00 0.00653 ];

% Adjoint weighted time constants using IFP:

ADJ_IFP_GEN_TIME          (idx, [1:   6]) = [  6.61826E-04 0.00179  6.61868E-04 0.00180  5.95595E-04 0.02302 ];
ADJ_IFP_LIFETIME          (idx, [1:   6]) = [  6.35213E-04 0.00175  6.35255E-04 0.00176  5.71418E-04 0.02299 ];
ADJ_IFP_IMP_BETA_EFF      (idx, [1:  14]) = [  5.18811E-03 0.01684  1.47692E-04 0.09842  9.53455E-04 0.03992  7.91007E-04 0.04282  2.31525E-03 0.02590  7.56314E-04 0.04449  2.24390E-04 0.08005 ];
ADJ_IFP_IMP_LAMBDA        (idx, [1:  14]) = [  7.43630E-01 0.04029  1.25227E-02 0.00109  3.12605E-02 0.00089  1.09826E-01 0.00077  3.16393E-01 0.00023  1.27451E+00 0.00523  8.20366E+00 0.01316 ];
ADJ_IFP_ANA_BETA_EFF      (idx, [1:  14]) = [  5.20210E-03 0.01654  1.49677E-04 0.09575  9.56380E-04 0.03927  7.94356E-04 0.04236  2.32051E-03 0.02553  7.60318E-04 0.04371  2.20860E-04 0.07710 ];
ADJ_IFP_ANA_LAMBDA        (idx, [1:  14]) = [  7.39592E-01 0.03994  1.25225E-02 0.00108  3.12562E-02 0.00089  1.09817E-01 0.00076  3.16393E-01 0.00023  1.27475E+00 0.00521  8.19944E+00 0.01308 ];
ADJ_IFP_ROSSI_ALPHA       (idx, [1:   2]) = [ -7.88287E+00 0.01695 ];

% Adjoint weighted time constants using perturbation technique:

ADJ_PERT_GEN_TIME         (idx, [1:   2]) = [  6.72506E-04 0.00048 ];
ADJ_PERT_LIFETIME         (idx, [1:   2]) = [  6.45485E-04 0.00036 ];
ADJ_PERT_BETA_EFF         (idx, [1:   2]) = [  5.22466E-03 0.00329 ];
ADJ_PERT_ROSSI_ALPHA      (idx, [1:   2]) = [ -7.77331E+00 0.00334 ];

% Inverse neutron speed :

ANA_INV_SPD               (idx, [1:   2]) = [  1.18170E-06 0.00018 ];

% Analog slowing-down and thermal neutron lifetime (total/prompt/delayed):

ANA_SLOW_TIME             (idx, [1:   6]) = [  3.76109E-05 8.6E-05  3.76101E-05 8.6E-05  3.77651E-05 0.00123 ];
ANA_THERM_TIME            (idx, [1:   6]) = [  9.16410E-04 0.00036  9.16544E-04 0.00036  8.90772E-04 0.00509 ];
ANA_THERM_FRAC            (idx, [1:   6]) = [  7.29460E-01 0.00015  7.29762E-01 0.00015  6.89485E-01 0.00507 ];
ANA_DELAYED_EMTIME        (idx, [1:   2]) = [  1.13500E+01 0.00713 ];
ANA_MEAN_NCOL             (idx, [1:   4]) = [  2.07419E+02 0.00023  2.04683E+02 0.00032 ];

% Group constant generation:

GC_UNIVERSE_NAME          (idx, [1:  1])  = '0' ;

% Micro- and macro-group structures:

MICRO_NG                  (idx, 1)        = 70 ;
MICRO_E                   (idx, [1:  71]) = [  1.00000E-11  5.00000E-09  1.00000E-08  1.50000E-08  2.00000E-08  2.50000E-08  3.00000E-08  3.50000E-08  4.20000E-08  5.00000E-08  5.80000E-08  6.70000E-08  8.00000E-08  1.00000E-07  1.40000E-07  1.80000E-07  2.20000E-07  2.50000E-07  2.80000E-07  3.00000E-07  3.20000E-07  3.50000E-07  4.00000E-07  5.00000E-07  6.25000E-07  7.80000E-07  8.50000E-07  9.10000E-07  9.50000E-07  9.72000E-07  9.96000E-07  1.02000E-06  1.04500E-06  1.07100E-06  1.09700E-06  1.12300E-06  1.15000E-06  1.30000E-06  1.50000E-06  1.85500E-06  2.10000E-06  2.60000E-06  3.30000E-06  4.00000E-06  9.87700E-06  1.59680E-05  2.77000E-05  4.80520E-05  7.55014E-05  1.48728E-04  3.67262E-04  9.06898E-04  1.42510E-03  2.23945E-03  3.51910E-03  5.50000E-03  9.11800E-03  1.50300E-02  2.47800E-02  4.08500E-02  6.74300E-02  1.11000E-01  1.83000E-01  3.02500E-01  5.00000E-01  8.21000E-01  1.35300E+00  2.23100E+00  3.67900E+00  6.06550E+00  2.00000E+01 ];

MACRO_NG                  (idx, 1)        = 2 ;
MACRO_E                   (idx, [1:   3]) = [  1.00000E+37  6.25000E-07  0.00000E+00 ];

% Micro-group spectrum:

INF_MICRO_FLX             (idx, [1: 140]) = [  7.99412E+04 0.00131  3.63696E+05 0.00068  8.54412E+05 0.00040  1.54015E+06 0.00029  1.75057E+06 0.00021  1.87634E+06 0.00016  1.29951E+06 0.00016  1.00799E+06 0.00019  1.62448E+06 0.00015  1.61254E+06 0.00012  1.81439E+06 0.00013  1.82496E+06 0.00011  2.04664E+06 0.00013  1.99133E+06 0.00013  1.99753E+06 0.00011  1.75302E+06 0.00011  1.76477E+06 0.00011  1.75639E+06 0.00012  1.74789E+06 0.00014  3.47159E+06 8.8E-05  3.42835E+06 0.00010  2.52832E+06 0.00011  1.65952E+06 0.00012  1.99019E+06 0.00013  1.92811E+06 0.00014  1.64934E+06 0.00015  2.94313E+06 0.00015  6.25027E+05 0.00028  7.82200E+05 0.00025  7.06784E+05 0.00024  4.16536E+05 0.00034  7.27698E+05 0.00024  5.00423E+05 0.00028  4.34433E+05 0.00035  8.40960E+04 0.00058  8.21183E+04 0.00061  8.27491E+04 0.00065  8.41304E+04 0.00071  8.41487E+04 0.00067  8.50608E+04 0.00065  8.94793E+04 0.00063  8.55139E+04 0.00057  1.64337E+05 0.00049  2.71370E+05 0.00040  3.67716E+05 0.00035  1.18538E+06 0.00028  1.85936E+06 0.00034  3.01091E+06 0.00044  2.50420E+06 0.00050  1.99381E+06 0.00050  1.58510E+06 0.00052  1.82387E+06 0.00053  3.25861E+06 0.00053  3.99290E+06 0.00055  6.62684E+06 0.00056  8.21917E+06 0.00058  9.56728E+06 0.00058  5.02188E+06 0.00059  3.19871E+06 0.00060  2.12196E+06 0.00062  1.80072E+06 0.00063  1.70379E+06 0.00065  1.31982E+06 0.00069  8.69182E+05 0.00072  7.44360E+05 0.00074  6.75043E+05 0.00075  5.60449E+05 0.00082  3.88470E+05 0.00082  2.54739E+05 0.00097  8.15234E+04 0.00104 ];

% Integral parameters:

INF_KINF                  (idx, [1:   2]) = [  9.76376E-01 0.00022 ];

% Flux spectra in infinite geometry:

INF_FLX                   (idx, [1:   4]) = [  5.37620E+21 0.00022  6.15768E+21 0.00065 ];
INF_FISS_FLX              (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reaction cross sections:

INF_TOT                   (idx, [1:   4]) = [  3.28773E-01 2.0E-05  3.77575E-01 6.1E-05 ];
INF_CAPT                  (idx, [1:   4]) = [  8.91113E-04 0.00036  1.20343E-03 0.00042 ];
INF_ABS                   (idx, [1:   4]) = [  1.02501E-03 0.00034  2.25606E-03 0.00051 ];
INF_FISS                  (idx, [1:   4]) = [  1.33898E-04 0.00051  1.05263E-03 0.00064 ];
INF_NSF                   (idx, [1:   4]) = [  3.37626E-04 0.00050  2.74327E-03 0.00064 ];
INF_NUBAR                 (idx, [1:   4]) = [  2.52152E+00 2.1E-05  2.60610E+00 1.1E-05 ];
INF_KAPPA                 (idx, [1:   4]) = [  2.03514E+02 3.7E-06  2.04683E+02 2.0E-06 ];
INF_INVV                  (idx, [1:   4]) = [  1.22658E-07 8.5E-05  2.10649E-06 4.6E-05 ];

% Total scattering cross sections:

INF_SCATT0                (idx, [1:   4]) = [  3.27748E-01 2.1E-05  3.75319E-01 6.3E-05 ];
INF_SCATT1                (idx, [1:   4]) = [  2.05033E-02 0.00023  1.14351E-02 0.00039 ];
INF_SCATT2                (idx, [1:   4]) = [  2.48182E-03 0.00137 -3.92762E-03 0.00096 ];
INF_SCATT3                (idx, [1:   4]) = [  4.78006E-04 0.00648 -3.64968E-03 0.00083 ];
INF_SCATT4                (idx, [1:   4]) = [ -8.24907E-05 0.03074 -4.21901E-03 0.00067 ];
INF_SCATT5                (idx, [1:   4]) = [  1.13254E-04 0.02131 -2.45358E-03 0.00096 ];
INF_SCATT6                (idx, [1:   4]) = [ -2.89549E-04 0.00802 -4.04810E-03 0.00066 ];
INF_SCATT7                (idx, [1:   4]) = [  1.20203E-04 0.01647 -5.68225E-04 0.00359 ];

% Total scattering production cross sections:

INF_SCATTP0               (idx, [1:   4]) = [  3.27793E-01 2.1E-05  3.75319E-01 6.3E-05 ];
INF_SCATTP1               (idx, [1:   4]) = [  2.05155E-02 0.00023  1.14351E-02 0.00039 ];
INF_SCATTP2               (idx, [1:   4]) = [  2.48400E-03 0.00137 -3.92762E-03 0.00096 ];
INF_SCATTP3               (idx, [1:   4]) = [  4.78339E-04 0.00648 -3.64968E-03 0.00083 ];
INF_SCATTP4               (idx, [1:   4]) = [ -8.24561E-05 0.03078 -4.21901E-03 0.00067 ];
INF_SCATTP5               (idx, [1:   4]) = [  1.13224E-04 0.02132 -2.45358E-03 0.00096 ];
INF_SCATTP6               (idx, [1:   4]) = [ -2.89609E-04 0.00803 -4.04810E-03 0.00066 ];
INF_SCATTP7               (idx, [1:   4]) = [  1.20132E-04 0.01648 -5.68225E-04 0.00359 ];

% Diffusion parameters:

INF_TRANSPXS              (idx, [1:   4]) = [  2.95656E-01 2.9E-05  3.64703E-01 6.6E-05 ];
INF_DIFFCOEF              (idx, [1:   4]) = [  1.12743E+00 2.9E-05  9.13986E-01 6.6E-05 ];

% Reduced absoption and removal:

INF_RABSXS                (idx, [1:   4]) = [  9.79213E-04 0.00035  2.25606E-03 0.00051 ];
INF_REMXS                 (idx, [1:   4]) = [  5.56439E-03 0.00015  3.92390E-03 0.00042 ];

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

INF_S0                    (idx, [1:   8]) = [  3.23208E-01 2.0E-05  4.53910E-03 0.00024  1.66755E-03 0.00041  3.73652E-01 6.4E-05 ];
INF_S1                    (idx, [1:   8]) = [  2.14798E-02 0.00022 -9.76435E-04 0.00050 -1.84767E-04 0.00146  1.16199E-02 0.00039 ];
INF_S2                    (idx, [1:   8]) = [  2.66451E-03 0.00127 -1.82696E-04 0.00233 -1.02929E-04 0.00198 -3.82469E-03 0.00100 ];
INF_S3                    (idx, [1:   8]) = [  5.26895E-04 0.00579 -4.88881E-05 0.00700 -3.67516E-05 0.00488 -3.61292E-03 0.00084 ];
INF_S4                    (idx, [1:   8]) = [ -4.60936E-05 0.05351 -3.63971E-05 0.00851 -2.30645E-05 0.00700 -4.19595E-03 0.00067 ];
INF_S5                    (idx, [1:   8]) = [  1.17465E-04 0.02047 -4.21072E-06 0.06638 -5.94278E-06 0.02506 -2.44764E-03 0.00096 ];
INF_S6                    (idx, [1:   8]) = [ -2.66246E-04 0.00873 -2.33027E-05 0.00951 -1.52288E-05 0.00875 -4.03287E-03 0.00066 ];
INF_S7                    (idx, [1:   8]) = [  1.01520E-04 0.01938  1.86830E-05 0.01341  6.30905E-06 0.01958 -5.74534E-04 0.00352 ];

% Scattering production matrixes:

INF_SP0                   (idx, [1:   8]) = [  3.23254E-01 2.0E-05  4.53910E-03 0.00024  1.66755E-03 0.00041  3.73652E-01 6.4E-05 ];
INF_SP1                   (idx, [1:   8]) = [  2.14919E-02 0.00022 -9.76435E-04 0.00050 -1.84767E-04 0.00146  1.16199E-02 0.00039 ];
INF_SP2                   (idx, [1:   8]) = [  2.66670E-03 0.00127 -1.82696E-04 0.00233 -1.02929E-04 0.00198 -3.82469E-03 0.00100 ];
INF_SP3                   (idx, [1:   8]) = [  5.27227E-04 0.00579 -4.88881E-05 0.00700 -3.67516E-05 0.00488 -3.61292E-03 0.00084 ];
INF_SP4                   (idx, [1:   8]) = [ -4.60590E-05 0.05360 -3.63971E-05 0.00851 -2.30645E-05 0.00700 -4.19595E-03 0.00067 ];
INF_SP5                   (idx, [1:   8]) = [  1.17435E-04 0.02048 -4.21072E-06 0.06638 -5.94278E-06 0.02506 -2.44764E-03 0.00096 ];
INF_SP6                   (idx, [1:   8]) = [ -2.66306E-04 0.00874 -2.33027E-05 0.00951 -1.52288E-05 0.00875 -4.03287E-03 0.00066 ];
INF_SP7                   (idx, [1:   8]) = [  1.01449E-04 0.01939  1.86830E-05 0.01341  6.30905E-06 0.01958 -5.74534E-04 0.00352 ];

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

CMM_TRANSPXS              (idx, [1:   4]) = [  2.93246E-01 0.00023  4.13131E-01 0.00062 ];
CMM_TRANSPXS_X            (idx, [1:   4]) = [  2.94084E-01 0.00034  4.08315E-01 0.00082 ];
CMM_TRANSPXS_Y            (idx, [1:   4]) = [  2.94038E-01 0.00033  4.08341E-01 0.00082 ];
CMM_TRANSPXS_Z            (idx, [1:   4]) = [  2.91635E-01 0.00040  4.23144E-01 0.00108 ];
CMM_DIFFCOEF              (idx, [1:   4]) = [  1.13671E+00 0.00023  8.06877E-01 0.00062 ];
CMM_DIFFCOEF_X            (idx, [1:   4]) = [  1.13347E+00 0.00034  8.16419E-01 0.00082 ];
CMM_DIFFCOEF_Y            (idx, [1:   4]) = [  1.13365E+00 0.00033  8.16366E-01 0.00082 ];
CMM_DIFFCOEF_Z            (idx, [1:   4]) = [  1.14300E+00 0.00040  7.87846E-01 0.00108 ];

% Delayed neutron parameters (Meulekamp method):

BETA_EFF                  (idx, [1:  14]) = [  5.14146E-03 0.00447  1.55288E-04 0.02563  9.53304E-04 0.01036  8.45943E-04 0.01070  2.24401E-03 0.00677  7.05996E-04 0.01203  2.36922E-04 0.02109 ];
LAMBDA                    (idx, [1:  14]) = [  7.02534E-01 0.01068  1.25493E-02 0.00047  3.12317E-02 0.00030  1.09747E-01 0.00025  3.16364E-01 7.4E-05  1.28194E+00 0.00174  7.94105E+00 0.00533 ];

