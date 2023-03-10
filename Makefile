# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tlegrand <tlegrand@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/19 14:03:05 by tlegrand          #+#    #+#              #
#    Updated: 2023/03/06 14:24:18 by tlegrand         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


#	/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\	PROJECT VARIABLES	/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\	#

#	==============================	NAMES	==============================	#
NAME		=	so_long
NAME_B		=	so_long_bonus


#	==============================	SOURCES	==============================	#
DIR_SRCS	=	srcs/
LST_SRCS	=	main.c map_get.c map_check.c map_init.c map_utils.c \
				ft_init.c ft_init_sprites.c ft_destroy.c \
				ft_clean.c \
				ft_hook.c ft_move.c\
				ft_display.c 
SRCS		=	${addprefix ${DIR_SRCS}, ${LST_SRCS}}

LST_SRCS_B	=	main_bonus.c map_get.c map_check.c map_init.c map_utils.c \
				ft_init_bonus.c ft_init_sprites_bonus.c ft_init_sprites_player_bonus.c ft_destroy_bonus.c \
				ft_clean.c ft_img_draw.c ft_random.c \
				ft_hook_bonus.c ft_move_bonus.c ft_enemy_bonus.c \
				ft_display_bonus.c ft_animate_bonus.c \
				ft_endgame_bonus.c
SRCS_B		=	${addprefix ${DIR_SRCS}, ${LST_SRCS_B}}


#	==============================	OBJECTS	==============================	#
DIR_OBJS	=	.objs/
OBJS		=	${patsubst ${DIR_SRCS}%.c, ${DIR_OBJS}%.o, ${SRCS}}
OBJS_B		=	${patsubst ${DIR_SRCS}%.c, ${DIR_OBJS}%.o, ${SRCS_B}}


#	==============================	HEADERS	==============================	#
DIR_HEADER	=	include/
LST_HEADER	=	${NAME}.h ${NAME_B}.h 
HEADER		=	${addprefix ${DIR_HEADER}, ${LST_HEADER}}


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

bonus	:	${NAME_B}

clean	:
		@${RM} ${DIR_OBJS}
		@${MAKE} -C ${DIR_LIBFT} clean
		
fclean	:	clean
		@${RM} ${NAME}
		@${RM} ${NAME_B}
		@${MAKE} -C ${DIR_LIBFT} fclean
		@${MAKE} -C ${DIR_LIBMLX} clean
		@printf "$(GREEN)All clean !\n$(END)"

re		:	fclean
		@${MAKE} all


#	==============================	COMPILATION	==============================	#
${NAME}			:	${LIBFT} ${LIBMLX} ${DIR_OBJS} ${OBJS}
				@${CC} ${CFLAGS} ${OBJS} ${FTFLAGS} ${MLXFLAGS} -o $@
				@printf "$(GREEN_LIGHT)$@ created !\n$(END)"

${NAME_B}		:	${LIBFT} ${LIBMLX} ${DIR_OBJS} ${OBJS_B}
				@${CC} ${CFLAGS} ${OBJS_B} ${FTFLAGS} ${MLXFLAGS} -o $@
				@printf "$(GREEN_LIGHT)$@ created !\n$(END)"

${DIR_OBJS}%.o	:	${DIR_SRCS}%.c ${HEADER}
				@printf "$(ORANGE)Making $@...\n$(END)"
				@${CC} ${CFLAGS} -c $< -o $@


#	==============================	UTILS/LIB	==============================	#
${DIR_OBJS}	:
			@${MKDIR} ${DIR_OBJS}

nn			:
			@norminette $(sort ${SRCS} ${SRCS_B} ${HEADER} ${HEADER_B})

${LIBFT}	:	FORCE
			@$(MAKE) -C ${DIR_LIBFT}

${LIBMLX}	:	FORCE
			@$(MAKE) -C ${DIR_LIBMLX}

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
END			=	\033[0m
UNDERLINE	=	\033[4m
REV			=	\033[7m
ERASE		=	\033[2K
RERASE		=	\r\033[2K
