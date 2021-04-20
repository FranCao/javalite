int main() {
    int[] sortingArr;
    int i;
    int j;
    int tmpForSwap;
    
    int legnth;
    legnth = 15;
    sortingArr = [52,14,72,5,66,7,12,31,9,3,54,41,53,12,61];
    
    for (i = 0 ; i < legnth-1 ; i = i + 1) {
    	for (j =0; j< legnth-i-1;j = j + 1){
    		if (sortingArr[j] > sortingArr[j+1]){
    			
    			tmpForSwap = sortingArr[j];
    			sortingArr[j] = sortingArr[j+1];
    			sortingArr[j+1] = tmpForSwap;
    		}
    	}        
    }
    
    for (i = 0 ; i < legnth; i = i + 1) {
    	 print(sortingArr[i]);
    }
   
    return 0;
}
