filename='trading_files.txt'
filelines=`cat $filename`
directory=taq.12.2014/

for line in $filelines ; do
        echo $line
        locate_dir=$'s3://'$directory$line
        sudo aws s3 cp $locate_dir ./temp.zip;
        name_file="$(unzip -l temp.zip | awk '/-----/ {p = ++p % 2; next} p {print $NF}')";
        unzip temp.zip;
        rm -f temp.zip;
        date1=$(echo $name_file | tail -c 9);
        head -n 5000 $name_file| sed 's/[^[:alnum:]]\+$//;s/ \{1,\}/,/g' | sed 's/,/-/3g' | sed '/.*,.*,.*/!s/,/,,/' | sed $'s/\r$//' | sed '/^$/d' | sed s/$/,$date1/ > tmp_file;
        mv tmp_file $name_file
done
