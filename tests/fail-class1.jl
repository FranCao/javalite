class square {
    string name;
    int side;
}

int main() {
    class square sq = square("fst_sq", "42");
    int s = sq.side;
    string n = sq.name;
    return 0;
}