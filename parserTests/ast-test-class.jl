class Test{
    int field;

    constructor (int a) {
        // this.field = a; CANNOT DO THIS
        field = a;
        print(a);
    }

    int foo(int b) {
        print(b+field);
        return b;
    }
}

void bar(string s) {
    prints(s);
}

int main() {
    class Test t; // pointer 
    int f;
    t = Test(2); // pointer to class Test typ
    f = t.field;
    t.foo(3);
    print(f);
}