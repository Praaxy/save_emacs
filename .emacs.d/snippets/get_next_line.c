/*
** get_next_line.c for  in /home/praxy/CPE_2016_stumper4
** 
** Made by AntoineV
** Login   <praxy>
** 
** Started on  Wed May 10 14:21:46 2017 AntoineV
** Last update Sat May 13 17:31:56 2017 AntoineV
*/

/* #include "header.h" */

#include <unistd.h>

char	*get_next_line(int fd)
{
  int	n;
  int	i;
  char	buff[1];
  char	*ret;

  ret = malloc(sizeof(char) * 1024);
  while ((n = read(fd, buff, 1)) >= 0)
    {
      if (buff[0] == '\0')
	return (NULL);
      if (buff[n - 1] == '\n')
	{
	  ret[i] = '\0';
	  return (ret);
	} 
      ret[i] =  buff[n - 1];
      i++;
    }
  return (ret);
 }
