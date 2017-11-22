package com.adbl.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.adbl.dao.OtherActionDAO;
import com.adbl.model.Bill;
import com.org.dbconnection.DBConnection;

public class OtherActionDAOImpl implements OtherActionDAO {

	public boolean uploadbillDao(Bill bill) {
		PreparedStatement ps=null;
		Connection con=null;
		int rs=0;
		con=DBConnection.getConnectionNext(bill.getBranchdb());
		
		try {
			ps=con.prepareStatement("insert into billtbl(billno,companyname,billdate,billdateen,billimageoriginalname) values(?,?,?,?,?)");
			ps.setString(1,bill.getBillno() );
			ps.setString(2,bill.getCompanyname() );
			ps.setString(3,bill.getBilldate() );
			ps.setString(4, bill.getBilldateen());
			ps.setString(5, bill.getBillimagename());
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
		PreparedStatement ps=null;
		ResultSet rs=null;
		Connection con=null;
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

}
