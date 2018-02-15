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
        sed '1 d' $name_file | sed 's/./&\;/206;s/./&\;/172;s/./&\;/160;s/./&\;/156;s/./&\;/114;s/./&\;/101;s/./&\;/41;s/./&\;/26;s/./&,/1' | sed '/.*,.*,.*/!s/,/,,/' | sed $'s/\r$//' | sed '/^$/d' > tmp_file;
        mv tmp_file $name_file
done
