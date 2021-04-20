int main() {
    string[] strArr1 = ["te", "st"];
    string[] strArr2 = ["ar", "ry", "3"];
    print(strArr2[1]);
    string[][] str2dArr = [strArr1, strArr2];
    strArr2 = str2dArr[0];
    print(strArr2[1]);
}