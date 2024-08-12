# LDSC_Assignment3
LD Score Assignment [calculating Genetic Correlation and heretability]
####################################################
####################################################
####### Copy files and setup WD

#login to ilifu and go to your home

cd ~

#copy files from Mary's WD to yours

cp /users/mmufford/LDSC_tut.tar.gz ./

#decompress the files

tar -xvzf LDSC_tut.tar.gz

#####ldsc

cd ~/LDSC_tut
# download summary statistics 
wget https://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/GCST011001-GCST012000/GCST011365/GCST011365_buildGRCh37.tsv

wget http://csg.sph.umich.edu/abecasis/public/lipids2013/jointGwasMc_LDL.txt.gz


## decompress zipped file

$ gunzip jointGwasMc_LDL.txt.gz

# download and install ldsc

git clone https://github.com/bulik/ldsc.git

cd ldsc

sinteractive #start an interactive session

# create the ldsc environment

module load anaconda3/login

conda env create --file environment.yml

source activate ldsc #load and activate the environment

### test if it works

./ldsc.py -h

./munge_sumstats.py -h

# prepare the summary statistics

cd ~/LDSC_tut

#prepare the summary statistics
sbatch format_sumstats_ldsr.sh

# Check running jobs
squeue -u "username"


# run the genetic heritability calculation
 sbatch h2_LDL_MI.sh
#lets look at the output

less h2_LDL_MI.log
# run the genetic correlation

sbatch LDSC_LDL_MI.sh

#lets look at the output

less LDL_MI_rg.log


