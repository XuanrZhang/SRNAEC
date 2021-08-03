#!/bin/bash

#output:
#change_list
#correct_read.fastq

H=5;
T=8;
O=correct_read.fasta;

while getopts f:o:h:t: op
do 
    case $op in
        f)
            echo "Input file name is: $OPTARG"
            F=$OPTARG;;
        o)
            echo "Output file name is: $OPTARG"
            O=$OPTARG;;
        h)
            echo "Threshod value is: $OPTARG"
            H=$OPTARG;;
        t)
            echo "The number of threads is: $OPTARG"
            T=$OPTARG;;
        \?)
            echo "Usage: args [-h][-t][-f][-o] "
            echo "-f means Input file name "
            echo "-o means Output file name "
            echo "-h means Threshod value"
            echo "-t means the number of threads(Default:8)"
            exit 1;;
    esac
done

awk '{if(NR%2!=0)ORS=" ";else ORS="\n"}1' ${F} > ./rawread.txt

echo "--------------start error correction ";

./smallRNA_propor -k ${H}  -t ${T} -f ./rawread.txt -o ./${O}


if [ "${O}" != "correct_read.fasta" ]
then 
	cp correct_read.fastq ${O};
	rm correct_read.fasta
fi

# echo "--------------start  evaluation ";
# ./evaluation -e /home/xuanzhan/Data/smallRNA/simu/m_d${j}/truth_D${j}.txt  -c /home/xuanzhan/Data/smallRNA/simu/m_d${j}/changed_list.txt
