package com.adbl.action;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.adbl.dao.InventoryDao;
import com.adbl.daoimpl.InventoryDaoImpl;

public class DepreciationCalculator {

	public double DepCalc(String itemcode, String lastDate, String purchaseDate, String deprate, String samount)

	
	{
		System.out.println("itemcode="+itemcode+" lastDate="+lastDate+" purchasedate="+purchaseDate+" deprate="+deprate+" samount="+samount);
		double depreciation=0;

		try {
		InventoryDao idao = new InventoryDaoImpl();
	
	
		ResultSet rs = idao.getinventoryfordep(itemcode);
		
		
		 
		 double amount = Double.parseDouble(samount);
		 double rate = Double.parseDouble(deprate);
		
		
			// String itemcode=rs.getString("itemcode");
			//String purchaseDate = rs.getString("purchasedate");
			
			DateFormat forpurchaseYear = new SimpleDateFormat("yyyy");

			DateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");

			Date pdate = dateformat.parse(purchaseDate);

			//String lastMonth = "-07-15";
			//String lastDate = forpurchaseYear.format(pdate) + lastMonth;
			
			System.out.println("Last Date "+lastDate);

			Date ldate = dateformat.parse(lastDate);

			if (ldate.compareTo(pdate) > 0) {

				long difference = ldate.getTime() -pdate.getTime();
				System.out.println(difference + " diff");
				float daysBetween = (difference / (1000 * 60 * 60 * 24));

				System.out.println("Number of Days between dates: " + daysBetween);

				
				
				System.out.println("rate is " + rate);
			
				System.out.println(amount + "amount");

				double salvage = 1;

				 depreciation = ((amount - salvage) / (100 / rate)) * (daysBetween / 365);

				System.out.println("Your depreciation is " + depreciation);
			}
			else{
				depreciation=0;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return depreciation;
	}

}
