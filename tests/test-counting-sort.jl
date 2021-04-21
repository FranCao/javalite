int[] countingSortArray = [0,0,0,0,0,0,0,0,0,0
		        ,0,0,0,0,0,0,0,0,0,0
		        ,0,0,0,0,0,0,0,0,0,0
		        ,0,0,0,0,0,0,0,0,0,0
		        ,0,0,0,0,0,0,0,0,0,0
		        ];
int countingSortArrayLength = 50;
int[] sortingArr = [32,17,31,5,26,13,47,31,9,3,24,41,43,12,11];
int length = 15;
int i = 0;
int j = 0;
   
for (i = 0 ; i < length ; i = i + 1) {
	countingSortArray[sortingArr[i]] = countingSortArray[sortingArr[i]] + 1;   	
}
   
for (i = 0 ; i < countingSortArrayLength ; i = i + 1) {
   if(countingSortArray[i] > 0){
   	for(j=0;j<countingSortArray[i];j = j+1){
   		print(i);
   	}
   }   	
}
