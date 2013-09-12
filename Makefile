##
## Makefile for Makefile in /home/remi/Projet/MyMakefile
## 
## Made by remi
## Login   <remi@epitech.net>
## 
## Started on  Thu Sep 12 17:01:12 2013 remi
## Last update Thu Sep 12 17:01:26 2013 remi
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

DEBUG		=	with debug

CFLAGS		=	$(COMPILEFLAG) $(INCLUDE)

SRCPATH		=	./
SRCBINARY	=	./
SRCOBJ		=	obj/

SRC		=	$(SRCPATH)main.c \

OBJ		=	$(patsubst %.c,${OBJDIR}%.o,$(SRC))

$(OBJDIR)%.o:		%.c
			@$(CC) $(CFLAGS) -o $@ -c $<
			@if test -s $*.c; then \
			echo "\033[01m\033[35m Compiling $(DEBUG)\033[00m\
			\033[36m$(SRCPATH)$*.c\033[032m  [OK]\033[00m";\
			else \
			echo "\033[01m\033[33m Compiling $(DEBUG)\033[00m\
			\033[36m$(SRCPATH)$*.c\033[00m\  [Error]"; fi

$(NAME):	  	$(OBJ)
			@echo "\033[01m\033[31mLinking ...\033[00m"
			@$(CC) $(OBJ) -o $(NAME) $(CFLAGS)
			@echo "\033[01m\033[32mCompilation done => ${NAME}\033[00m"

all:			$(NAME)

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

.PHONY:			checkrepo all test clean print

target:			checkrepo print
