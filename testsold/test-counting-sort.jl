int main() {
   int[] countingSortArray;
   int countingSortArrayLegnth;   
   int[] sortingArr;
   int legnth;
   int i;
   int j;
   
   countingSortArray = [0,0,0,0,0,0,0,0,0,0
		        ,0,0,0,0,0,0,0,0,0,0
		        ,0,0,0,0,0,0,0,0,0,0
		        ,0,0,0,0,0,0,0,0,0,0
		        ,0,0,0,0,0,0,0,0,0,0
		        ];
   countingSortArrayLegnth = 50;
   sortingArr = [32,17,31,5,26,13,47,31,9,3,24,41,43,12,11];
   legnth = 15;
   
   for (i = 0 ; i < legnth ; i = i + 1) {
   	countingSortArray[sortingArr[i]] = countingSortArray[sortingArr[i]] + 1;   	
   }
   
   for (i = 0 ; i < countingSortArrayLegnth ; i = i + 1) {
   	if(countingSortArray[i] > 0){
   		for(j=0;j<countingSortArray[i];j = j+1){
   			print(i);
   		}
   	}   	
   }
   
    return 0;
}
