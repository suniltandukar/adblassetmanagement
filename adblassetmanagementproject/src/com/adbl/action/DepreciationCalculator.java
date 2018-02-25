package com.adbl.action;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.adbl.dao.InventoryDao;
import com.adbl.daoimpl.InventoryDaoImpl;

public class DepreciationCalculator {
	
	public boolean DepCalc()
	
	{
		
		
		
		String itemcode="2020FAN0001";
		InventoryDao idao=new InventoryDaoImpl();
		ResultSet rs=idao.getinventoryfordep(itemcode);
		try {
			//String itemcode=rs.getString("itemcode");
			String purchaseDate=rs.getString("purchasedate");
			DateFormat forpurchaseYear = new SimpleDateFormat("yyyy");
			
			
			
			DateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
			
			Date pdate = dateformat.parse(purchaseDate);
		
			String lastMonth="-03-31";
			String lastDate=forpurchaseYear.format(pdate)+lastMonth;
			
			
			Date ldate=dateformat.parse(lastDate);
				
				
				long difference =  pdate.getTime()-ldate.getTime();
				System.out.println(difference +" diff");
				  float daysBetween = (difference / (1000*60*60*24));
		             
			       System.out.println("Number of Days between dates: "+daysBetween);
			
			
			
			
			
			
			
			double days=35;
			String deprate=rs.getString("depreciationrate");
			double rate=Double.parseDouble(deprate);
		System.out.println("rate is "+rate);
			double amount=Double.parseDouble(rs.getString("amount"));
       System.out.println(amount+"amount");
			double salvage=1;
		
			double depreciation=((amount-salvage)/(100/rate))*(days/365);
			System.out.println("Your depreciation is " +depreciation);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
				
		
		return false;
	}

}
