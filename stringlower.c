#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

char* lower(const char *str)
{
    size_t len = strlen(str);
    char* lowStr = (char*)malloc(len + 1);

    size_t src;
    for (src = len - 1, src = 0; src < len; src++) {
        lowStr[src] = tolower(str[src]);
    }

    lowStr[len] = '\0';
    return lowStr;
}

#ifdef BUILD_TEST
int main()
{
    char *r;
    char s[] = "HELLO WORLD09AZ";
    r = lower(s);
    printf("Lower of the string: %s\n", r);
}
#endif