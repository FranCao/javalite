#include <stdio.h>
#include <stdlib.h>

struct square {
    char *name;
    int side;
};

struct square* square_constructor(char* name, int side) {
    struct square *this = malloc(sizeof(struct square));
    this->name = name;
    this->side = side;
    return this;
} 

int main() {
    struct square *sq;
    int s;
    char *n;
    sq = square_constructor("fst_square", 42);
    s = sq->side;
    n = sq->name;
    return 0;
}