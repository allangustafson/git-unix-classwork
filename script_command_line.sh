rm -r chapter4
mkdir chapter4
sort names.txt > sorted_names.txt
cp sorted_names.txt chapter4
cd chapter4
cp sorted_names.txt sorted_names.backup
mv sorted_names.backup sorted_names.`date +"%m%d%y%H%M%S"`.txt
ls -l
echo finished
