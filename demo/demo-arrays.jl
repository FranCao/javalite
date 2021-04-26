int[] row1A = [2, 5];
int[] row2A = [1, 2];
int[] row1B = [4, 5];
int[] row2B = [2, 3];
// [[2, 3], [1, 2]];

//int[][] c = [[2, 5], [1, 2]];
int[][] a = [row1A, row2A];
int[][] b = [row1B, row2B];
deterMult(a, b);

// assuming size of 2s
void deterMult(int[][] a, int[][] b) {
    int[] row1A = a[0];
    int[] row2A = a[1];
    int[] row1B = b[0];
    int[] row2B = b[1];

    int f0 = (row1A[0] * row1B[0]) + (row1A[1] * row2B[0]);
    int f1 = (row1A[0] * row1B[1]) + (row1A[1] * row2B[1]);
    int f2 = (row2A[0] * row1B[0]) + (row2A[1] * row2B[0]);
    int f3 = (row2A[0] * row1B[1]) + (row2A[1] * row2B[1]);
    print((f0 * f3) - (f1 * f2));
}

/* 
|[ 2 5 ][ 4 5 ]|   |[ 18 25 ]|
|[ 1 2 ][ 2 3 ]| = |[ 8  11 ]| = (198 - 200) = -2 */
