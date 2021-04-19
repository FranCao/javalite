class square {
    string name;
    int side;
}

class square constr_square(string name, int side) {
    class square sq;
    sq.side = 42;
    sq.name = "fst_sq";
    return sq;
}

int main() {
    class square sq;
    int s;
    string n;
    //sq = square("fst_sq", 42);
    //sq.side = 42;
    //sq.name = "fst_sq";
    sq = constr_square("fst_sq", 42);
    s = sq.side;
    n = sq.name;
    print(s);
    print(n);
    return 0;
}