
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
WORKING_DIRECTORY         (idx, [1: 56])  = '/global/home/users/xwa9860/FIG/res/multi_zones/ref/maxpf' ;
HOSTNAME                  (idx, [1: 12])  = 'n0125.savio1' ;
CPU_TYPE                  (idx, [1: 41])  = 'Intel(R) Xeon(R) CPU E5-2670 v2 @ 2.50GHz' ;
CPU_MHZ                   (idx, 1)        = 1060.0 ;
START_DATE                (idx, [1: 24])  = 'Wed Dec  6 09:13:44 2017' ;
COMPLETE_DATE             (idx, [1: 24])  = 'Wed Dec  6 09:34:32 2017' ;

% Run parameters:

POP                       (idx, 1)        = 10000 ;
CYCLES                    (idx, 1)        = 2000 ;
SKIP                      (idx, 1)        = 500 ;
BATCH_INTERVAL            (idx, 1)        = 1 ;
SRC_NORM_MODE             (idx, 1)        = 2 ;
SEED                      (idx, 1)        = 1512580424 ;
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
OMP_HISTORY_PROFILE       (idx, [1:  20]) = [  9.87986E-01  1.00960E+00  1.00882E+00  1.00052E+00  9.99437E-01  9.97710E-01  9.99194E-01  1.01029E+00  1.00082E+00  9.99890E-01  9.88711E-01  1.00889E+00  9.90496E-01  1.01215E+00  9.91282E-01  1.00779E+00  9.91583E-01  1.00304E+00  9.90792E-01  1.00099E+00  ];
SHARE_BUF_ARRAY           (idx, 1)        = 0 ;
SHARE_RES2_ARRAY          (idx, 1)        = 1 ;

% File paths:

XS_DATA_FILE_PATH         (idx, [1: 71])  = '/global/home/groups/ac_nuclear/serpent/xsdata/endfb7/sss_endfb7u.xsdata' ;
DECAY_DATA_FILE_PATH      (idx, [1:  3])  = 'N/A' ;
SFY_DATA_FILE_PATH        (idx, [1:  3])  = 'N/A' ;
NFY_DATA_FILE_PATH        (idx, [1:  3])  = 'N/A' ;
BRA_DATA_FILE_PATH        (idx, [1:  3])  = 'N/A' ;

% Collision and reaction sampling (neutrons/photons):

