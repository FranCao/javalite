void foo(int c, double d)    
{
  int d = 0;
  double e = 0.0;
  e + d; /* Error: double + int */
}

int main()
{
  return 0;
}
