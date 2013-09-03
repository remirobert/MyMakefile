##
## Makefile for Make in /home/moriss_h//afs/rendu/lib/my
##
## Made by hugues morisset
## Login <moriss_h@epitech.net>
##
## Started on Mon Oct 22 09:20:28 2012 hugues morisset
## Last update Tue Sep  3 20:17:48 2013 remi robert
##

# TO do List :
# mettre les obj dans une repertoir
# Permertre de configurer

CC		=	clang

RM		=	rm -f

NAME		=	xorusL
VERSION		=	1.0
AUEUR		=	robert_r
EMAIL		=	remi.robert@epitech.eu

COMPILEFLAG	=	-ggdb3 -Wall -Wextra

INCLUDE		=	-Iinclude/

DEBUG		=	debug

CFLAGS		=	$(COMPILEFLAG) $(INCLUDE)

SRCPATH		=	./
SRCBINARY	=	./
SRCOBJ		=	obj/

SRC		=	$(SRCPATH)main.c \
			$(SRCPATH)ok.c \

OBJ		=	$(patsubst %.c,${OBJDIR}%.o,$(SRC))

$(OBJDIR)%.o:		%.c
			@$(CC) $(CFLAGS) -o $@ -c $<
			@if test -s $*.c; then \
			echo "\033[01m\033[35m Compiling $(DEBUG)\033[00m\
			\033[36m$(SRCPATH)$*.c\033[032m  [OK]\033[00m";\
			else \
			echo "\033[01m\033[33m Compiling $(DEBUG)\033[00m\
			\033[36m$(SRCPATH)$*.c\033[00m\  [Error]"; fi

$(NAME):	 	$(OBJ)
			@echo "-----------------\n"
			@echo "\033[01m\033[31mLinking ...\033[00m"
			@$(CC) $(OBJ) -o $(NAME) $(CFLAGS)
			@echo "\n\033[01m\033[32mCompilation done => ${NAME}\033[00m"

all:			checkrepo print $(NAME)

clean:
			@$(RM) $(OBJ)
			@echo "\033[01m\033[31mRemoving objects ...\033[00m"

fclean:			clean
			@$(RM) $(NAME)
			@echo "\033[01m\033[31mRemoving binary : {${NAME}} ...\033[00m"

re:			fclean  all

checkrepo:
			@if test -d $(SRCOBJ); then echo "Check {SRCOBJ} ok ...";\
			else echo "Creating ${SRCOBJ} repertory ..."; mkdir $(SRCOBJ); fi
			@if test -d $(SRCBINARY); then echo "Check {SRCBINARY} ok ...";\
			else echo "Creating ${SRCBINARY} repertory ..."; mkdir $(SRCBINARY); fi

print:
			@echo "\n-----------------"

.PHONY:			checkrepo all test clean print

target:			checkrepo print
