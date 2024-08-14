#!/bin/bash

#SBATCH --job-name='Gen_corr'
#SBATCH --cpus-per-task=2
#SBATCH --mem=16GB
#SBATCH --output=testjob-%j-stdout.log
#SBATCH --error=testjob-%j-stderr.log
#SBATCH --time=02:00:00


echo "Submitting Slurm job"

set -o errexit

#module init
module load anaconda3/login

source activate ldsc

HOME=/users/rmatovu
LDDIR=${HOME}/LDSC_tut/ldsc
WD=${HOME}/LDSC_tut
INPUT=/${WD}/sumstats/Formatted

#compute genetic correlation

python2 ${LDDIR}/ldsc.py \
--rg ${INPUT}/LDL.sumstats.gz,${INPUT}/MI.sumstats.gz \
--ref-ld-chr ${WD}/eur_w_ld_chr/ \
--w-ld-chr ${WD}/eur_w_ld_chr/ \
--out ${WD}/LDL_MI_rg
