int i = 0;
int k = 0;
for ( ; true ; ) {} /* OK: Forever */

for (i = 0 ; i < 10 ; i = i + 1) {
	if (i == 3) {
		j = j + 1;
	}
}

for (j = 0; i < 10 ; i = i + 1) {} /* j undefined */
