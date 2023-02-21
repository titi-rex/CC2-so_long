/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   so_long_bonus.h                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tlegrand <tlegrand@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/01/19 20:07:38 by tlegrand          #+#    #+#             */
/*   Updated: 2023/02/21 19:43:55 by tlegrand         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef SO_LONG_BONUS_H
# define SO_LONG_BONUS_H
# include <unistd.h>
# include <stdlib.h>
# include <fcntl.h>
# include <stdio.h>
# include <string.h>
# include <X11/X.h>
# include "../libft/libft.h"
# include "../minilibx-linux/mlx.h"
# include "img_draw.h"

/*	==========	struct	==========	*/
typedef struct s_map
{
	char	**layout;
	int		ysize;
	int		xsize;
	int		count[3];
}	t_map;

typedef struct s_mlx
{
	void	*ptr;
	void	*win;
}	t_mlx;

typedef struct s_sprite
{
	void	*id;
}	t_sprite;

typedef struct s_game
{
	t_map		map;
	int			pos[2];
	int			pos_e[2];
	int			pos_b[2];
	int			move;
	int			badguys;
	t_mlx		mlx;
	t_sprite	floor;
	t_sprite	exit;
	t_sprite	wall[2];
	t_sprite	gem[5];
	t_sprite	gui[3];
	t_sprite	sign[11];
	t_sprite	idle[6];
	t_sprite	idle_exit[6];
	t_sprite	run_r[8];
	t_sprite	run_l[8];
	t_sprite	jump_u[12];
	t_sprite	jump_d[12];
	t_sprite	enemy[5];
}	t_game_data;

/*	==========	general functions	==========	*/
void	ft_init_game(t_game_data *game);
void	ft_init_pos(t_game_data *game);
void	ft_free2d(void **arr, int size);
void	ft_clean_exit(t_game_data *game, int exit_code);
void	ft_putstr_quit(t_game_data *game, char *strerr, int exit_code);
void	ft_credit(void);

/*	==========	map management	==========	*/
void	ft_error_map(t_map *map, int errnum, char *errstr);
void	ft_print_map(t_map *map);
void	ft_map_check_name(char *pathname);
char	**ft_get_map(char *pathname);
void	ft_get_mapsize(t_map *map);
void	ft_check_map(t_map *map);
void	ft_backtrack(t_map *map, int ypos, int xpos);
void	ft_init_map(t_map *map, char *pathname);
void	ft_clean_map(t_map *map);
void	ft_init_enemy(t_game_data *game);

/*	==========	mlx management	==========	*/
# define UP		65362
# define DOWN	65364
# define LEFT	65361
# define RIGHT	65363
# define ESC	65307

void	ft_init_mlx(t_game_data *game);
int		ft_hook_key(int keycode, t_game_data *game);
int		ft_stop(t_game_data *game);

/*	==========	sprite and image	==========	*/
# ifndef TILE
#  define TILE 96
# endif

int		ft_init_sprite_idle(t_mlx *mlx, t_sprite idle[6]);
int		ft_init_sprite_idle_exit(t_mlx *mlx, t_sprite idle_exit[6]);
int		ft_init_sprite_run_r(t_mlx *mlx, t_sprite run_r[6]);
int		ft_init_sprite_run_l(t_mlx *mlx, t_sprite run_l[6]);
int		ft_init_sprite_gem(t_mlx *mlx, t_sprite gem[5]);
void	ft_init_sprite(t_game_data *game);

void	ft_display_tile(t_mlx *mlx, t_sprite *tile, int x, int y);
void	ft_display_all(t_game_data *game);
void	ft_display_exit_open(t_game_data *game);
void	ft_animate_idle(t_game_data *game);
int		ft_animate_loop(t_game_data *game);
void	ft_animate_run_r(t_game_data *game);
void	ft_animate_run_l(t_game_data *game);
void	ft_animate_jump_u(t_game_data *game);
void	ft_animate_jump_d(t_game_data *game);
void	ft_move(t_game_data *game, int axis, int dir);
void	ft_display_move(t_game_data *game);

# define IDLE1	"sprites/idle_1.xpm"
# define IDLE2	"sprites/idle_2.xpm"
# define IDLE3	"sprites/idle_3.xpm"
# define IDLE4	"sprites/idle_4.xpm"
# define IDLE5	"sprites/idle_5.xpm"
# define IDLE6	"sprites/idle_6.xpm"

