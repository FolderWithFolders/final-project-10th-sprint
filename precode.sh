cat > task.sh << 'EOF'
#!/bin/bash

# создаём каталог task с вложенными директориями
mkdir -p task/dir1 task/dir2 task/dir3/dir4

# изменяем текущую директорию на task
cd task

# создаём пустой файл task/dir2/empty
touch dir2/empty

# создаём файл task/dir2/hello.sh
echo '#!/bin/bash
echo "$1, привет!"' > dir2/hello.sh

# устанавливаем права для hello.sh
chmod 764 dir2/hello.sh

# сохраняем список файлов dir2
ls dir2 > dir2/list.txt

# копируем содержимое dir2 в dir3/dir4
cp -r dir2/* dir3/dir4/

# записываем список txt-файлов
find . -name "*.txt" > dir1/summary.txt

# дописываем содержимое list.txt
cat dir2/list.txt >> dir1/summary.txt

# задаём переменную окружения
NAME="Всем студентам"

# запускаем скрипт с аргументом
./dir2/hello.sh "$NAME" >> dir1/summary.txt

# перемещаем и переименовываем файл
mv dir1/summary.txt "Практическое задание"

# выводим содержимое файла
cat "Практическое задание"

# ищем строки с "dir" и сортируем
grep "dir" "Практическое задание" | sort

# возвращаемся в родительскую директорию
cd ..

# удаляем директорию task
rm -r task
EOF