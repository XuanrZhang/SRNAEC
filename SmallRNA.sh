

	awk '{if(NR%2!=0)ORS=" ";else ORS="\n"}1' /home/xuanzhan/Data/smallRNA/simu/m_d${j}/simumD${j}.fa > /home/xuanzhan/Data/smallRNA/simu/m_d${j}/rawread_D${j}.txt

	echo "--------------start error correction ";

	./smallRNA_propor -k 10  -t 20 -f /home/xuanzhan/Data/smallRNA/simu/m_d${j}/rawread_D${j}.txt

	mv correct_read.fastq /home/xuanzhan/Data/smallRNA/simu/m_d${j}/
	mv changed_list.txt /home/xuanzhan/Data/smallRNA/simu/m_d${j}/

	echo "--------------start ${j} evaluation ";
	./evaluation -e /home/xuanzhan/Data/smallRNA/simu/m_d${j}/truth_D${j}.txt  -c /home/xuanzhan/Data/smallRNA/simu/m_d${j}/changed_list.txt


