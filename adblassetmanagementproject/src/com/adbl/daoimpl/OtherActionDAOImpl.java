package com.adbl.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.adbl.dao.OtherActionDAO;
import com.org.dbconnection.DBConnection;

public class OtherActionDAOImpl implements OtherActionDAO {

	public boolean uploadbillDao(String billno, String companyname, String billdate, String billdateen, String billimagename,String branchdb) {
		PreparedStatement ps=null;
		Connection con=null;
		int rs=0;
		con=DBConnection.getConnectionNext(branchdb);
		
		try {
			ps=con.prepareStatement("insert into billtbl(billno,companyname,billdate,billdateen,billimagename) values(?,?,?,?,?)");
			ps.setString(1,billno );
			ps.setString(2,companyname );
			ps.setString(3,billdate );
			ps.setString(4, billdateen);
			ps.setString(5, billimagename);
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
		// TODO Auto-generated method stub
		
		PreparedStatement ps=null;
		ResultSet rs=null;
		Connection con=null;
		
		con=DBConnection.getConnection();
		
		try {
			ps=con.prepareStatement("select cv from jobseeker where username=?");
			ps.setString(1, name);
			rs=ps.executeQuery();
			
			while(rs.next()){
				String file=rs.getString("cv");
				
				ps=null;
				rs=null;
				con.close();
				return file;
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		
				
		return null;
	}

}
