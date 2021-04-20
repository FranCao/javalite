int main()
{
    string s;
    string t;
    string c;
    int si;
    int ti;
    int sn;

    s = "Hello World!!";
    t = "FooFooDooDooBar";

    si = indexOf(s,"e");
    print(si);

    ti = indexOf(t,"D");
    print(ti);

    sn = indexOf(s,"D");
    print(sn);

    c = concat(s,t);
    print(c);

    s = substring(s,0,6);
    c = concat(s,t);
    c = concat(c,"!!!!!");
    print(c);
}