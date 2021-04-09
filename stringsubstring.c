#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

char* substring(const char *str, size_t start, size_t end)
{
    size_t len = strlen(str);
    char* sub = (char*)malloc(len + 1);

    size_t src;

    while (start < end || start < len) {
        sub[src] = str[start];
        src++;
        start++;
    }

    sub[len] = '\0';
    return sub;
}

#ifdef BUILD_TEST
int main()
{
    char *r;
    char s[] = "HELLO WORLD09AZ";
    r = substring(s,1,5);
    printf("Substring of the string: %s\n", r);
}
#endif