#!/bin/bash
prep=0
assemble=0
polish=0
metrics=0
norun=0
threads=20
rule=""
runcluster=0
unlock=""
file=""
clusterconfig="config/cluster-config.yaml"
clustercommand="sbatch --job-name={cluster.job-name} --time={cluster.time} --ntasks-per-node={cluster.ntasks-per-node} --nodes={cluster.nodes} --mem={cluster.mem} --output={cluster.output} --error={cluster.error} --parsable"
WORKDIR=$(pwd)

programname=$0

function usage {
	echo "usage: $programname [prep|assemble|polish|metrics] [-r rule_to_run] [-j threads] [-c] [-n] [-h]"
    echo "	prep|assemble|polish|metrics	Mode to run in. Default = all."
	echo "	-r | --rule			Snakemake rule to run. Default = all."
        echo "	-f | --file			File to create. Default = none."
	echo "	-j | --threads			Number of threads to give to Snakemake. Default = 20."
	echo "	-c | --runcluster		Make rules run as batch jobs to slurm."
	echo "	-n | --norun			Dry run only - only outputs planned execution."
	echo "	-h | --help 			Display this help and exit."
	exit 1
}

case $1 in
	prep )		prep=1
			echo "Pyro running in Data Prep Mode."
			rule="prep"
			shift
			;;
	assemble ) 	assemble=1
			echo "Pyro running in Assembly Mode."
			rule="assemble"
			shift
			;;
	polish )	polish=1
			echo "Pyro running in Polishing Mode."
			rule="polish"
			shift
			;;
	metrics ) 	metrics=1
			echo "Pyro running in Metrics Mode."
			rule="metrics"
			shift
esac
			


while [ "$1" != "" ]; do
	case $1 in
		-r | --rule ) 		shift
					rule=$1
					echo "Rule set as $1."
					;;
		-f | --file )		shift
					file=$1
					echo "Target file set as $1."
					;;
		-j | --threads ) 	shift
					threads=$1
					echo "Threads set as $1."
					;;
		-c | --runcluster ) 	runcluster=1
					echo "Jobs will be submitted for cluster execution."
					;;
		-n | --norun ) 		norun=1
					echo "Dry run only."
					;;
		-u | --unlock )		unlock="--unlock"
					echo "Unlocking directory."
					;;
		-h | --help ) 		usage
					exit 1
					;;
		* ) 			echo "Incorrect input. See --help."
					exit 1
	esac
	shift
done

if [ "$file" = "" ]; then
	if [ "$norun" = "1" ]; then
		if [ "$runcluster" = "1" ]; then
			snakemake -j $threads -npr --quiet --cluster-config $clusterconfig --cluster "$clustercommand" --cluster-status scripts/slurm-status.py --jobs 100 --use-singularity --singularity-args "--bind $WORKDIR:/mnt" $rule $unlock
		else
			snakemake -j $threads -npr --quiet --use-singularity --singularity-args "--bind $WORKDIR:/mnt" $rule $unlock
		fi
	else 
		if [ "$runcluster" = "1" ]; then
			snakemake -j $threads -p --cluster-config $clusterconfig --cluster "$clustercommand" --cluster-status scripts/slurm-status.py --jobs 100 --use-singularity --singularity-args "--bind $WORKDIR:/mnt" $rule $unlock
		else
			snakemake -j $threads -p --use-singularity --singularity-args "--bind $WORKDIR:/mnt" $rule $unlock
		fi
	fi
else
	if [ "$norun" = "1" ]; then
                if [ "$runcluster" = "1" ]; then
                        snakemake -j $threads -npr --quiet --cluster-config $clusterconfig --cluster "$clustercommand" --cluster-status scripts/slurm-status.py --jobs 100 --use-singularity --singularity-args "--bind $WORKDIR:/mnt" $file $unlock
                else
                        snakemake -j $threads -npr --quiet --use-singularity --singularity-args "--bind $WORKDIR:/mnt" $file $unlock
                fi
        else
                if [ "$runcluster" = "1" ]; then
                        snakemake -j $threads -p --cluster-config $clusterconfig --cluster "$clustercommand" --cluster-status scripts/slurm-status.py --jobs 100 --use-singularity --singularity-args "--bind $WORKDIR:/mnt" $file $unlock
                else
                        snakemake -j $threads -p --use-singularity --singularity-args "--bind $WORKDIR:/mnt" $file $unlock
                fi
        fi
fi
