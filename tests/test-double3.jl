void testdouble(double a, double b)
{
  print(a + b);
  print(a - b);
  print(a * b);
  print(a / b);
  print(a == b);
  print(a == a);
  print(a != b);
  print(a != a);
  print(a > b);
  print(a >= b);
  print(a < b);
  print(a <= b);
}

double c = 42.0;
double d = 3.14159;

testdouble(c, d);

testdouble(d, d);

