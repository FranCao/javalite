class Record {
    int index;
    int data;
    string comment;
}

void updateComment(class Record r, string cmt) {
    string msg = concat("old comment: ", r.comment);
    print(msg);
    r.comment = cmt;
}

int main() {
    class Record rec = Record(0, 42, "added on Apr 10, 2021");
    updateComment(rec, "updated on Apr 18, 2021");
    string msg = concat("new comment: ", rec.comment);
    print(msg);
}