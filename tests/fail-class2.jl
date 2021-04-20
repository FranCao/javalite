class square {
    string name;
    int side;
}

int main() {
    class square sq;
    int s;
    int n;
    sq = square("fst_sq", 42);
    s = sq.side;
    n = sq.name;
    return 0;
}