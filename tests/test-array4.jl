void addOne(int[] arr, int len) {
    for (int i = 0; i < len; i = i + 1) {
        arr[i] = arr[i] + 1;
    }
}


int[] intArr = [1,2,3];
print(intArr[0]);
print(intArr[1]);
print(intArr[2]);
addOne(intArr, 3);
print(intArr[0]);
print(intArr[1]);
print(intArr[2]);
