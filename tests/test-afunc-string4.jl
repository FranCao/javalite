int main()
{
    string s;
    string t;
    string r;
    s = "Hello World!!";
    t = "FooFooDooDooBar";

    prints(s);
    r = substring(s,1,5);
    prints(r);
    r = substring(s,4,7);
    prints(r);

    r = substring(t,0,10);
    prints(r);
    r = substring(t,4,6);
    prints(r);
}