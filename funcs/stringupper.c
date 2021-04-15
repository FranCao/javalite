#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

char* upper(const char *str)
{
    size_t len = strlen(str);
    char* upStr = (char*)malloc(len + 1);

    size_t src;
    for (src = len - 1, src = 0; src < len; src++) {
        upStr[src] = toupper(str[src]);
    }

    upStr[len] = '\0';
    return upStr;
}

#ifdef BUILD_TEST
int main()
{
    char *r;
    char s[] = "HELLO WORLD09AZ";
    r = upper(s);
    printf("Upper of the string: %s\n", r);
}
#endif