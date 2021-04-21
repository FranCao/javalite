string s = "Hello World!!";
string t = "FooFooDooDooBar";

int si = indexOf(s,"e");
print(si);

int ti = indexOf(t,"D");
print(ti);

int sn = indexOf(s,"D");
print(sn);

string c = concat(s,t);
print(c);

s = substring(s,0,6);
c = concat(s,t);
c = concat(c,"!!!!!");
print(c);

