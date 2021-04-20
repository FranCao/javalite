int main() {
    string s1;
    string s2;
    string s3;
    s1 = "hello";
    s2 = "hey";
    s3 = "hello";
    print(s1 == s2); // 0
    print(s1 == s3); // 1
    print(s1 != s2); // 1
    print(s1 > s2); // 1
    print(s1 < s2); // 0
    print(s1 >= s2); // 1
    print(s1 <= s3); // 1
}