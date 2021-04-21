void foo(bool i)
{
  int i = 42; /* Should hide the formal i */
  print(i + i);
}

int main()
{
  foo(true);
  return 0;
}
