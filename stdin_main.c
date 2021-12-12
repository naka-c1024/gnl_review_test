#include "../get_next_line.h"
#include <fcntl.h>
#include <stdio.h>

int main(void)
{
	char	*str;

	str = get_next_line(0);
	if (str)
		printf("%s", str);
	while (str)
	{
		free(str);
		str = get_next_line(0);
		if (str)
			printf("%s", str);
	}
	return 0;
}
