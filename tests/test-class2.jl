class Person {
    string name;
    int age;
    string phrase;
}

void sayhi(class Person p) {
    string n = concat(p.name, " say:");
    print(n);
    string s = p.phrase;
    for (int i = 0; i < p.age; i = i + 1) {
        s = concat(s, p.phrase);
    }
    print(s);
}

int main() {
    class Person alice = Person("Alice", 3, "hey");
    sayhi(alice);
}