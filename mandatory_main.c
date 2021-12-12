#include "../get_next_line.h"
#include <fcntl.h>
#include <stdio.h>

int main(int argc, char const *argv[])
{
	int		fd;
	char	*str;

	if (argc == 1)
		return (0);
	// fd = 0 /*stdin(note ; argc)*/
	fd = open(argv[1], O_RDONLY);
	str = get_next_line(fd);
	if (str)
		printf("%s", str);
	while (str)
	{
		free(str);
		str = get_next_line(fd);
		if (str)
			printf("%s", str);
	}
	close(fd);
	return 0;
}
