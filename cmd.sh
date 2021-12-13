#!/bin/bash

if [ ! $1 ]; then
	echo "usage:"
	echo "./cmd.sh <option> <BUFFER_SIZE> <text file>"
	echo "for example:"
	echo "./cmd.sh m 42 text.txt"
	echo "./cmd.sh b 42 text1.txt text2.txt"
	echo "./cmd.sh d 42 text.txt"
	echo "./cmd.sh 0 42"
	echo "./cmd.sh lm 42 text.txt"
	echo "./cmd.sh lb 42 text.txt"
	exit 1
elif [ $1 = "m" ]; then # mandatory
	gcc -Wall -Wextra -Werror ../get_next_line.c \
		../get_next_line_utils.c \
		mandatory_main.c -D BUFFER_SIZE="$2"
	echo $3
	cat $3
	echo -e "\n---------------------------------------"
	echo "./a.out $3"
	./a.out $3 && rm a.out
elif [ $1 = "b" ]; then # bonus
	gcc -Wall -Wextra -Werror ../get_next_line_bonus.c \
	../get_next_line_utils_bonus.c \
		bonus_main.c -D BUFFER_SIZE="$2"
	./a.out $3 $4 && rm a.out
elif [ $1 = "d" ]; then # diff mandatory
	gcc -Wall -Wextra -Werror ../get_next_line.c \
		../get_next_line_utils.c \
		mandatory_main.c -D BUFFER_SIZE="$2"
	./a.out $3 > output.txt && rm a.out
	diff $3 output.txt && rm output.txt
	if [ $? = 0 ]; then
		echo "perfect!!"
	fi
elif [ $1 = "0" ]; then # stdin
	gcc -Wall -Wextra -Werror ../get_next_line.c \
		../get_next_line_utils.c \
		stdin_main.c -D BUFFER_SIZE="$2"
	./a.out
elif [ $1 = "lm" ]; then # leak check mandatory
	gcc -g -Wall -Wextra -Werror ../get_next_line.c \
		../get_next_line_utils.c \
		mandatory_main.c -D BUFFER_SIZE="$2"
	valgrind --leak-check=full ./a.out $3 && rm a.out && rm -r a.out.dSYM
elif [ $1 = "lb" ]; then # leak check bonus 同じ
	gcc -g -Wall -Wextra -Werror ../get_next_line_bonus.c \
	../get_next_line_utils_bonus.c \
		bonus_main.c -D BUFFER_SIZE="$2"
	valgrind --leak-check=full ./a.out $3 $4 && rm a.out && rm -r a.out.dSYM
fi