MIN_MACROXS               (idx, [1:   4]) = [  5.00000E-02 1.6E-09  0.00000E+00 0.0E+00 ];
DT_THRESH                 (idx, [1:  2])  = [  9.00000E-01  9.00000E-01 ];
ST_FRAC                   (idx, [1:   4]) = [  8.97797E-02 0.00053  0.00000E+00 0.0E+00 ];
DT_FRAC                   (idx, [1:   4]) = [  9.10220E-01 5.2E-05  0.00000E+00 0.0E+00 ];
DT_EFF                    (idx, [1:   4]) = [  2.52462E-01 9.9E-05  0.00000E+00 0.0E+00 ];
REA_SAMPLING_EFF          (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
REA_SAMPLING_FAIL         (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_COL_EFF               (idx, [1:   4]) = [  2.57389E-01 9.9E-05  0.00000E+00 0.0E+00 ];
AVG_TRACKING_LOOPS        (idx, [1:   8]) = [  1.07243E+01 0.00049  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
AVG_TRACKS                (idx, [1:   4]) = [  1.75096E+02 0.00038  0.00000E+00 0.0E+00 ];
AVG_REAL_COL              (idx, [1:   4]) = [  1.75079E+02 0.00038  0.00000E+00 0.0E+00 ];
AVG_VIRT_COL              (idx, [1:   4]) = [  5.05160E+02 0.00050  0.00000E+00 0.0E+00 ];
AVG_SURF_CROSS            (idx, [1:   4]) = [  6.21769E+01 0.00037  0.00000E+00 0.0E+00 ];
LOST_PARTICLES            (idx, 1)        = 0 ;

% Run statistics:

CYCLE_IDX                 (idx, 1)        = 950 ;
SOURCE_POPULATION         (idx, 1)        = 9501884 ;
MEAN_POP_SIZE             (idx, [1:  2])  = [  1.00020E+04 0.00063 ];
MEAN_POP_WGT              (idx, [1:  2])  = [  1.00020E+04 0.00063 ];
SIMULATION_COMPLETED      (idx, 1)        = 0 ;

% Running times:

TOT_CPU_TIME              (idx, 1)        =  3.98707E+02 ;
RUNNING_TIME              (idx, 1)        =  2.08026E+01 ;
INIT_TIME                 (idx, [1:  2])  = [  7.53483E-01  7.53483E-01 ];
PROCESS_TIME              (idx, [1:  2])  = [  1.48833E-01  1.48833E-01 ];
TRANSPORT_CYCLE_TIME      (idx, [1:  3])  = [  1.99003E+01  0.00000E+00  0.00000E+00 ];
MPI_OVERHEAD_TIME         (idx, [1:  2])  = [  0.00000E+00  0.00000E+00 ];
ESTIMATED_RUNNING_TIME    (idx, [1:  2])  = [  3.63940E+01  0.00000E+00 ];
CPU_USAGE                 (idx, 1)        = 19.16619 ;
TRANSPORT_CPU_USAGE       (idx, [1:   2]) = [  1.98418E+01 0.00019 ];
OMP_PARALLEL_FRAC         (idx, 1)        =  9.55869E-01 ;

% Memory usage:

AVAIL_MEM                 (idx, 1)        = 64497.80 ;
ALLOC_MEMSIZE             (idx, 1)        = 12385.44;
MEMSIZE                   (idx, 1)        = 8607.40;
XS_MEMSIZE                (idx, 1)        = 6770.56;
MAT_MEMSIZE               (idx, 1)        = 1698.82;
RES_MEMSIZE               (idx, 1)        = 3.91;
MISC_MEMSIZE              (idx, 1)        = 134.10;
UNKNOWN_MEMSIZE           (idx, 1)        = 0.00;
UNUSED_MEMSIZE            (idx, 1)        = 3778.05;

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

NORM_COEF                 (idx, [1:   4]) = [  1.97150E+15 0.00036  0.00000E+00 0.0E+00 ];

% Analog reaction rate estimators:

CONVERSION_RATIO          (idx, [1:   2]) = [  4.82994E-01 0.00083 ];
U235_FISS                 (idx, [1:   4]) = [  4.57449E+18 0.00058  6.35424E-01 0.00041 ];
U238_FISS                 (idx, [1:   4]) = [  2.27149E+16 0.00938  3.15380E-03 0.00933 ];
PU239_FISS                (idx, [1:   4]) = [  2.00190E+18 0.00097  2.78075E-01 0.00087 ];
PU240_FISS                (idx, [1:   4]) = [  1.14383E+15 0.04202  1.58855E-04 0.04203 ];
PU241_FISS                (idx, [1:   4]) = [  5.90049E+17 0.00186  8.19624E-02 0.00182 ];
U235_CAPT                 (idx, [1:   4]) = [  1.13454E+18 0.00133  9.22128E-02 0.00130 ];
U238_CAPT                 (idx, [1:   4]) = [  3.60503E+18 0.00089  2.92969E-01 0.00066 ];
PU239_CAPT                (idx, [1:   4]) = [  1.23158E+18 0.00128  1.00101E-01 0.00126 ];
PU240_CAPT                (idx, [1:   4]) = [  1.09344E+18 0.00145  8.88618E-02 0.00134 ];
PU241_CAPT                (idx, [1:   4]) = [  2.30228E+17 0.00299  1.87139E-02 0.00301 ];
XE135_CAPT                (idx, [1:   4]) = [  2.83277E+17 0.00266  2.30244E-02 0.00265 ];
SM149_CAPT                (idx, [1:   4]) = [  1.20382E+17 0.00422  9.78425E-03 0.00421 ];

% Neutron balance (particles/weight):

BALA_SRC_NEUTRON_SRC        (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_SRC_NEUTRON_FISS       (idx, [1:  2])  = [ 9501884 9.50000E+06 ];
BALA_SRC_NEUTRON_NXN        (idx, [1:  2])  = [ 0 6.41431E+04 ];
BALA_SRC_NEUTRON_VR         (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_SRC_NEUTRON_TOT        (idx, [1:  2])  = [ 9501884 9.56414E+06 ];

BALA_LOSS_NEUTRON_CAPT       (idx, [1:  2])  = [ 5890234 5.92902E+06 ];
BALA_LOSS_NEUTRON_FISS       (idx, [1:  2])  = [ 3446894 3.46929E+06 ];
BALA_LOSS_NEUTRON_LEAK       (idx, [1:  2])  = [ 164756 1.65835E+05 ];
BALA_LOSS_NEUTRON_CUT        (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_LOSS_NEUTRON_TOT        (idx, [1:  2])  = [ 9501884 9.56414E+06 ];

BALA_NEUTRON_DIFF            (idx, [1:  2])  = [ 0 -1.04308E-07 ];

% Normalized total reaction rates (neutrons):

TOT_POWER                 (idx, [1:   2]) = [  2.36000E+08 0.0E+00 ];
TOT_POWDENS               (idx, [1:   2]) = [  5.99520E+06 0.0E+00 ];
TOT_GENRATE               (idx, [1:   2]) = [  1.87112E+19 1.2E-05 ];
TOT_FISSRATE              (idx, [1:   2]) = [  7.20017E+18 2.6E-06 ];
TOT_CAPTRATE              (idx, [1:   2]) = [  1.22992E+19 0.00042 ];
TOT_ABSRATE               (idx, [1:   2]) = [  1.94994E+19 0.00026 ];
TOT_SRCRATE               (idx, [1:   2]) = [  1.97150E+19 0.00036 ];
TOT_FLUX                  (idx, [1:   2]) = [  9.43425E+21 0.00046 ];
TOT_PHOTON_PRODRATE       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_LEAKRATE              (idx, [1:   2]) = [  3.44212E+17 0.00336 ];
ALBEDO_LEAKRATE           (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_LOSSRATE              (idx, [1:   2]) = [  1.98436E+19 0.00027 ];
TOT_CUTRATE               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_RR                    (idx, [1:   2]) = [  3.47473E+21 0.00048 ];
INI_FMASS                 (idx, 1)        =  3.93648E-05 ;
TOT_FMASS                 (idx, 1)        =  3.93648E-05 ;

% Fission neutron and energy production:

NUBAR                     (idx, [1:   2]) = [  2.59872E+00 1.5E-05 ];
FISSE                     (idx, [1:   2]) = [  2.04578E+02 2.6E-06 ];

% Criticality eigenvalues:

ANA_KEFF                  (idx, [1:   6]) = [  9.48965E-01 0.00045  9.44093E-01 0.00045  4.90172E-03 0.00763 ];
IMP_KEFF                  (idx, [1:   2]) = [  9.49354E-01 0.00027 ];
COL_KEFF                  (idx, [1:   2]) = [  9.49202E-01 0.00036 ];
ABS_KEFF                  (idx, [1:   2]) = [  9.49354E-01 0.00027 ];
ABS_KINF                  (idx, [1:   2]) = [  9.66224E-01 0.00026 ];
GEOM_ALBEDO               (idx, [1:   6]) = [  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00 ];

% ALF (Average lethargy of neutrons causing fission):
% Based on E0 = 2.000000E+01 MeV

ANA_ALF                   (idx, [1:   2]) = [  1.79094E+01 7.9E-05 ];
IMP_ALF                   (idx, [1:   2]) = [  1.79110E+01 3.6E-05 ];

% EALF (Energy corresponding to average lethargy of neutrons causing fission):

ANA_EALF                  (idx, [1:   2]) = [  3.33809E-07 0.00142 ];
IMP_EALF                  (idx, [1:   2]) = [  3.33020E-07 0.00065 ];

% AFGE (Average energy of neutrons causing fission):

ANA_AFGE                  (idx, [1:   2]) = [  1.39541E-02 0.00815 ];
IMP_AFGE                  (idx, [1:   2]) = [  1.39871E-02 0.00218 ];

% Forward-weighted delayed neutron parameters:

FWD_ANA_BETA_ZERO         (idx, [1:  14]) = [  5.49270E-03 0.00480  1.73025E-04 0.02441  1.03386E-03 0.01048  8.75358E-04 0.01144  2.40798E-03 0.00713  7.52333E-04 0.01248  2.50140E-04 0.02098 ];
FWD_ANA_LAMBDA            (idx, [1:  14]) = [  7.02846E-01 0.01101  1.02298E-02 0.01549  3.12294E-02 0.00032  1.09727E-01 0.00027  3.16519E-01 8.5E-05  1.28202E+00 0.00187  7.21987E+00 0.01242 ];

% Beta-eff using Meulekamp's method:

ADJ_MEULEKAMP_BETA_EFF    (idx, [1:  14]) = [  5.17879E-03 0.00656  1.66878E-04 0.03598  9.87880E-04 0.01527  8.20967E-04 0.01685  2.27373E-03 0.01000  6.93856E-04 0.01821  2.35473E-04 0.02913 ];
ADJ_MEULEKAMP_LAMBDA      (idx, [1:  14]) = [  6.95217E-01 0.01542  1.25632E-02 0.00072  3.12287E-02 0.00044  1.09760E-01 0.00037  3.16539E-01 0.00012  1.28409E+00 0.00253  7.98055E+00 0.00770 ];

% Adjoint weighted time constants using Nauchi's method:

ADJ_NAUCHI_GEN_TIME       (idx, [1:   6]) = [  5.13671E-04 0.00123  5.13777E-04 0.00124  4.95421E-04 0.01757 ];
ADJ_NAUCHI_LIFETIME       (idx, [1:   6]) = [  4.87359E-04 0.00114  4.87460E-04 0.00115  4.70076E-04 0.01758 ];
ADJ_NAUCHI_BETA_EFF       (idx, [1:  14]) = [  5.16007E-03 0.00769  1.72486E-04 0.04014  9.76843E-04 0.01711  8.01069E-04 0.01960  2.28287E-03 0.01177  6.99143E-04 0.02035  2.27659E-04 0.03587 ];
ADJ_NAUCHI_LAMBDA         (idx, [1:  14]) = [  6.84678E-01 0.01839  1.25660E-02 0.00102  3.12511E-02 0.00055  1.09748E-01 0.00049  3.16510E-01 0.00015  1.27928E+00 0.00313  8.01340E+00 0.00984 ];

% Adjoint weighted time constants using IFP:

ADJ_IFP_GEN_TIME          (idx, [1:   6]) = [  4.94303E-04 0.00293  4.94562E-04 0.00294  4.28025E-04 0.04387 ];
ADJ_IFP_LIFETIME          (idx, [1:   6]) = [  4.69023E-04 0.00293  4.69270E-04 0.00294  4.05938E-04 0.04383 ];
ADJ_IFP_IMP_BETA_EFF      (idx, [1:  14]) = [  5.23890E-03 0.02608  1.79549E-04 0.14354  9.74678E-04 0.05771  8.09918E-04 0.06360  2.24217E-03 0.03824  8.13964E-04 0.06683  2.18620E-04 0.13348 ];
ADJ_IFP_IMP_LAMBDA        (idx, [1:  14]) = [  5.98759E-01 0.05318  1.25574E-02 0.00219  3.12060E-02 0.00130  1.09716E-01 0.00116  3.16392E-01 0.00035  1.27115E+00 0.00736  7.99044E+00 0.02863 ];
ADJ_IFP_ANA_BETA_EFF      (idx, [1:  14]) = [  5.20726E-03 0.02538  1.83857E-04 0.13988  9.67812E-04 0.05573  8.02109E-04 0.06290  2.23579E-03 0.03715  7.94990E-04 0.06547  2.22698E-04 0.13100 ];
ADJ_IFP_ANA_LAMBDA        (idx, [1:  14]) = [  6.06247E-01 0.05378  1.25565E-02 0.00217  3.12079E-02 0.00129  1.09712E-01 0.00115  3.16383E-01 0.00035  1.27019E+00 0.00740  8.00268E+00 0.02820 ];
ADJ_IFP_ROSSI_ALPHA       (idx, [1:   2]) = [ -1.06743E+01 0.02612 ];

% Adjoint weighted time constants using perturbation technique:

ADJ_PERT_GEN_TIME         (idx, [1:   2]) = [  5.05060E-04 0.00078 ];
ADJ_PERT_LIFETIME         (idx, [1:   2]) = [  4.79186E-04 0.00061 ];
ADJ_PERT_BETA_EFF         (idx, [1:   2]) = [  5.21896E-03 0.00461 ];
ADJ_PERT_ROSSI_ALPHA      (idx, [1:   2]) = [ -1.03423E+01 0.00476 ];

% Inverse neutron speed :

ANA_INV_SPD               (idx, [1:   2]) = [  1.03593E-06 0.00036 ];

% Analog slowing-down and thermal neutron lifetime (total/prompt/delayed):

ANA_SLOW_TIME             (idx, [1:   6]) = [  3.41680E-05 0.00013  3.41674E-05 0.00013  3.42932E-05 0.00183 ];
ANA_THERM_TIME            (idx, [1:   6]) = [  7.49821E-04 0.00067  7.50014E-04 0.00067  7.11821E-04 0.00877 ];
ANA_THERM_FRAC            (idx, [1:   6]) = [  6.27484E-01 0.00027  6.27770E-01 0.00027  5.88717E-01 0.00761 ];
ANA_DELAYED_EMTIME        (idx, [1:   2]) = [  1.15528E+01 0.01041 ];
ANA_MEAN_NCOL             (idx, [1:   4]) = [  1.75079E+02 0.00038  1.79768E+02 0.00045 ];

% Group constant generation:

GC_UNIVERSE_NAME          (idx, [1:  1])  = '0' ;

% Micro- and macro-group structures:

MICRO_NG                  (idx, 1)        = 70 ;
MICRO_E                   (idx, [1:  71]) = [  1.00000E-11  5.00000E-09  1.00000E-08  1.50000E-08  2.00000E-08  2.50000E-08  3.00000E-08  3.50000E-08  4.20000E-08  5.00000E-08  5.80000E-08  6.70000E-08  8.00000E-08  1.00000E-07  1.40000E-07  1.80000E-07  2.20000E-07  2.50000E-07  2.80000E-07  3.00000E-07  3.20000E-07  3.50000E-07  4.00000E-07  5.00000E-07  6.25000E-07  7.80000E-07  8.50000E-07  9.10000E-07  9.50000E-07  9.72000E-07  9.96000E-07  1.02000E-06  1.04500E-06  1.07100E-06  1.09700E-06  1.12300E-06  1.15000E-06  1.30000E-06  1.50000E-06  1.85500E-06  2.10000E-06  2.60000E-06  3.30000E-06  4.00000E-06  9.87700E-06  1.59680E-05  2.77000E-05  4.80520E-05  7.55014E-05  1.48728E-04  3.67262E-04  9.06898E-04  1.42510E-03  2.23945E-03  3.51910E-03  5.50000E-03  9.11800E-03  1.50300E-02  2.47800E-02  4.08500E-02  6.74300E-02  1.11000E-01  1.83000E-01  3.02500E-01  5.00000E-01  8.21000E-01  1.35300E+00  2.23100E+00  3.67900E+00  6.06550E+00  2.00000E+01 ];

MACRO_NG                  (idx, 1)        = 2 ;
MACRO_E                   (idx, [1:   3]) = [  1.00000E+37  6.25000E-07  0.00000E+00 ];

% Micro-group spectrum:

INF_MICRO_FLX             (idx, [1: 140]) = [  9.17609E+04 0.00263  4.21498E+05 0.00093  9.59198E+05 0.00066  1.78377E+06 0.00030  1.97944E+06 0.00022  1.99497E+06 0.00020  1.59681E+06 0.00018  1.28900E+06 0.00024  1.64744E+06 0.00018  1.62091E+06 0.00018  1.71485E+06 0.00016  1.69514E+06 0.00016  1.80813E+06 0.00018  1.77168E+06 0.00016  1.78021E+06 0.00014  1.56429E+06 0.00017  1.57566E+06 0.00013  1.56828E+06 0.00015  1.56020E+06 0.00018  3.09289E+06 0.00014  3.04131E+06 0.00014  2.22732E+06 0.00015  1.44784E+06 0.00018  1.71597E+06 0.00020  1.63776E+06 0.00025  1.38685E+06 0.00025  2.41286E+06 0.00027  5.06000E+05 0.00048  6.33750E+05 0.00036  5.72587E+05 0.00044  3.38015E+05 0.00046  5.90749E+05 0.00047  4.05358E+05 0.00058  3.50270E+05 0.00068  6.73318E+04 0.00113  6.52567E+04 0.00091  6.48675E+04 0.00099  6.56833E+04 0.00113  6.59867E+04 0.00117  6.70911E+04 0.00115  7.11552E+04 0.00102  6.83496E+04 0.00101  1.31180E+05 0.00093  2.17200E+05 0.00069  2.93916E+05 0.00064  9.39204E+05 0.00057  1.43344E+06 0.00079  2.25328E+06 0.00094  1.83709E+06 0.00107  1.44808E+06 0.00119  1.14379E+06 0.00117  1.30992E+06 0.00129  2.33027E+06 0.00115  2.84339E+06 0.00120  4.69653E+06 0.00125  5.79013E+06 0.00128  6.70326E+06 0.00130  3.50400E+06 0.00135  2.22646E+06 0.00140  1.47326E+06 0.00132  1.24939E+06 0.00132  1.18560E+06 0.00143  9.11842E+05 0.00145  6.02757E+05 0.00152  5.11033E+05 0.00132  4.68473E+05 0.00156  3.88635E+05 0.00156  2.64566E+05 0.00173  1.74900E+05 0.00201  5.48824E+04 0.00297 ];

% Integral parameters:

INF_KINF                  (idx, [1:   2]) = [  9.65982E-01 0.00039 ];

% Flux spectra in infinite geometry:

INF_FLX                   (idx, [1:   4]) = [  5.01781E+21 0.00038  4.41697E+21 0.00135 ];
INF_FISS_FLX              (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reaction cross sections:

INF_TOT                   (idx, [1:   4]) = [  3.45124E-01 2.1E-05  3.94647E-01 8.2E-05 ];
INF_CAPT                  (idx, [1:   4]) = [  1.27160E-03 0.00062  1.34032E-03 0.00088 ];
INF_ABS                   (idx, [1:   4]) = [  1.48768E-03 0.00058  2.72526E-03 0.00108 ];
INF_FISS                  (idx, [1:   4]) = [  2.16081E-04 0.00060  1.38494E-03 0.00134 ];
INF_NSF                   (idx, [1:   4]) = [  5.45153E-04 0.00060  3.61768E-03 0.00134 ];
INF_NUBAR                 (idx, [1:   4]) = [  2.52291E+00 2.2E-05  2.61216E+00 1.7E-05 ];
INF_KAPPA                 (idx, [1:   4]) = [  2.03523E+02 3.8E-06  2.04765E+02 3.2E-06 ];
INF_INVV                  (idx, [1:   4]) = [  1.09036E-07 0.00019  2.08909E-06 7.7E-05 ];

% Total scattering cross sections:

INF_SCATT0                (idx, [1:   4]) = [  3.43636E-01 2.3E-05  3.91922E-01 8.4E-05 ];
INF_SCATT1                (idx, [1:   4]) = [  2.18932E-02 0.00030  1.13034E-02 0.00074 ];
INF_SCATT2                (idx, [1:   4]) = [  2.46682E-03 0.00256 -4.68044E-03 0.00135 ];
INF_SCATT3                (idx, [1:   4]) = [  4.68660E-04 0.01039 -4.25239E-03 0.00149 ];
INF_SCATT4                (idx, [1:   4]) = [ -1.85171E-04 0.02008 -4.96520E-03 0.00101 ];
INF_SCATT5                (idx, [1:   4]) = [  1.20763E-04 0.02740 -2.86718E-03 0.00130 ];
INF_SCATT6                (idx, [1:   4]) = [ -3.51948E-04 0.00894 -4.79338E-03 0.00091 ];
INF_SCATT7                (idx, [1:   4]) = [  1.50410E-04 0.01996 -6.40786E-04 0.00496 ];

% Total scattering production cross sections:

INF_SCATTP0               (idx, [1:   4]) = [  3.43663E-01 2.3E-05  3.91922E-01 8.4E-05 ];
INF_SCATTP1               (idx, [1:   4]) = [  2.19002E-02 0.00030  1.13034E-02 0.00074 ];
INF_SCATTP2               (idx, [1:   4]) = [  2.46807E-03 0.00256 -4.68044E-03 0.00135 ];
INF_SCATTP3               (idx, [1:   4]) = [  4.68884E-04 0.01039 -4.25239E-03 0.00149 ];
INF_SCATTP4               (idx, [1:   4]) = [ -1.85064E-04 0.02007 -4.96520E-03 0.00101 ];
INF_SCATTP5               (idx, [1:   4]) = [  1.20730E-04 0.02738 -2.86718E-03 0.00130 ];
INF_SCATTP6               (idx, [1:   4]) = [ -3.51965E-04 0.00897 -4.79338E-03 0.00091 ];
INF_SCATTP7               (idx, [1:   4]) = [  1.50371E-04 0.02000 -6.40786E-04 0.00496 ];

% Diffusion parameters:

INF_TRANSPXS              (idx, [1:   4]) = [  3.02756E-01 5.1E-05  3.81910E-01 9.4E-05 ];
INF_DIFFCOEF              (idx, [1:   4]) = [  1.10100E+00 5.1E-05  8.72807E-01 9.4E-05 ];

% Reduced absoption and removal:

INF_RABSXS                (idx, [1:   4]) = [  1.46116E-03 0.00060  2.72526E-03 0.00108 ];
INF_REMXS                 (idx, [1:   4]) = [  5.68756E-03 0.00024  4.71959E-03 0.00095 ];

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

INF_S0                    (idx, [1:   8]) = [  3.39437E-01 2.0E-05  4.19922E-03 0.00046  1.99416E-03 0.00086  3.89928E-01 8.5E-05 ];
INF_S1                    (idx, [1:   8]) = [  2.28079E-02 0.00028 -9.14710E-04 0.00093 -2.29281E-04 0.00243  1.15327E-02 0.00071 ];
INF_S2                    (idx, [1:   8]) = [  2.64112E-03 0.00233 -1.74301E-04 0.00389 -1.28954E-04 0.00332 -4.55149E-03 0.00140 ];
INF_S3                    (idx, [1:   8]) = [  5.16782E-04 0.00912 -4.81217E-05 0.00877 -4.60810E-05 0.00685 -4.20631E-03 0.00151 ];
INF_S4                    (idx, [1:   8]) = [ -1.47411E-04 0.02491 -3.77606E-05 0.00993 -2.97018E-05 0.00867 -4.93550E-03 0.00102 ];
INF_S5                    (idx, [1:   8]) = [  1.23426E-04 0.02736 -2.66334E-06 0.15393 -6.49171E-06 0.03544 -2.86069E-03 0.00132 ];
INF_S6                    (idx, [1:   8]) = [ -3.25850E-04 0.00954 -2.60982E-05 0.01092 -2.06451E-05 0.00984 -4.77273E-03 0.00091 ];
INF_S7                    (idx, [1:   8]) = [  1.27815E-04 0.02334  2.25954E-05 0.01387  9.55772E-06 0.02217 -6.50344E-04 0.00485 ];

% Scattering production matrixes:

INF_SP0                   (idx, [1:   8]) = [  3.39463E-01 2.0E-05  4.19922E-03 0.00046  1.99416E-03 0.00086  3.89928E-01 8.5E-05 ];
INF_SP1                   (idx, [1:   8]) = [  2.28149E-02 0.00028 -9.14710E-04 0.00093 -2.29281E-04 0.00243  1.15327E-02 0.00071 ];
INF_SP2                   (idx, [1:   8]) = [  2.64237E-03 0.00233 -1.74301E-04 0.00389 -1.28954E-04 0.00332 -4.55149E-03 0.00140 ];
INF_SP3                   (idx, [1:   8]) = [  5.17006E-04 0.00911 -4.81217E-05 0.00877 -4.60810E-05 0.00685 -4.20631E-03 0.00151 ];
INF_SP4                   (idx, [1:   8]) = [ -1.47303E-04 0.02490 -3.77606E-05 0.00993 -2.97018E-05 0.00867 -4.93550E-03 0.00102 ];
INF_SP5                   (idx, [1:   8]) = [  1.23393E-04 0.02734 -2.66334E-06 0.15393 -6.49171E-06 0.03544 -2.86069E-03 0.00132 ];
INF_SP6                   (idx, [1:   8]) = [ -3.25867E-04 0.00957 -2.60982E-05 0.01092 -2.06451E-05 0.00984 -4.77273E-03 0.00091 ];
INF_SP7                   (idx, [1:   8]) = [  1.27775E-04 0.02338  2.25954E-05 0.01387  9.55772E-06 0.02217 -6.50344E-04 0.00485 ];

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

CMM_TRANSPXS              (idx, [1:   4]) = [  3.01047E-01 0.00047  4.42327E-01 0.00117 ];
CMM_TRANSPXS_X            (idx, [1:   4]) = [  3.00922E-01 0.00072  4.35146E-01 0.00165 ];
CMM_TRANSPXS_Y            (idx, [1:   4]) = [  3.01270E-01 0.00054  4.35524E-01 0.00151 ];
CMM_TRANSPXS_Z            (idx, [1:   4]) = [  3.00954E-01 0.00058  4.57088E-01 0.00167 ];
CMM_DIFFCOEF              (idx, [1:   4]) = [  1.10726E+00 0.00047  7.53637E-01 0.00116 ];
CMM_DIFFCOEF_X            (idx, [1:   4]) = [  1.10773E+00 0.00072  7.66121E-01 0.00165 ];
CMM_DIFFCOEF_Y            (idx, [1:   4]) = [  1.10644E+00 0.00054  7.65442E-01 0.00151 ];
CMM_DIFFCOEF_Z            (idx, [1:   4]) = [  1.10761E+00 0.00058  7.29348E-01 0.00167 ];

% Delayed neutron parameters (Meulekamp method):

BETA_EFF                  (idx, [1:  14]) = [  5.17879E-03 0.00656  1.66878E-04 0.03598  9.87880E-04 0.01527  8.20967E-04 0.01685  2.27373E-03 0.01000  6.93856E-04 0.01821  2.35473E-04 0.02913 ];
LAMBDA                    (idx, [1:  14]) = [  6.95217E-01 0.01542  1.25632E-02 0.00072  3.12287E-02 0.00044  1.09760E-01 0.00037  3.16539E-01 0.00012  1.28409E+00 0.00253  7.98055E+00 0.00770 ];

