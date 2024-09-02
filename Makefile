##
## EPITECH PROJECT, 2024
## asmprintf
## File description:
## make
##

NAME	=	libasmprintf.a

SRC		=	printf.asm	\
        	putstr.asm	\
        	putnbr.asm	\
			putchar.asm	\

OBJ		=	$(SRC:.asm=.o)

ASM		=	nasm

ASMFLAGS	=	-f elf64

RM		=	rm -f

all: $(OBJ)
	ar rc $(NAME) $(OBJ)
	ranlib $(NAME)

%.o: %.asm
	$(ASM) $(ASMFLAGS) $< -o $@

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re: fclean all

run: re
	gcc main.c -L. -lasmprintf -o run
	./run
	make fclean
	rm run
