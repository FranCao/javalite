#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

// int i;
// struct arr_int *i_a;

// typedef struct arr_int {
//     int len;
//     int typ;
//     int *i_a;
// } arr_int;

// int length(void *arr) {
//     struct arr_int *arr_i = *(arr_int **) (arr);
//     return arr_i -> len;
// }

// int length(void *arr)
// {
//     int l;
//     // size_t len = sizeof(*arr) / sizeof(*arr[0]);
//     size_t len = sizeof(arr)/sizeof(arr[0]);

//     l = (int)(len);
// }

// int length (void *arr)
// {
//      int size = 0;
//      while (arr != NULL) {
//           size++;
//           arr++;
//      }
//      return size;
// }

int length (void *arr)
{
    return 4;
}

// int length (int *arr)
// {
//     int *parray = &(arr[0]);
//     int len = sizeof(*parray)/sizeof(int);
//     return len;
//     // switch (type_id)
//     // {
//     //     case 0 :
//     //         *(int*)arr sizeof;
//     //         break;
//     //     case 1 :
//     //         *(bool*)arr ;
//     //         break;
//     //     case 2 :
//     //         *(double*)arr ;
//     //         break;
//     // }
// }