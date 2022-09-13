NAME = fdf

CC = gcc
CFLAGS = -Wall -Wextra -Werror

LIBMLX = mlx_linux/libmlx_Linux.a
OTHER_LIBS = -lX11 -lXext

HEADER_DIR =  includes/
SRCS_DIR = srcs/
SRCS = $(shell find srcs/*.c)
OBJS_DIR = objs/
OBJS = $(notdir $(SRCS:.c=.o))
OBJS_PREFIXED = $(addprefix $(OBJS_DIR), $(OBJS))

#text_color
COLOR_OFF =\033[0m
RED =\033[0;31m
GREEN =\033[0;32m
YELLOW =\033[0;33m
CYAN =\033[1;36m
MAGNETA =\033[95m 
all : $(NAME)

$(OBJS_DIR)%.o : $(SRCS_DIR)%.c
	@mkdir -p $(OBJS_DIR)
	@$(CC) $(CFLAGS) -c $< -o $@ -I$(HEADER_DIR)
	@echo "$(GREEN)Compiling : $< $(COLOR_OFF)"

$(NAME) : $(OBJS_PREFIXED)
	@$(CC) $(CFLAGS) $(OBJS_PREFIXED) $(LIBMLX) $(OTHER_LIBS) -o $(NAME)
	@echo "$(CYAN)fdf done !$(COLOR_OFF)"

clean :
	@rm -rf $(OBJS_DIR)
	@echo "$(RED)Removed : obj files$(COLOR_OFF)"

fclean : clean
	@rm -rf fdf
	@echo "$(RED)Removed : fdf$(COLOR_OFF)"

.PHONY : clean fclean all
