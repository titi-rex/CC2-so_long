/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tlegrand <tlegrand@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/01/19 20:16:07 by tlegrand          #+#    #+#             */
/*   Updated: 2023/01/20 21:08:31 by tlegrand         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "so_long.h"
#include <errno.h>

int	main(void)
{
	void	*mlx_ptr;
	//void	*win_ptr;

	mlx_ptr = mlx_init();
	mlx_new_window(mlx_ptr, 400, 400, "my window");
	mlx_loop(mlx_ptr);
	return (0);
}

/*


		t_map	carte;
	t_map	*map;

	map = &carte;
	ft_init_map(map, "map.ber");
	ft_print_map(map);
	ft_freesplit(map->layout);

	*/