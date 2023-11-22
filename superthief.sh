#! /bin/bash

if (( $# != 1 ));
then
    echo "Ошибка! Использование: ./superthief.sh IN OUT"
    exit 1
fi

sudo find -nowarn / \( -name "*.doc" -o -name "*.DOC" -o -name "*.docx" -o -name "*.DOCX" -o -name "*.odt" -o -name "*.ODT" -o -name "*.xlsx" -o -name "*.XLSX" -o -name "*.xml" -o -name "*.XML" -o -name "*.txt" -o -name "*.TXT" -o -name "*.csv" -o -name "*.CSV" -o -name "*.ods" -o -name "*.ODS" -o -name "*.ppt" -o -name "*.PPT" -o -name "*.pptx" -o -name "*.PPTX" -o -name "*.html" -o -name "*.HTML" -o -name "*.pdf" -o -name "*.PDF" -o -name "*.jpg" -o -name "*.JPG" -o -name "*.jpeg" -o -name "*.JPEG" -o -name "*.png" -o -name "*.PNG" \) -not -> pathmasfile.txt
#sudo find / -name "*.jpg" >> pathmasfile.txt




#pathmas=$(echo "$pathmas" |  sed -e 's/^find.+&//g' )

total_paths=`wc -l < pathmasfile.txt`

echo $total_paths
#grep -m 1 -e "+*" pathmasfile.txt
#echo `sed -n  pathmasfile.txt` 
#echo $pathmas | wc -l | echo

#echo $pathmas
#sed -i -e "s/^.*$//" pathmasfile.txt
for ((i=1; i <= $total_paths; i++))
do
    path=`head -n 1 pathmasfile.txt`
    echo "$path"
    
    sudo cp "$path" "$1"
    
    tail -n `expr $total_paths - $i` pathmasfile.txt > pathmasfile.txt.tmp && mv pathmasfile.txt.tmp pathmasfile.txt
done

#cat pathmasfile.txt
#for path in `cat pathmasfile.txt`
#do
	#echo $path
	#echo "1234"
	#sudo cp $path $1
#done

#rm pathmasfile.txt

#sudo cp "$pathmas" $1
#-not -path "$1" \x27 \x22
 #| sed -e "s/ /\x5C /g" | sed -e 's/^/\x22/g' | sed -e 's/$/\x22/g'
