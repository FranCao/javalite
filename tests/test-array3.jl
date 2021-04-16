int main() {
    string[][] str2dArr;
    string[] strArr1;
    string[] strArr2;
    strArr1 = ["te", "st"];
    strArr2 = ["ar", "ry", "3"];
    print(strArr2[1]);
    str2dArr = [strArr1, strArr2];
    strArr2 = str2dArr[0];
    print(strArr2[1]);
}