class square {
    string name;
    int side;
    class square friend;
}

void so() {
//class square sq = Null;
class square sq = square("fst_sq", 42, Null);
class square sq2 = square("fst_sq", 42, sq);
int s = sq.side;
string n = sq.name;
sq2.friend = Null;
print(s);
print(n);
}
class square sq = square("fst_sq", 42, Null);
class square sq2 = square("fst_sq", 42, sq);
int s = sq.side;

//so();
