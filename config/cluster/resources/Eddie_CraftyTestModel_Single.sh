#!/bin/bash

# Job Name:
#$ -N CRAFTY_%SCENARIO%_%RANDOM_SEED_OFFSET%

# Execute the job from the current working directory
#$ -cwd

# run a job on one of the new Mark2 Westmere nodes
# #$ -q ecdf@@westmere_ge_hosts

# Requested total running time (?) (HH:MM:SS):
#$ -l h_rt=04:00:00

# Number of nodes and cores per node
# #$ -l nodes=1:ppn=1

# RAM
##$ -l mem=2gb


# Name of output files:
#$ -o ./output/%SCENARIO%/CRAFTY_%SCENARIO%_%RANDOM_SEED_OFFSET%.out
#$ -e ./output/%SCENARIO%/CRAFTY_%SCENARIO%_%RANDOM_SEED_OFFSET%.err

# Send mail when job is aborted or terminates
#$ -m ae

#$ -M TEMPLATE@TEMPLATE

echo "####################################################"
echo "Job started on " `hostname` `date`
echo "Current working directory:" `pwd`
echo "####################################################"

. /etc/profile.d/modules.sh
module load java

# Start des Jobs:
java -classpath ./config/log/ -Xmx1500m -Dlog4j.configuration=./config/log/log4j_cluster.properties -jar CRAFTY-TEMPLATE.jar -f "%SCENARIO_FILE%" -d "%DATA_FOLDER%" -s %START_TICK% -e %END_TICK% -r %NUM_RUNS% -o %RANDOM_SEED_OFFSET%

echo "##########################################################"
echo "Job finished: " `date`
exit 0
