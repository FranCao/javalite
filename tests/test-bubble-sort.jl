int main() {
    int[] sortingArr = [52,14,72,5,66,7,12,31,9,3,54,41,53,12,61];
    int i = 0;
    int j = 0;
    int tmpForSwap = 0;
    
    int length = 15;
    
    for (i = 0 ; i < length-1 ; i = i + 1) {
    	for (j =0; j< length-i-1;j = j + 1){
    		if (sortingArr[j] > sortingArr[j+1]){
    			
    			tmpForSwap = sortingArr[j];
    			sortingArr[j] = sortingArr[j+1];
    			sortingArr[j+1] = tmpForSwap;
    		}
    	}        
    }
    
    for (i = 0 ; i < length; i = i + 1) {
    	 print(sortingArr[i]);
    }
   
    return 0;
}
