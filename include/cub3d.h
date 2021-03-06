/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   cub3d.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: alidy <alidy@student.le-101.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/18 10:35:44 by alidy             #+#    #+#             */
/*   Updated: 2020/02/25 06:05:19 by alidy            ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

#ifndef CUB3D_H
# define CUB3D_H

# include "../libft/includes/ft_printf.h"
# include "../minilibx/mlx.h"
# include <math.h>

typedef struct				s_sprite
{
	int						x;
	int						y;
	struct s_sprite			*next;
}							t_sprite;

typedef struct				s_hfile
{
	unsigned char			type[2];
	unsigned int			size;
	unsigned short			reserved1;
	unsigned short			reserved2;
	unsigned int			off_bits;
}							t_hfile;

typedef struct				s_himg
{
	unsigned int			size_h;
	unsigned int			width;
	unsigned int			height;
	unsigned short int		planes;
	unsigned short int		bit_count;
	unsigned int			compression;
	unsigned int			size_img;
	unsigned int			x_ppm;
	unsigned int			y_ppm;
	unsigned int			clr_used;
	unsigned int			clr_important;
}							t_himg;

typedef struct				s_cube
{
	void					*mlx_ptr;
	void					*mlx_win;
	void					*mlx_img;
	void					*text_no;
	void					*text_so;
	void					*text_ea;
	void					*text_we;
	void					*text_s;
	int						*mlx_data;
	int						*data_no;
	int						*data_so;
	int						*data_ea;
	int						*data_we;
	int						*data_sprite;
	int						*data_text;
	int						reso[2];
	int						size_line;
	int						endian;
	int						bpp;
	char					*no;
	char					*so;
	char					*we;
	char					*ea;
	char					*s;
	int						f[3];
	int						c[3];
	char					**map;
	char					*temp;
	char					ori;
	double					pos_x;
	double					pos_y;
	double					dir_x;
	double					dir_y;
	double					plane_x;
	double					plane_y;
	double					camera;
	double					rdir_x;
	double					rdir_y;
	int						len_x;
	int						map_x;
	int						map_y;
	double					sdist_x;
	double					sdist_y;
	double					ddist_x;
	double					ddist_y;
	int						line_h;
	double					pwd;
	int						step_x;
	int						step_y;
	int						hit;
	int						side;
	int						draw_s;
	int						draw_e;
	int						color;
	int						color_f;
	int						color_c;
	int						k_down;
	int						k_up;
	int						k_left;
	int						k_right;
	double					rota_s;
	double					move_s;
	int						text_width;
	int						text_height;
	int						text_width_s;
	int						text_height_s;
	int						text_width_so;
	int						text_height_so;
	int						text_width_no;
	int						text_height_no;
	int						text_width_ea;
	int						text_height_ea;
	int						text_width_we;
	int						text_height_we;
	double					wall_x;
	int						tex_x;
	int						tex_y;
	double					s_x;
	double					s_y;
	double					inv_det;
	double					tsf_x;
	double					tsf_y;
	int						s_screen_x;
	int						s_height;
	int						s_width;
	int						draw_s_y;
	int						draw_e_y;
	int						draw_s_x;
	int						draw_e_x;
	int						s_tex_x;
	int						s_tex_y;
	t_sprite				*save;
}							t_cube;

void						ft_stderr(int nb, t_cube *conf);
void						ft_free_conf(t_cube *conf);
t_cube						ft_init_conf(void);
int							ft_check_after(char *str, int i);
int							ft_parsing_arg(int gc, char **gv);
int							ft_get_id(char *str, t_cube *conf);
int							ft_parsing_map
(char *line, t_cube *conf, int *check);
void						ft_get_start(t_cube *conf, char c, int x, int y);
void						ft_parsing_screen(char *line, t_cube *conf, int i);
void						ft_parsing_color
(char *line, t_cube *conf, int i, int nb);
void						ft_parsing_path
(char *line, t_cube *conf, int i, int nb);
void						ft_parsing_conf(char *line, t_cube *conf, int i);
void						ft_parsing_all(int gc, char **gv, t_cube *conf);
int							ft_raycasting(t_cube *conf);
int							color(int r, int g, int b);
int							keyhooks(t_cube *conf);
int							ft_define_movement(int key, t_cube *conf);
int							ft_reset_movement(int key, t_cube *conf);
void						ft_game(t_cube *conf);
int							ft_raycasting(t_cube *conf);
int							ft_close_mlx(t_cube *conf);
void						ft_init_cube(t_cube *c);
void						ft_init_raycast(int x, t_cube *conf);
void						ft_draw1(t_cube *conf);
void						ft_draw2(t_cube *conf, t_sprite **lst);
void						ft_draw_text(int x, t_cube *c);
void						ft_draw3(int x, t_cube *c, double *buffer);
void						ft_start_rota(t_cube *conf);
void						ft_change_start(t_cube *conf);
void						right_rota(t_cube *conf);
void						left_rota(t_cube *conf);
void						ft_create_bmp(t_cube *conf);
void						ft_draw_sprite
(t_cube *c, t_sprite *lst, double *buffer);
int							ft_add_lst_sprite(int x, int y, t_sprite **lst);

#endif
