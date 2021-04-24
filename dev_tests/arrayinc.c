#include <stdio.h>
#include <stdlib.h>

int main() {
    int nums[] = {1, 2, 3};
    int a = nums[0];
    size_t arr_size = sizeof(nums);
    size_t arr_fst = sizeof(nums[0]);
    int len = (int)(arr_size/arr_fst);
    printf("%d\n", len);
    return 0;
}