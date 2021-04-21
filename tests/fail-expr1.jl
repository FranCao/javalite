void foo(int c, bool d)    
{
  int dd = 0;
  bool e = true;
  e + dd; /* Error: bool + int */
}

int main()
{
  return 0;
}
