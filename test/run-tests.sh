MORPH=../ru-kv.automorf.bin
DIS=../apertium-kv-ru.ru-kv.rlx
CONV=/home/fran/scripts/apertium-to-visl.py
TEMP=/tmp
LOG=history.log

PASSED="";
FAILED="";
TOTAL=0;
PCOUNT=0;
FCOUNT=0;
for i in [0-9][0-9][0-9][0-9].txt; do
	TOTAL=`expr $TOTAL + 1`;

	cat $i | lt-proc -w $MORPH | python $CONV | vislcg3 --grammar $DIS > $TEMP"/"$i".tst" 2>/dev/null; 
	diff -Naur `echo $i | sed 's/.txt/.dis.txt/g'` $TEMP"/"$i".tst" > $TEMP"/"$i".diff";
	
	DIFFLINES=`cat $TEMP"/"$i".diff" | wc -l`;

	if [[ $DIFFLINES != 0 ]]; then
		FCOUNT=`expr $FCOUNT + 1`;
		FAILED=$FAILED" "$i;
	else 
		rm $TEMP"/"$i".diff";
		PCOUNT=`expr $PCOUNT + 1`;
		PASSED=$PASSED" "$i;
	fi
done

FAILEDP=`calc $FCOUNT / $TOTAL \* 100 | sed 's/^\W*//g'`;
PERCENT=`calc 100.0 - $FAILEDP | sed 's/^\W*//g'`; 
DATE=`date`;
echo "--" >> $LOG;
echo $DATE": "$PERCENT"%" >> $LOG
echo $PCOUNT"/"$TOTAL" PASSED: "$PASSED >> $LOG;
echo $FCOUNT"/"$TOTAL" FAILED: "$FAILED >> $LOG; 

cat $LOG | tail -4
