#!/bin/bash

#SBATCH --job-name='FormatSumStats'
#SBATCH --cpus-per-task=3
#SBATCH --mem=16GB
#SBATCH --output=testjob-%j-stdout.log
#SBATCH --error=testjob-%j-stderr.log
#SBATCH --time=02:00:00

echo "Submitting Slurm job"

set -o errexit

#module init
module load anaconda3/login

source activate ldsc

HOME=/users/rmatovu/LDSC_tut
LDDIR=${HOME}/ldsc
WD=${HOME}/sumstats

echo "Submitting Slurm job"


python2 ${LDDIR}/munge_sumstats.py \
--sumstats ${WD}/jointGwasMc_LDL.txt \
--N 188577 \
--chunksize 500000 \
--out ${WD}/Formatted/LDL \
--merge-alleles ${HOME}/eur_w_ld_chr/w_hm3.snplist


python2 ${LDDIR}/munge_sumstats.py \
--sumstats ${WD}/GCST011365_buildGRCh37.tsv \
--merge-alleles ${HOME}/eur_w_ld_chr/w_hm3.snplist \
--N 831000 \
--snp variant_id \
--chunksize 500000 \
--out ${WD}/Formatted/MI

echo "Completed Slurm job"
