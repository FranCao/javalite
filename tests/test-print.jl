int i = 3;
int j = 9;
print(i + j);
print(i - j);
print(i / j);

string s = "Foo";
print(s);

double a = 3.14159267;
double b = -2.71828;
print(a + b);
print(a == b);

print(true && false);
print(!false);
print("hello" + " world");
print(1 + 2 * 3 + 4);

string[] strArr = ["hello", "world"];
print(strArr[0]);

int fib(int x)
{
  if (x < 2) return 1;
  return fib(x-1) + fib(x-2);
}
print(fib(0));
print(fib(3));