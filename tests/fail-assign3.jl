void myvoid()
{
  return;
}

int main()
{
  int i = myvoid(); /* Fail: assigning a void to an integer */
}
