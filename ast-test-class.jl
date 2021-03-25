class Test{
    int field;

    constructor (int a) {
        // this.field = a; CANNOT DO THIS
        field = a;
        print(a);
    }

    int foo(int b) {
        print(b);
        return b;
    }
}

void bar(string s) {
    prints(s);
}

int main() {
    class Test t;
    int f;
    t = Test(2);
    f = t.field;
    print(f);
}