int main()
{
  int i = 0;

  for (i = 0; i < 10 ; i = j + 1) {} /* j undefined */

  return 0;
}