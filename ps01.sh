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
        sed '1 d' $name_file | head -n 5000 | sed 's/[^[:alnum:]]\+$//;s/ \{1,\}/,/g' | sed 's/,/-/3g' | sed '1i A,B,C,D' | sed '/.*,.*,.*/!s/,/,,/' | sed $'s/\r$//' | sed '/^$/d' | sed -e '2,$s/$/,'$date1'/' > tmp_file;
        mv tmp_file $name_file
done
