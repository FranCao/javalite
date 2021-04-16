int main()
{
    string s;
    string t;
    string c;
    int si;
    int ti;

    s = "Hello World!!";
    t = "FooFooDooDooBar";

    si = indexOf(s,"e");
    print(si);

    ti = indexOf(s,"D");
    print(ti);

    c = concat(s,t);
    print(c);

    s = substring(s,0,6);
    c = concat(s,t);
    c = concat(c,"!!!!!");
    print(c);
}