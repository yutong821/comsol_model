
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
WORKING_DIRECTORY         (idx, [1: 59])  = '/global/home/users/xwa9860/FIG/res/multi_zones/ref/rods_200' ;
HOSTNAME                  (idx, [1: 12])  = 'n0020.savio1' ;
CPU_TYPE                  (idx, [1: 41])  = 'Intel(R) Xeon(R) CPU E5-2670 v2 @ 2.50GHz' ;
CPU_MHZ                   (idx, 1)        = 1046.0 ;
START_DATE                (idx, [1: 24])  = 'Sun Dec  3 17:58:32 2017' ;
COMPLETE_DATE             (idx, [1: 24])  = 'Sun Dec  3 19:27:12 2017' ;

% Run parameters:

POP                       (idx, 1)        = 10000 ;
CYCLES                    (idx, 1)        = 2000 ;
SKIP                      (idx, 1)        = 500 ;
BATCH_INTERVAL            (idx, 1)        = 1 ;
SRC_NORM_MODE             (idx, 1)        = 2 ;
SEED                      (idx, 1)        = 1512352712 ;
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
OMP_HISTORY_PROFILE       (idx, [1:  20]) = [  1.00544E+00  9.91215E-01  1.00025E+00  9.98621E-01  1.00852E+00  9.92749E-01  1.00937E+00  1.00898E+00  9.93147E-01  9.91706E-01  9.91557E-01  1.00130E+00  1.00120E+00  9.90523E-01  1.00773E+00  9.92584E-01  1.00861E+00  1.00222E+00  1.01023E+00  9.94051E-01  ];
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
ST_FRAC                   (idx, [1:   4]) = [  8.28247E-01 4.3E-05  0.00000E+00 0.0E+00 ];
DT_FRAC                   (idx, [1:   4]) = [  1.71753E-01 0.00021  0.00000E+00 0.0E+00 ];
DT_EFF                    (idx, [1:   4]) = [  2.64161E-01 3.4E-05  0.00000E+00 0.0E+00 ];
REA_SAMPLING_EFF          (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
REA_SAMPLING_FAIL         (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_COL_EFF               (idx, [1:   4]) = [  4.99978E-01 0.00013  0.00000E+00 0.0E+00 ];
AVG_TRACKING_LOOPS        (idx, [1:   8]) = [  2.88072E+01 0.00026  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
AVG_TRACKS                (idx, [1:   4]) = [  1.87958E+02 0.00026  0.00000E+00 0.0E+00 ];
AVG_REAL_COL              (idx, [1:   4]) = [  1.87923E+02 0.00026  0.00000E+00 0.0E+00 ];
AVG_VIRT_COL              (idx, [1:   4]) = [  1.87927E+02 6.4E-05  0.00000E+00 0.0E+00 ];
AVG_SURF_CROSS            (idx, [1:   4]) = [  1.11132E+03 0.00027  0.00000E+00 0.0E+00 ];
LOST_PARTICLES            (idx, 1)        = 0 ;

% Run statistics:

CYCLE_IDX                 (idx, 1)        = 2000 ;
SOURCE_POPULATION         (idx, 1)        = 20004232 ;
MEAN_POP_SIZE             (idx, [1:  2])  = [  1.00021E+04 0.00045 ];
MEAN_POP_WGT              (idx, [1:  2])  = [  1.00021E+04 0.00045 ];
SIMULATION_COMPLETED      (idx, 1)        = 1 ;

% Running times:

TOT_CPU_TIME              (idx, 1)        =  1.75333E+03 ;
RUNNING_TIME              (idx, 1)        =  8.86580E+01 ;
INIT_TIME                 (idx, [1:  2])  = [  5.20100E-01  5.20100E-01 ];
PROCESS_TIME              (idx, [1:  2])  = [  1.98017E-01  1.98017E-01 ];
TRANSPORT_CYCLE_TIME      (idx, [1:  3])  = [  8.79399E+01  8.79399E+01  0.00000E+00 ];
MPI_OVERHEAD_TIME         (idx, [1:  2])  = [  0.00000E+00  0.00000E+00 ];
ESTIMATED_RUNNING_TIME    (idx, [1:  2])  = [  8.86575E+01  0.00000E+00 ];
CPU_USAGE                 (idx, 1)        = 19.77635 ;
TRANSPORT_CPU_USAGE       (idx, [1:   2]) = [  1.98846E+01 9.2E-05 ];
OMP_PARALLEL_FRAC         (idx, 1)        =  9.90535E-01 ;

% Memory usage:

AVAIL_MEM                 (idx, 1)        = 64497.81 ;
ALLOC_MEMSIZE             (idx, 1)        = 12405.80;
MEMSIZE                   (idx, 1)        = 8627.61;
XS_MEMSIZE                (idx, 1)        = 6770.56;
MAT_MEMSIZE               (idx, 1)        = 1719.24;
RES_MEMSIZE               (idx, 1)        = 3.91;
MISC_MEMSIZE              (idx, 1)        = 133.90;
UNKNOWN_MEMSIZE           (idx, 1)        = 0.00;
UNUSED_MEMSIZE            (idx, 1)        = 3778.19;

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

NORM_COEF                 (idx, [1:   4]) = [  2.12541E+15 0.00025  0.00000E+00 0.0E+00 ];

% Analog reaction rate estimators:

CONVERSION_RATIO          (idx, [1:   2]) = [  4.54147E-01 0.00058 ];
U235_FISS                 (idx, [1:   4]) = [  4.58194E+18 0.00042  6.36356E-01 0.00029 ];
U238_FISS                 (idx, [1:   4]) = [  1.88199E+16 0.00757  2.61357E-03 0.00756 ];
PU239_FISS                (idx, [1:   4]) = [  1.99495E+18 0.00068  2.77071E-01 0.00063 ];
PU240_FISS                (idx, [1:   4]) = [  1.00982E+15 0.03300  1.40306E-04 0.03301 ];
PU241_FISS                (idx, [1:   4]) = [  5.95372E+17 0.00132  8.26888E-02 0.00130 ];
U235_CAPT                 (idx, [1:   4]) = [  1.10611E+18 0.00097  8.19267E-02 0.00094 ];
U238_CAPT                 (idx, [1:   4]) = [  3.37362E+18 0.00063  2.49852E-01 0.00049 ];
PU239_CAPT                (idx, [1:   4]) = [  1.22237E+18 0.00092  9.05428E-02 0.00092 ];
PU240_CAPT                (idx, [1:   4]) = [  1.02942E+18 0.00105  7.62406E-02 0.00098 ];
PU241_CAPT                (idx, [1:   4]) = [  2.31325E+17 0.00216  1.71330E-02 0.00214 ];
XE135_CAPT                (idx, [1:   4]) = [  2.97219E+17 0.00187  2.20162E-02 0.00188 ];
SM149_CAPT                (idx, [1:   4]) = [  1.25651E+17 0.00292  9.30773E-03 0.00293 ];

% Neutron balance (particles/weight):

BALA_SRC_NEUTRON_SRC        (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_SRC_NEUTRON_FISS       (idx, [1:  2])  = [ 20004232 2.00000E+07 ];
BALA_SRC_NEUTRON_NXN        (idx, [1:  2])  = [ 0 1.85518E+05 ];
BALA_SRC_NEUTRON_VR         (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_SRC_NEUTRON_TOT        (idx, [1:  2])  = [ 20004232 2.01855E+07 ];

BALA_LOSS_NEUTRON_CAPT       (idx, [1:  2])  = [ 12590866 1.27051E+07 ];
BALA_LOSS_NEUTRON_FISS       (idx, [1:  2])  = [ 6714582 6.77594E+06 ];
BALA_LOSS_NEUTRON_LEAK       (idx, [1:  2])  = [ 698784 7.04489E+05 ];
BALA_LOSS_NEUTRON_CUT        (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_LOSS_NEUTRON_TOT        (idx, [1:  2])  = [ 20004232 2.01855E+07 ];

BALA_NEUTRON_DIFF            (idx, [1:  2])  = [ 0 -2.94298E-07 ];

% Normalized total reaction rates (neutrons):

TOT_POWER                 (idx, [1:   2]) = [  2.36000E+08 0.0E+00 ];
TOT_POWDENS               (idx, [1:   2]) = [  5.99520E+06 0.0E+00 ];
TOT_GENRATE               (idx, [1:   2]) = [  1.87090E+19 8.5E-06 ];
TOT_FISSRATE              (idx, [1:   2]) = [  7.20031E+18 1.9E-06 ];
TOT_CAPTRATE              (idx, [1:   2]) = [  1.35023E+19 0.00030 ];
TOT_ABSRATE               (idx, [1:   2]) = [  2.07027E+19 0.00019 ];
TOT_SRCRATE               (idx, [1:   2]) = [  2.12541E+19 0.00025 ];
TOT_FLUX                  (idx, [1:   2]) = [  1.09692E+22 0.00032 ];
TOT_PHOTON_PRODRATE       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_LEAKRATE              (idx, [1:   2]) = [  7.48726E+17 0.00166 ];
ALBEDO_LEAKRATE           (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_LOSSRATE              (idx, [1:   2]) = [  2.14514E+19 0.00020 ];
TOT_CUTRATE               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_RR                    (idx, [1:   2]) = [  4.03011E+21 0.00034 ];
INI_FMASS                 (idx, 1)        =  3.93648E-05 ;
TOT_FMASS                 (idx, 1)        =  3.93648E-05 ;

% Fission neutron and energy production:

NUBAR                     (idx, [1:   2]) = [  2.59836E+00 1.0E-05 ];
FISSE                     (idx, [1:   2]) = [  2.04574E+02 1.9E-06 ];

% Criticality eigenvalues:

ANA_KEFF                  (idx, [1:   6]) = [  8.80266E-01 0.00032  8.75707E-01 0.00032  4.61791E-03 0.00538 ];
IMP_KEFF                  (idx, [1:   2]) = [  8.80299E-01 0.00020 ];
COL_KEFF                  (idx, [1:   2]) = [  8.80367E-01 0.00025 ];
ABS_KEFF                  (idx, [1:   2]) = [  8.80299E-01 0.00020 ];
ABS_KINF                  (idx, [1:   2]) = [  9.12439E-01 0.00019 ];
GEOM_ALBEDO               (idx, [1:   6]) = [  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00 ];

% ALF (Average lethargy of neutrons causing fission):
% Based on E0 = 2.000000E+01 MeV

ANA_ALF                   (idx, [1:   2]) = [  1.80340E+01 5.3E-05 ];
IMP_ALF                   (idx, [1:   2]) = [  1.80331E+01 2.4E-05 ];

% EALF (Energy corresponding to average lethargy of neutrons causing fission):

ANA_EALF                  (idx, [1:   2]) = [  2.94693E-07 0.00095 ];
IMP_EALF                  (idx, [1:   2]) = [  2.94733E-07 0.00044 ];

% AFGE (Average energy of neutrons causing fission):

ANA_AFGE                  (idx, [1:   2]) = [  1.17435E-02 0.00635 ];
IMP_AFGE                  (idx, [1:   2]) = [  1.18483E-02 0.00168 ];

% Forward-weighted delayed neutron parameters:

FWD_ANA_BETA_ZERO         (idx, [1:  14]) = [  5.95187E-03 0.00313  1.77282E-04 0.01835  1.09070E-03 0.00738  9.69543E-04 0.00767  2.62239E-03 0.00475  8.19075E-04 0.00848  2.72879E-04 0.01420 ];
FWD_ANA_LAMBDA            (idx, [1:  14]) = [  7.02724E-01 0.00744  9.79590E-03 0.01189  3.12108E-02 0.00054  1.09715E-01 0.00018  3.16476E-01 5.6E-05  1.28077E+00 0.00150  7.26010E+00 0.00799 ];

% Beta-eff using Meulekamp's method:

ADJ_MEULEKAMP_BETA_EFF    (idx, [1:  14]) = [  5.21326E-03 0.00461  1.50112E-04 0.02696  9.56005E-04 0.01077  8.48081E-04 0.01133  2.29744E-03 0.00710  7.17249E-04 0.01252  2.44376E-04 0.02151 ];
ADJ_MEULEKAMP_LAMBDA      (idx, [1:  14]) = [  7.11002E-01 0.01118  1.25648E-02 0.00052  3.12300E-02 0.00031  1.09723E-01 0.00026  3.16461E-01 8.2E-05  1.28724E+00 0.00166  7.85745E+00 0.00549 ];

% Adjoint weighted time constants using Nauchi's method:

ADJ_NAUCHI_GEN_TIME       (idx, [1:   6]) = [  6.16797E-04 0.00089  6.16882E-04 0.00089  5.98405E-04 0.01179 ];
ADJ_NAUCHI_LIFETIME       (idx, [1:   6]) = [  5.42837E-04 0.00083  5.42912E-04 0.00083  5.26657E-04 0.01179 ];
ADJ_NAUCHI_BETA_EFF       (idx, [1:  14]) = [  5.24471E-03 0.00540  1.51136E-04 0.03220  9.64624E-04 0.01264  8.59457E-04 0.01339  2.31474E-03 0.00779  7.14365E-04 0.01480  2.40391E-04 0.02512 ];
ADJ_NAUCHI_LAMBDA         (idx, [1:  14]) = [  6.99991E-01 0.01342  1.25650E-02 0.00073  3.12353E-02 0.00040  1.09750E-01 0.00034  3.16468E-01 0.00010  1.28673E+00 0.00215  7.85602E+00 0.00740 ];

% Adjoint weighted time constants using IFP:

ADJ_IFP_GEN_TIME          (idx, [1:   6]) = [  6.28473E-04 0.00225  6.28589E-04 0.00226  5.56513E-04 0.02853 ];
ADJ_IFP_LIFETIME          (idx, [1:   6]) = [  5.53090E-04 0.00222  5.53191E-04 0.00223  4.89942E-04 0.02852 ];
ADJ_IFP_IMP_BETA_EFF      (idx, [1:  14]) = [  5.41615E-03 0.01815  1.46666E-04 0.10069  1.04491E-03 0.04242  9.10869E-04 0.04517  2.32171E-03 0.02699  7.67350E-04 0.04919  2.24648E-04 0.08130 ];
ADJ_IFP_IMP_LAMBDA        (idx, [1:  14]) = [  6.71544E-01 0.04152  1.25363E-02 0.00142  3.12911E-02 0.00091  1.09737E-01 0.00076  3.16468E-01 0.00026  1.29563E+00 0.00464  7.71238E+00 0.01861 ];
ADJ_IFP_ANA_BETA_EFF      (idx, [1:  14]) = [  5.41266E-03 0.01794  1.50969E-04 0.10133  1.03267E-03 0.04144  9.12129E-04 0.04432  2.31832E-03 0.02661  7.66117E-04 0.04821  2.32448E-04 0.07958 ];
ADJ_IFP_ANA_LAMBDA        (idx, [1:  14]) = [  6.79271E-01 0.04100  1.25367E-02 0.00142  3.12938E-02 0.00091  1.09736E-01 0.00076  3.16458E-01 0.00026  1.29560E+00 0.00465  7.71748E+00 0.01854 ];
ADJ_IFP_ROSSI_ALPHA       (idx, [1:   2]) = [ -8.69646E+00 0.01826 ];

% Adjoint weighted time constants using perturbation technique:

ADJ_PERT_GEN_TIME         (idx, [1:   2]) = [  6.19821E-04 0.00057 ];
ADJ_PERT_LIFETIME         (idx, [1:   2]) = [  5.45496E-04 0.00047 ];
ADJ_PERT_BETA_EFF         (idx, [1:   2]) = [  5.31188E-03 0.00356 ];
ADJ_PERT_ROSSI_ALPHA      (idx, [1:   2]) = [ -8.57597E+00 0.00361 ];

% Inverse neutron speed :

ANA_INV_SPD               (idx, [1:   2]) = [  1.10652E-06 0.00022 ];

% Analog slowing-down and thermal neutron lifetime (total/prompt/delayed):

ANA_SLOW_TIME             (idx, [1:   6]) = [  3.51647E-05 9.2E-05  3.51640E-05 9.2E-05  3.52932E-05 0.00126 ];
ANA_THERM_TIME            (idx, [1:   6]) = [  8.40198E-04 0.00042  8.40386E-04 0.00042  8.02643E-04 0.00573 ];
ANA_THERM_FRAC            (idx, [1:   6]) = [  6.48235E-01 0.00018  6.48807E-01 0.00018  5.64110E-01 0.00511 ];
ANA_DELAYED_EMTIME        (idx, [1:   2]) = [  1.12320E+01 0.00703 ];
ANA_MEAN_NCOL             (idx, [1:   4]) = [  1.87923E+02 0.00026  1.87364E+02 0.00035 ];

% Group constant generation:

GC_UNIVERSE_NAME          (idx, [1:  1])  = '0' ;

% Micro- and macro-group structures:

MICRO_NG                  (idx, 1)        = 70 ;
MICRO_E                   (idx, [1:  71]) = [  1.00000E-11  5.00000E-09  1.00000E-08  1.50000E-08  2.00000E-08  2.50000E-08  3.00000E-08  3.50000E-08  4.20000E-08  5.00000E-08  5.80000E-08  6.70000E-08  8.00000E-08  1.00000E-07  1.40000E-07  1.80000E-07  2.20000E-07  2.50000E-07  2.80000E-07  3.00000E-07  3.20000E-07  3.50000E-07  4.00000E-07  5.00000E-07  6.25000E-07  7.80000E-07  8.50000E-07  9.10000E-07  9.50000E-07  9.72000E-07  9.96000E-07  1.02000E-06  1.04500E-06  1.07100E-06  1.09700E-06  1.12300E-06  1.15000E-06  1.30000E-06  1.50000E-06  1.85500E-06  2.10000E-06  2.60000E-06  3.30000E-06  4.00000E-06  9.87700E-06  1.59680E-05  2.77000E-05  4.80520E-05  7.55014E-05  1.48728E-04  3.67262E-04  9.06898E-04  1.42510E-03  2.23945E-03  3.51910E-03  5.50000E-03  9.11800E-03  1.50300E-02  2.47800E-02  4.08500E-02  6.74300E-02  1.11000E-01  1.83000E-01  3.02500E-01  5.00000E-01  8.21000E-01  1.35300E+00  2.23100E+00  3.67900E+00  6.06550E+00  2.00000E+01 ];

MACRO_NG                  (idx, 1)        = 2 ;
MACRO_E                   (idx, [1:   3]) = [  1.00000E+37  6.25000E-07  0.00000E+00 ];

% Micro-group spectrum:

INF_MICRO_FLX             (idx, [1: 140]) = [  8.61298E+04 0.00137  3.94134E+05 0.00072  9.10310E+05 0.00038  1.67186E+06 0.00028  1.87380E+06 0.00022  1.93846E+06 0.00015  1.45924E+06 0.00016  1.14478E+06 0.00018  1.62283E+06 0.00016  1.60275E+06 0.00012  1.73927E+06 0.00011  1.72867E+06 0.00011  1.88206E+06 0.00010  1.83693E+06 0.00012  1.84232E+06 0.00010  1.61606E+06 0.00012  1.62531E+06 0.00012  1.61621E+06 0.00012  1.60589E+06 0.00012  3.17954E+06 9.2E-05  3.12387E+06 9.6E-05  2.28847E+06 0.00013  1.49041E+06 0.00014  1.77231E+06 0.00014  1.69934E+06 0.00016  1.44282E+06 0.00017  2.53113E+06 0.00015  5.32785E+05 0.00028  6.66426E+05 0.00026  6.01476E+05 0.00030  3.54695E+05 0.00036  6.19508E+05 0.00032  4.25554E+05 0.00040  3.68096E+05 0.00039  7.10460E+04 0.00071  6.89888E+04 0.00076  6.92349E+04 0.00069  7.01549E+04 0.00066  7.02428E+04 0.00069  7.11750E+04 0.00068  7.52858E+04 0.00068  7.21320E+04 0.00080  1.38769E+05 0.00057  2.29734E+05 0.00045  3.11734E+05 0.00047  1.00481E+06 0.00038  1.56862E+06 0.00047  2.51839E+06 0.00054  2.07992E+06 0.00060  1.65018E+06 0.00064  1.30949E+06 0.00066  1.50291E+06 0.00066  2.68028E+06 0.00068  3.27732E+06 0.00070  5.42509E+06 0.00070  6.70855E+06 0.00071  7.78614E+06 0.00074  4.07500E+06 0.00075  2.59209E+06 0.00076  1.71732E+06 0.00079  1.45759E+06 0.00079  1.38257E+06 0.00079  1.06342E+06 0.00081  7.04010E+05 0.00085  5.96575E+05 0.00085  5.47304E+05 0.00092  4.54559E+05 0.00090  3.08750E+05 0.00096  2.04714E+05 0.00113  6.39444E+04 0.00141 ];

% Integral parameters:

INF_KINF                  (idx, [1:   2]) = [  9.12512E-01 0.00034 ];

% Flux spectra in infinite geometry:

INF_FLX                   (idx, [1:   4]) = [  5.47789E+21 0.00029  5.49144E+21 0.00062 ];
INF_FISS_FLX              (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reaction cross sections:

INF_TOT                   (idx, [1:   4]) = [  3.40332E-01 2.3E-05  3.94407E-01 5.6E-05 ];
INF_CAPT                  (idx, [1:   4]) = [  1.18756E-03 0.00044  1.27423E-03 0.00062 ];
INF_ABS                   (idx, [1:   4]) = [  1.36616E-03 0.00041  2.40746E-03 0.00058 ];
INF_FISS                  (idx, [1:   4]) = [  1.78600E-04 0.00048  1.13323E-03 0.00060 ];
INF_NSF                   (idx, [1:   4]) = [  4.50507E-04 0.00047  2.95805E-03 0.00060 ];
INF_NUBAR                 (idx, [1:   4]) = [  2.52243E+00 1.7E-05  2.61029E+00 1.3E-05 ];
INF_KAPPA                 (idx, [1:   4]) = [  2.03519E+02 2.8E-06  2.04740E+02 2.3E-06 ];
INF_INVV                  (idx, [1:   4]) = [  1.13053E-07 0.00012  2.09776E-06 4.2E-05 ];

% Total scattering cross sections:

INF_SCATT0                (idx, [1:   4]) = [  3.38966E-01 2.4E-05  3.91999E-01 5.9E-05 ];
INF_SCATT1                (idx, [1:   4]) = [  2.14844E-02 0.00021  1.11995E-02 0.00051 ];
INF_SCATT2                (idx, [1:   4]) = [  2.52173E-03 0.00139 -4.70975E-03 0.00088 ];
INF_SCATT3                (idx, [1:   4]) = [  4.83508E-04 0.00702 -4.28008E-03 0.00080 ];
INF_SCATT4                (idx, [1:   4]) = [ -1.46732E-04 0.01990 -4.94233E-03 0.00062 ];
INF_SCATT5                (idx, [1:   4]) = [  1.20047E-04 0.01945 -2.86623E-03 0.00090 ];
INF_SCATT6                (idx, [1:   4]) = [ -3.36078E-04 0.00691 -4.75073E-03 0.00051 ];
INF_SCATT7                (idx, [1:   4]) = [  1.40877E-04 0.01233 -6.55478E-04 0.00290 ];

% Total scattering production cross sections:

INF_SCATTP0               (idx, [1:   4]) = [  3.39002E-01 2.4E-05  3.91999E-01 5.9E-05 ];
INF_SCATTP1               (idx, [1:   4]) = [  2.14939E-02 0.00021  1.11995E-02 0.00051 ];
INF_SCATTP2               (idx, [1:   4]) = [  2.52348E-03 0.00139 -4.70975E-03 0.00088 ];
INF_SCATTP3               (idx, [1:   4]) = [  4.83696E-04 0.00702 -4.28008E-03 0.00080 ];
INF_SCATTP4               (idx, [1:   4]) = [ -1.46718E-04 0.01994 -4.94233E-03 0.00062 ];
INF_SCATTP5               (idx, [1:   4]) = [  1.20024E-04 0.01951 -2.86623E-03 0.00090 ];
INF_SCATTP6               (idx, [1:   4]) = [ -3.36082E-04 0.00692 -4.75073E-03 0.00051 ];
INF_SCATTP7               (idx, [1:   4]) = [  1.40826E-04 0.01234 -6.55478E-04 0.00290 ];

% Diffusion parameters:

INF_TRANSPXS              (idx, [1:   4]) = [  3.01583E-01 3.3E-05  3.81666E-01 6.1E-05 ];
INF_DIFFCOEF              (idx, [1:   4]) = [  1.10528E+00 3.3E-05  8.73365E-01 6.1E-05 ];

% Reduced absoption and removal:

INF_RABSXS                (idx, [1:   4]) = [  1.33017E-03 0.00044  2.40746E-03 0.00058 ];
INF_REMXS                 (idx, [1:   4]) = [  5.70704E-03 0.00017  4.24850E-03 0.00048 ];

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

INF_S0                    (idx, [1:   8]) = [  3.34625E-01 2.2E-05  4.34101E-03 0.00031  1.84112E-03 0.00045  3.90158E-01 6.0E-05 ];
INF_S1                    (idx, [1:   8]) = [  2.24244E-02 0.00020 -9.39994E-04 0.00056 -2.12020E-04 0.00167  1.14115E-02 0.00050 ];
INF_S2                    (idx, [1:   8]) = [  2.70141E-03 0.00129 -1.79681E-04 0.00198 -1.17612E-04 0.00223 -4.59214E-03 0.00091 ];
INF_S3                    (idx, [1:   8]) = [  5.31946E-04 0.00629 -4.84377E-05 0.00616 -4.11041E-05 0.00499 -4.23897E-03 0.00081 ];
INF_S4                    (idx, [1:   8]) = [ -1.08739E-04 0.02648 -3.79928E-05 0.00814 -2.70725E-05 0.00720 -4.91526E-03 0.00062 ];
INF_S5                    (idx, [1:   8]) = [  1.23829E-04 0.01872 -3.78209E-06 0.07415 -6.33825E-06 0.02613 -2.85989E-03 0.00090 ];
INF_S6                    (idx, [1:   8]) = [ -3.10421E-04 0.00748 -2.56573E-05 0.01008 -1.83687E-05 0.00842 -4.73236E-03 0.00051 ];
INF_S7                    (idx, [1:   8]) = [  1.18998E-04 0.01450  2.18787E-05 0.00941  8.38127E-06 0.01525 -6.63860E-04 0.00288 ];

% Scattering production matrixes:

INF_SP0                   (idx, [1:   8]) = [  3.34661E-01 2.2E-05  4.34101E-03 0.00031  1.84112E-03 0.00045  3.90158E-01 6.0E-05 ];
INF_SP1                   (idx, [1:   8]) = [  2.24339E-02 0.00020 -9.39994E-04 0.00056 -2.12020E-04 0.00167  1.14115E-02 0.00050 ];
INF_SP2                   (idx, [1:   8]) = [  2.70316E-03 0.00129 -1.79681E-04 0.00198 -1.17612E-04 0.00223 -4.59214E-03 0.00091 ];
INF_SP3                   (idx, [1:   8]) = [  5.32133E-04 0.00629 -4.84377E-05 0.00616 -4.11041E-05 0.00499 -4.23897E-03 0.00081 ];
INF_SP4                   (idx, [1:   8]) = [ -1.08726E-04 0.02653 -3.79928E-05 0.00814 -2.70725E-05 0.00720 -4.91526E-03 0.00062 ];
INF_SP5                   (idx, [1:   8]) = [  1.23806E-04 0.01877 -3.78209E-06 0.07415 -6.33825E-06 0.02613 -2.85989E-03 0.00090 ];
INF_SP6                   (idx, [1:   8]) = [ -3.10424E-04 0.00749 -2.56573E-05 0.01008 -1.83687E-05 0.00842 -4.73236E-03 0.00051 ];
INF_SP7                   (idx, [1:   8]) = [  1.18947E-04 0.01452  2.18787E-05 0.00941  8.38127E-06 0.01525 -6.63860E-04 0.00288 ];

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

CMM_TRANSPXS              (idx, [1:   4]) = [  3.02698E-01 0.00021  4.64994E-01 0.00071 ];
CMM_TRANSPXS_X            (idx, [1:   4]) = [  3.02425E-01 0.00034  4.53824E-01 0.00102 ];
CMM_TRANSPXS_Y            (idx, [1:   4]) = [  3.02370E-01 0.00036  4.53590E-01 0.00098 ];
CMM_TRANSPXS_Z            (idx, [1:   4]) = [  3.03309E-01 0.00034  4.89424E-01 0.00105 ];
CMM_DIFFCOEF              (idx, [1:   4]) = [  1.10121E+00 0.00021  7.16890E-01 0.00071 ];
CMM_DIFFCOEF_X            (idx, [1:   4]) = [  1.10221E+00 0.00034  7.34575E-01 0.00102 ];
CMM_DIFFCOEF_Y            (idx, [1:   4]) = [  1.10242E+00 0.00036  7.34947E-01 0.00097 ];
CMM_DIFFCOEF_Z            (idx, [1:   4]) = [  1.09900E+00 0.00035  6.81148E-01 0.00106 ];

% Delayed neutron parameters (Meulekamp method):

BETA_EFF                  (idx, [1:  14]) = [  5.21326E-03 0.00461  1.50112E-04 0.02696  9.56005E-04 0.01077  8.48081E-04 0.01133  2.29744E-03 0.00710  7.17249E-04 0.01252  2.44376E-04 0.02151 ];
LAMBDA                    (idx, [1:  14]) = [  7.11002E-01 0.01118  1.25648E-02 0.00052  3.12300E-02 0.00031  1.09723E-01 0.00026  3.16461E-01 8.2E-05  1.28724E+00 0.00166  7.85745E+00 0.00549 ];
