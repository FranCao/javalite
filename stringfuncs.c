#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

char* reverse(const char *str)
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

char* substring(const char *str, size_t start, size_t end)
{
    size_t len = strlen(str);
    char* sub = (char*)malloc(len + 1);

    size_t src = 0;

    while (start < end && start < len) {
        sub[src] = str[start];
        src++;
        start++;
    }

    sub[src] = '\0';
    return sub;
}

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

int indexOf(const char *str, const char *find)
{
    int i;
    size_t len = strlen(str);

    for (i = 0; i < len; i++)
    {
        if (str[i] == *find)
            return i;
    }

    return -1;
}

int len(const char *str)
{
    int l;
    size_t len = strlen(str);

    // l = (int*)(len);
    l = (int)(len);
}

char* concat(const char *str1, const char *str2)
{
    size_t len1 = strlen(str1);
    size_t len2 = strlen(str2);
    char* both = (char*)malloc(len1 + len2 + 1);

    strcpy(both, str1);
    strcat(both, str2);

    return both;
}