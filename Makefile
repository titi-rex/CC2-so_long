# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tlegrand <tlegrand@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/19 14:03:05 by tlegrand          #+#    #+#              #
#    Updated: 2023/02/13 13:20:48 by tlegrand         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


#	/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\	PROJECT VARIABLES	/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\	#

#	==============================	NAMES	==============================	#
NAME		=	so_long


#	==============================	SOURCES	==============================	#
DIR_SRCS	=	srcs/
LST_SRCS	=	main.c map_get.c map_check.c map_init.c utils.c
SRCS		=	${addprefix ${DIR_SRCS}, ${LST_SRCS}}


#	==============================	OBJECTS	==============================	#
DIR_OBJS	=	.objs/
OBJS		=	${patsubst ${DIR_SRCS}%.c, ${DIR_OBJS}%.o, ${SRCS}}


#	==============================	HEADERS	==============================	#
DIR_HEADER	=	include/
HEADER		=	${addprefix ${DIR_HEADER}, ${NAME}.h}


#	==============================	LIBRARY	==============================	#
DIR_LIBFT	=	libft/
LIBFT		=	$(addprefix $(DIR_LIBFT), libft.a)
DIR_LIBMLX	=	minilibx-linux/
LIBMLX		=	$(addprefix $(DIR_LIBMLX), libmlx.a)


#	==============================	COMMANDS	==============================	#
CC 			=	cc
MKDIR 		=	mkdir -p
RM			=	rm -rf
MAKE		=	make -s


#	==============================	FLAGS	==============================	#
CFLAGS		=	-Wall -Wextra -Werror -I${DIR_HEADER}
FTFLAGS		=	-L${DIR_LIBFT} -lft 
MLXFLAGS	=	-L${DIR_LIBMLX} -lmlx -lXext -lX11 -lm -lz 



#	/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\	RULES	/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\	#
.PHONY : all clean fclean re bonus FORCE nn

#	==============================	BASIC	==============================	#
all		:	${NAME}

clean	:
		@${RM} ${DIR_OBJS}
		@${MAKE} -C ${DIR_LIBFT} clean
		
fclean	:	clean
		@${RM} ${NAME}
		@${MAKE} -C ${DIR_LIBFT}  fclean
		@${MAKE} -C ${DIR_LIBMLX} clean
		@printf "$(GREEN)All clean !\n$(END)"

re		:	fclean
		@${MAKE} all


#	==============================	COMPILATION	==============================	#
${NAME}			:	${LIBFT} ${LIBMLX} ${DIR_OBJS} ${OBJS}
				@${CC} ${CFLAGS} ${OBJS} ${FTFLAGS} ${MLXFLAGS} -o ${NAME}
				@printf "$(GREEN_LIGHT)${NAME} created !\n$(END)"

${DIR_OBJS}%.o	:	${DIR_SRCS}%.c ${HEADER}
				@printf "$(ORANGE)Making $@...\n$(END)"
				@${CC} ${CFLAGS} -c $< -o $@


#	==============================	UTILS/LIB	==============================	#
${DIR_OBJS}	:
			@${MKDIR} ${DIR_OBJS}

nn			:
			@norminette ${SRCS} ${SRCS_B} ${HEADER}

${LIBFT}	:	FORCE
			@$(MAKE) -C ${DIR_LIBFT}

${LIBMLX}	:	FORCE
			@$(MAKE) -C ${DIR_LIBMLX}
			@printf "$(GREEN_LIGHT)${LIBMLX} created !\n$(END)"

FORCE		:



#	/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\	OPERATING VARIABLES	/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\	#

#	==============================	COLORS	==============================	#
BLACK		=	\033[0;30m
RED			=	\033[0;31m
GREEN		=	\033[0;32m
ORANGE		=	\033[0;33m
BLUE		=	\033[0;34m
PURPLE		=	\033[0;35m
CYAN		=	\033[0;36m
GRAY_LIGHT	=	\033[0;37m
GRAY_DARK	=	\033[1;30m
RED_LIGHT	=	\033[1;31m
GREEN_LIGHT	=	\033[1;32m
YELLOW 		=	\033[1;33m
BLUE_LIGHT	=	\033[1;34m
VIOLET		=	\033[1;35m
CYAN		=	\033[1;36m
WHITE		=	\033[1;37m
