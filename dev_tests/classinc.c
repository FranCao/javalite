#include <stdio.h>
#include <stdlib.h>

struct square {
    char *name;
    int side;
    struct square* friend;
};

struct square* square_constructor(char* name, int side, struct square* friend) {
    struct square *this = malloc(sizeof(struct square));
    this->name = name;
    this->side = side;
    this->friend = friend;
    return this;
} 

int main() {
    struct square *sq;
    int s;
    char *n;
    sq = square_constructor("fst_square", 42, NULL);
    s = sq->side;
    n = sq->name;
    return 0;
}