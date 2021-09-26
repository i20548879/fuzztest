export CRASHES=~/SwitchFuzz/scripts/fuzz/cxxfilt-CVE-2016-4491/obj-dist/out_2/crashes/
export PROGRAM=~/SwitchFuzz/scripts/fuzz/cxxfilt-CVE-2016-4491/obj-dist/binutils/cxxfilt
export OUT=~/output/2016-4491/sf2

for file in $(ls $CRASHES)
do
    if [ "$file" != "README.txt" ]
    then 
        echo "$file" >> $OUT 
        echo -e "set confirm off\nset height unlimited\nset logging file $OUT\nset logging on\nfile $PROGRAM\nrun <$CRASHES$file\nquit" > gdbtest.gdb
        gdb -x 	gdbtest.gdb
    fi
done
