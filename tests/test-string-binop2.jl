int main() {
    string s1 = "hello";
    string s2 = "hey";
    string s3 = "hello";
    print(s1 == s2); // 0
    print(s1 == s3); // 1
    print(s1 != s2); // 1
    print(s1 > s2); // 1
    print(s1 < s2); // 0
    print(s1 >= s2); // 1
    print(s1 <= s3); // 1
}