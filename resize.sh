#!/bin/bash

if [ -n "$1" ] 
then
	if [ -e $1 ]
	then
		while IFS= read -r line
		do
		echo "$line - Читаем строку файла"
			
		if [ -e $line ]
		then
		echo "$line - найден в текущем каталоге"
			if [[ "$line" == *".jpg"* ]]; then
				echo  "$line - Файл имеет расширение JPG. Производим его обрезку"
				t=${line::-4}
				convert $line[360x] $t-thumbnail.jpg
			fi
		fi	
		done < $1
	else 
		echo "параметр $1 задан некорректно, файл не существует "
	fi
else
	file_name=$(find -name '*.jpg')
	for var in $file_name 
	do
		if [[ "$var" != *"thumbnail"* ]]; then
				echo  "$var - Файл имеет расширение JPG. И не содержит thumbnail. Производим его обрезку"
				t=${var::-4}
				convert $var[360x] $t-thumbnail.jpg
		fi
	done
fi


