void repeatStr(string[] arr, int len) {
    for (int i = 0; i < len; i = i + 1) {
        arr[i] = concat(arr[i], arr[i]);
    }
}


string[] strArr = ["hi", "hello", "hey"];
print(strArr[0]);
print(strArr[1]);
print(strArr[2]);
repeatStr(strArr, 3);
print(strArr[0]);
print(strArr[1]);
print(strArr[2]);

