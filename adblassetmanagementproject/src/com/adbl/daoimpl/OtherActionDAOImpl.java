package com.adbl.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import com.adbl.dao.OtherActionDAO;
import com.adbl.model.Bill;
import com.org.dbconnection.DBConnection;

public class OtherActionDAOImpl implements OtherActionDAO {
	PreparedStatement ps=null;
	Connection con=null;
	ResultSet rs=null;

	public boolean uploadbillDao(Bill bill) {
		
		int rs=0;
		con=DBConnection.getConnectionNext(bill.getBranchdb());
		
		try {
			ps=con.prepareStatement("insert into billtbl(billno,companyname,billdate,billdateen,billimageoriginalname, billimagepath, billimagegeneratedname) values(?,?,?,?,?,?,?)");
			ps.setString(1,bill.getBillno() );
			ps.setString(2,bill.getCompanyname() );
			ps.setString(3,bill.getBilldate() );
			ps.setString(4, bill.getBilldateen());
			ps.setString(5, bill.getBillimagename());
			ps.setString(6, bill.getBillimagepath());
			ps.setString(7, bill.getBillimagegeneratedname());
			rs=ps.executeUpdate();
			if (rs > 0) {
				con.close();
				ps = null;
				rs = 0;
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}

	public String downloadFileNameDAO(String name) {

	
		String query="";
		
		con=DBConnection.getConnection();
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, name);
			rs=ps.executeQuery();
			while(rs.next()){
				ps=null;
				rs.close();
				con.close();
				return null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ResultSet viewbillDao(String branchdb)
	{
		
		con=DBConnection.getConnectionNext(branchdb);
		String query="select * from billtbl";
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
		
	}

	public ResultSet viewbillimageDao(String branchdb, String billid)
	{
		con=DBConnection.getConnectionNext(branchdb);
		String query="select * from billtbl where billid='"+billid+"'";
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			if(rs.next())
			{
				return rs;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public boolean deletebilldata(String branchdb, String billid){
		String query="delete from billtbl where billid='"+billid+"'";
		int i=0;
		try{
			con=DBConnection.getConnectionNext(branchdb);
			ps=con.prepareStatement(query);
			i=ps.executeUpdate();
			if(i>0){
				return true;
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
		return false;
	}
	public Bill getbilldetail(String billid, String branchdb,Bill bill){
		String query="select * from billtbl where billid='"+billid+"'";
		try{
			con=DBConnection.getConnectionNext(branchdb);
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			if(rs.next()){
				bill.setBillid(rs.getString("billid"));
				bill.setBilldate(rs.getString("billdate"));
				bill.setBilldateen(rs.getString("billdateen"));
				bill.setBillno(rs.getString("billno"));
				bill.setCompanyname(rs.getString("companyname"));
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
		return bill;
	}
	public boolean editbillDao(String branchdb,Bill bill) {
		String query="update billtbl set billno=?,billdate=?,billdateen=?,companyname=?,billimagegeneratedname=? where billid=?";
		int i=0;
		try{
			con=DBConnection.getConnectionNext(branchdb);
			ps=con.prepareStatement(query);
			ps.setString(1, bill.getBillno());
			ps.setString(2, bill.getBilldate());
			ps.setString(3, bill.getBilldateen());
			ps.setString(4, bill.getCompanyname());
			ps.setString(5, bill.getBillimagegeneratedname());
			ps.setString(6, bill.getBillid());
			i=ps.executeUpdate();
			if(i>0){
				return true;
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
		return false;
	}
	
}
