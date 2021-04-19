class Person {
    string name;
    int age;
    string phrase;
}

void sayhi(class Person p) {
    string s;
    string n;
    int i;
    n = concat(p.name, " say:");
    print(n);
    s = p.phrase;
    for (i = 0; i < p.age; i = i + 1) {
        s = concat(s, p.phrase);
    }
    print(s);
}

int main() {
    class Person alice;
    alice = Person("Alice", 3, "hey");
    sayhi(alice);
}