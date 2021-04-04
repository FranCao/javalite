#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char* reversestring(const char *str)
{
    size_t len = strlen(str);
    char* revStr = (char*)malloc(len + 1);

    size_t dst, src;
    for (dst = len - 1, src = 0; src < len; src++, dst--) {
        revStr[dst] = str[src];
    }

    revStr[len] = '\0';
    return revStr;
}

#ifdef BUILD_TEST
int main()
{
    char *r;
    char s[] = "HELLO WORLD09AZ";
    r = reversestring(s);
    printf("Reverse of the string: %s\n", r);
}
#endif