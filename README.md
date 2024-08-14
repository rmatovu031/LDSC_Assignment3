# LDSC_Assignment3
LD Score Assignment [calculating Genetic Correlation and heretability]

####################################################

####################################################

# login to ilifu and go to your home
ssh username@*****.ac.za

cd ~

#navigate to the LDSC_tut directory 
cd ~/LDSC_tut

# download summary statistics 
wget https://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/GCST011001-GCST012000/GCST011365/GCST011365_buildGRCh37.tsv
wget http://csg.sph.umich.edu/abecasis/public/lipids2013/jointGwasMc_LDL.txt.gz

## decompress zipped file
gunzip jointGwasMc_LDL.txt.gz

# download and install ldsc
git clone https://github.com/bulik/ldsc.git


cd ldsc

#start an interactive session
sinteractive 

# create the ldsc environment
module load anaconda3/login

conda env create --file environment.yml

source activate ldsc #load and activate the environment

### test if it works
./ldsc.py -h

./munge_sumstats.py -h

# prepare the summary statistics
cd ~/LDSC_tut

sbatch format_sumstats_ldsr.sh

# Check running jobs
squeue -u "username"

# run the genetic correlation
sbatch LDSC_LDL_MI.sh

#lets look at the output
less LDL_MI_rg.log

# run the genetic heritability calculation
sbatch h2_LDL_MI.sh

#lets look at the output

less LDL_h2.log

less MI_h2.log

#############################################

#############################################
# Acknowledgement
Thanks to Dr. Mary Mufford for initially generating the scripts on which this work was customised.
