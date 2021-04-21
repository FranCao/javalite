int main()
{
  int i = 42;
  bool b = 10;
  b = true;
  b = false;
  i = false; /* Fail: assigning a bool to an integer */
}
