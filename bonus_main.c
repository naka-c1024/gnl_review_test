#include "../get_next_line.h"
#include <fcntl.h>
#include <stdio.h>

// int	main(int argc, char const *argv[])
// {
// 	int	fd1;
// 	int	fd2;

// 	if (argc == 1)
// 		return (0);
// 	fd1 = open(argv[1], O_RDONLY);
// 	fd2 = open(argv[2], O_RDONLY);
// 	printf("%s",get_next_line(fd1));
// 	printf("%s",get_next_line(fd2));
// 	printf("%s",get_next_line(fd2));
// 	printf("%s",get_next_line(fd1));
// 	printf("%s",get_next_line(fd2));
// 	close(fd1);
// 	close(fd2);
// 	return (0);
// }

//whileで交互に全て出力する
int main(int argc, char const *argv[])
{
	int	fd1;
	int	fd2;
	char	*str;

	if (argc != 3)
		return (0);
	fd1 = open(argv[1], O_RDONLY);
	fd2 = open(argv[2], O_RDONLY);
	str = get_next_line(fd1);
	printf("%s", str);
	str = get_next_line(fd2);
	printf("%s", str);
	while (str)
	{
		free(str);
		str = get_next_line(fd1);
		if (str)
			printf("%s", str);
		free(str);
		str = get_next_line(fd2);
		if (str)
			printf("%s", str);
	}
	close(fd1);
	close(fd2);
	return 0;
}
