class square {
    string name;
    int side;
}

int main() {
    class square sq = square("fst_sq", 42);
    print(sq.side);
    print(sq.name);
    sq.side = 2;
    sq.name = "snd_sq";
    print(sq.side);
    print(sq.name);
    return 0;
}