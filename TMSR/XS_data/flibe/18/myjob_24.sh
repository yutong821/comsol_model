#!/bin/bash
# Job name:
#SBATCH --job-name=TMSR-SF
#
# Partition:
#SBATCH --partition=savio
#
# QoS:
#SBATCH --qos=nuclear_normal
# #SBATCH --qos=savio_normal
# #SBATCH --qos=savio_debug
#
# Account:
#SBATCH --account=co_nuclear
# #SBATCH --account=fc_neutronics
#
# Processors:
#SBATCH --nodes=1
#
#SBATCH --ntasks-per-node=20
#
#SBATCH --mem=60G
# Wall clock limit:
#SBATCH --time=272:00:00
#
# SLURM Output File
##SBATCH --output=/dev/null
##SBATCH --output=slurm.out
#
# SLURM Error File
#SBATCH --error=slurm.err
#
# Mail type:
##SBATCH --mail-type=all
#
# Mail user:
##SBATCH --mail-user=manuele.aufiero@berkeley.edu
module load intel/2015.0.090
module load openmpi/1.8.3-intel
/global/home/users/maufiero/serpent_version/serpent2.1.24/serpent2.1.24-icc15.0.0/sss2 -omp 20 tmsr_sf1
