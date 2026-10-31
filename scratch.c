#include <stdio.h>
#include <stddef.h>

size_t ft_strlen(const char *s)
{
    // your code here
}

int main(void)
{
    printf("%zu\n", ft_strlen("hello"));   // expect 5
    printf("%zu\n", ft_strlen(""));        // expect 0
    printf("%zu\n", ft_strlen("a"));       // expect 1
    return 0;
}
