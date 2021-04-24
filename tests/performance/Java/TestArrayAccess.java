class TestArrayAccess{
	public static void main(String args[]){
		int[] Arr = {52,14,72,5,66,7,12,31,9,3,54,41,53,12,61};
		int length = 15;

		int count = 100000000;
		int i=0;

		int v = 0;
		while(count > 0){	
		    	for(i=0;i<length;i = i+1){
		    		v = Arr[i];
		    		Arr[i] = 3;
		    	}    	
		    	count = count-1;
		}

		System.out.println("Array-Access Test Completed");
	}
}
