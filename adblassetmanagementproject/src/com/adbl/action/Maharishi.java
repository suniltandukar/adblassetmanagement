package com.adbl.action;

import java.util.List;
import java.util.Set;

public class Maharishi {
	

	
/*	public int isGuthrieSequence(int[] a)
	{
		int n=10;
		
	}*/
	
	public void generateSequence(int n)
	{
		
		int i=0;
		while(n!=1)
		{
			if(n%2==0)
			{
				n=n/2;
				System.out.println(n);
				
			}
			else
			{
				n=(n*3)+1;
				System.out.println(n);
				
				
				
			}
			
			
		}
		
		
		
		
	}
	public void StrantonGenerator()
	{
		int[] a=new int[]{1,2,3,4,5,3,2,1,3,4,2,1};
		
		
				for(int j=0;j<a.length;j++)
				{ 
					
					int count=0;
					for(int k=0;k<a.length;k++)
					{
						if(a[j]==a[k])
							count++;
						
					}
					{
						System.out.println("No"+a[j]+"repeats "+count);
					}
				}
			
		
	}
	

}
