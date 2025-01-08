#!/bin/bash

read -p "Введите шаблон имени файла (например, *.txt): " filename_pattern

read -p "Введите начальный каталог поиска: " search_directory

read -p "Введите тип файла (f - файл, d - каталог): " file_type

read -p "Введите число дней после изменения файла (например, 7): " days

echo "Выполняется поиск файлов..."

if [ "$file_type" == "f" ]; then
    find "$search_directory" -type f -name "$filename_pattern" -mtime -"$days"
elif [ "$file_type" == "d" ]; then
    find "$search_directory" -type d -name "$filename_pattern" -mtime -"$days"
else
    echo "err"
fi
