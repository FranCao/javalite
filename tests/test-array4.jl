void addOne(int[] arr, int len) {
    int i;
    for (i = 0; i < len; i = i + 1) {
        arr[i] = arr[i] + 1;
    }
}

int main() {
    int[] intArr;
    intArr = [1,2,3];
    print(intArr[0]);
    print(intArr[1]);
    print(intArr[2]);
    addOne(intArr, 3);
    print(intArr[0]);
    print(intArr[1]);
    print(intArr[2]);
    return 0;
}