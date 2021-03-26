#include <stdio.h>
#include <stdlib.h>

struct Test {
    int field;
};

struct Test* Test_constrcutor(int a) {
    struct Test *this = malloc(sizeof(struct Test));
    this->field = a;
    return this;
}


int Test_foo(struct Test *this, int b) {
    int c = b + this->field;
    printf("print foo: %d", c);
    return c;
}

int main() {
    struct Test *t;
    t = Test_constrcutor(2);
    Test_foo(t, 3);
    return 0;
}

// "clang -S -emit-llvm" -> .ll