# define IDLE_EXIT1	"sprites/idle_1_exit.xpm"
# define IDLE_EXIT2	"sprites/idle_2_exit.xpm"
# define IDLE_EXIT3	"sprites/idle_3_exit.xpm"
# define IDLE_EXIT4	"sprites/idle_4_exit.xpm"
# define IDLE_EXIT5	"sprites/idle_5_exit.xpm"
# define IDLE_EXIT6	"sprites/idle_6_exit.xpm"

# define RUN_R1	"sprites/run_r_1.xpm"
# define RUN_R2	"sprites/run_r_2.xpm"
# define RUN_R3	"sprites/run_r_3.xpm"
# define RUN_R4	"sprites/run_r_4.xpm"
# define RUN_R5	"sprites/run_r_5.xpm"
# define RUN_R6	"sprites/run_r_6.xpm"
# define RUN_R7	"sprites/run_r_7.xpm"
# define RUN_R8	"sprites/run_r_8.xpm"

# define RUN_L1	"sprites/run_l_1.xpm"
# define RUN_L2	"sprites/run_l_2.xpm"
# define RUN_L3	"sprites/run_l_3.xpm"
# define RUN_L4	"sprites/run_l_4.xpm"
# define RUN_L5	"sprites/run_l_5.xpm"
# define RUN_L6	"sprites/run_l_6.xpm"
# define RUN_L7	"sprites/run_l_7.xpm"
# define RUN_L8	"sprites/run_l_8.xpm"

# define JUMP_U0	"sprites/jump_u_0.xpm"
# define JUMP_U1	"sprites/jump_u_1.xpm"
# define JUMP_U2	"sprites/jump_u_2.xpm"
# define JUMP_U3	"sprites/jump_u_3.xpm"
# define JUMP_U4	"sprites/jump_u_4.xpm"
# define JUMP_U5	"sprites/jump_u_5.xpm"
# define JUMP_U6	"sprites/jump_u_6.xpm"
# define JUMP_U7	"sprites/jump_u_7.xpm"
# define JUMP_U8	"sprites/jump_u_8.xpm"
# define JUMP_U9	"sprites/jump_u_9.xpm"
# define JUMP_U10	"sprites/jump_u_10.xpm"
# define JUMP_U11	"sprites/jump_u_11.xpm"

# define JUMP_D0	"sprites/jump_d_0.xpm"
# define JUMP_D1	"sprites/jump_d_1.xpm"
# define JUMP_D2	"sprites/jump_d_2.xpm"
# define JUMP_D3	"sprites/jump_d_3.xpm"
# define JUMP_D4	"sprites/jump_d_4.xpm"
# define JUMP_D5	"sprites/jump_d_5.xpm"
# define JUMP_D6	"sprites/jump_d_6.xpm"
# define JUMP_D7	"sprites/jump_d_7.xpm"
# define JUMP_D8	"sprites/jump_d_8.xpm"
# define JUMP_D9	"sprites/jump_d_9.xpm"
# define JUMP_D10	"sprites/jump_d_10.xpm"
# define JUMP_D11	"sprites/jump_d_11.xpm"

# define SIGN0	"sprites/sign_zero.xpm"
# define SIGN1	"sprites/sign_one.xpm"
# define SIGN2	"sprites/sign_two.xpm"
# define SIGN3	"sprites/sign_three.xpm"
# define SIGN4	"sprites/sign_four.xpm"
# define SIGN5	"sprites/sign_five.xpm"
# define SIGN6	"sprites/sign_six.xpm"
# define SIGN7	"sprites/sign_seven.xpm"
# define SIGN8	"sprites/sign_eight.xpm"
# define SIGN9	"sprites/sign_nine.xpm"
# define SIGN10	"sprites/sign.xpm"

# define GEM1	"sprites/gem_1.xpm"
# define GEM2	"sprites/gem_2.xpm"
# define GEM3	"sprites/gem_3.xpm"
# define GEM4	"sprites/gem_4.xpm"
# define GEM5	"sprites/gem_5.xpm"

# define FLOOR	"sprites/grass_1.xpm"
# define WALL1	"sprites/tree_1.xpm"
# define WALL2	"sprites/tree_2.xpm"
# define EXIT_C	"sprites/box_close.xpm"
# define EXIT_O	"sprites/box_open.xpm"
# define STOP1	"sprites/pause1.xpm"

#endif