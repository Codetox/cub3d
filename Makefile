# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: alidy <alidy@student.le-101.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/10/10 09:32:01 by alidy             #+#    #+#              #
#    Updated: 2020/02/28 15:45:56 by alidy            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #


HEADER			=		include/cub3d.h

LIBS			=		libft/libftprintf.a

SRC_PATH		=		srcs

SRCS_NAME		=		cube.c							\
						cube_utils.c 					\
						cube_bmp.c 						\
						cube_free.c 					\
						parsing/parsing.c 				\
						parsing/parsing_screen_path.c 	\
						parsing/parsing_color.c 		\
						parsing/parsing_map.c 			\
						parsing/parsing_conf_arg.c 		\
						raycasting/ray_movement.c 		\
						raycasting/ray_cube.c 			\
						raycasting/ray_sprite.c 		\
						raycasting/ray_move.c 			\
						raycasting/raycasting.c 		\
						

OBJS			=		${SRCS:.c=.o}

NAME			=		Cub3D

RM				=		rm -f

CC				=		gcc

FLAGS			=		-Wall -Wextra -Werror

SRCS			=		$(addprefix $(SRC_PATH)/,$(SRCS_NAME))

all:					$(NAME)

		@echo "\033[1;33m          _____                    _____                    _____          \033[1;34m          _____                                   "
		@echo "\033[1;33m         /\    \                  /\    \                  /\    \         \033[1;34m         /\    \                  /\    \         "
		@echo "\033[1;33m        /::\    \                /::\____\                /::\    \        \033[1;34m        /::\    \                /::\    \        "
		@echo "\033[1;33m       /::::\    \              /:::/    /               /::::\    \       \033[1;34m       /::::\    \              /::::\    \       "
		@echo "\033[1;33m      /::::::\    \            /:::/    /               /::::::\    \      \033[1;34m      /::::::\    \            /::::::\    \      "
		@echo "\033[1;33m     /:::/\:::\    \          /:::/    /               /:::/\:::\    \     \033[1;34m     /:::/\:::\    \          /:::/\:::\    \     "
		@echo "\033[1;33m    /:::/  \:::\    \        /:::/    /               /:::/__\:::\    \    \033[1;34m    /:::/__\:::\    \        /:::/  \:::\    \    "
		@echo "\033[1;33m   /:::/    \:::\    \      /:::/    /               /::::\   \:::\    \   \033[1;34m   /::::\   \:::\    \      /:::/    \:::\    \   "
		@echo "\033[1;33m  /:::/    / \:::\    \    /:::/    /      _____    /::::::\   \:::\    \  \033[1;34m  /::::::\   \:::\    \    /:::/    / \:::\    \  "
		@echo "\033[1;33m /:::/    /   \:::\    \  /:::/____/      /\    \  /:::/\:::\   \:::\ ___\ \033[1;34m /:::/\:::\   \:::\    \  /:::/    /   \:::\ ___\ "
		@echo "\033[1;33m/:::/____/     \:::\____\|:::|    /      /::\____\/:::/__\:::\   \:::|    |\033[1;34m/:::/__\:::\   \:::\____\/:::/____/     \:::|    |"
		@echo "\033[1;33m\:::\    \      \::/    /|:::|____\     /:::/    /\:::\   \:::\  /:::|____|\033[1;34m\:::\   \:::\   \::/    /\:::\    \     /:::|____|"
		@echo "\033[1;33m \:::\    \      \/____/  \:::\    \   /:::/    /  \:::\   \:::\/:::/    / \033[1;34m \:::\   \:::\   \/____/  \:::\    \   /:::/    / "
		@echo "\033[1;33m  \:::\    \               \:::\    \ /:::/    /    \:::\   \::::::/    /  \033[1;34m  \:::\   \:::\    \       \:::\    \ /:::/    /  "
		@echo "\033[1;33m   \:::\    \               \:::\    /:::/    /      \:::\   \::::/    /   \033[1;34m   \:::\   \:::\____\       \:::\    /:::/    /   "
		@echo "\033[1;33m    \:::\    \               \:::\__/:::/    /        \:::\  /:::/    /    \033[1;34m    \:::\   \::/    /        \:::\  /:::/    /    "
		@echo "\033[1;33m     \:::\    \               \::::::::/    /          \:::\/:::/    /     \033[1;34m     \:::\   \/____/          \:::\/:::/    /     "
		@echo "\033[1;33m      \:::\    \               \::::::/    /            \::::::/    /      \033[1;34m      \:::\    \               \::::::/    /      "
		@echo "\033[1;33m       \:::\____\               \::::/    /              \::::/    /       \033[1;34m       \:::\____\               \::::/    /       "
		@echo "\033[1;33m        \::/    /                \::/____/                \::/____/        \033[1;34m        \::/    /                \::/____/        "
		@echo "\033[1;33m         \/____/                  ~~                       ~~              \033[1;34m         \/____/                  ~~              "
		@echo "\033[0m"

%.o: %.c				$(HEADER) $(LIBS)
	@gcc -Wall -Wextra -Werror -g3 -I $(HEADER) -c $< -o $@
	
$(NAME):				$(OBJS) $(HEADER)
	@$(MAKE) -C ./libft all
	@$(MAKE) -C ./minilibx all
	@gcc $(FLAGS) -I $(HEADER) -o $(NAME) minilibx/libmlx.a ${LIBS} $(SRCS) -framework OpenGL -framework Appkit

clean:
	@$(MAKE) clean -C ./libft
	@$(MAKE) clean -C ./minilibx
	@echo "\x1b[36m[OK] \033[0m \x1b[31m Removing File object\033[0m"
	@$(RM) $(OBJS)

fclean:					clean
	@$(MAKE) fclean -C ./libft
	@$(MAKE) clean -C ./minilibx
	@echo "\x1b[36m[OK] \033[0m \x1b[31m Removing All\033[0m"
	@$(RM) $(NAME)

re:                                fclean all		
	
