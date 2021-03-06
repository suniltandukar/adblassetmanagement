package com.adbl.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import com.adbl.dao.OtherActionDAO;
import com.adbl.model.Bill;
import com.adbl.model.Inventory;
import com.org.dbconnection.DBConnection;

public class OtherActionDAOImpl implements OtherActionDAO {
	PreparedStatement ps=null;
	Connection con=null;
	ResultSet rs=null;

	public boolean uploadbillDao(Bill bill) {
		
		int rs=0;
		con=DBConnection.getConnectionNext(bill.getBranchdb());
		
		try {
			ps=con.prepareStatement("insert into billtbl(billno,companyid,billdate,billdateen,billimageoriginalname, billimagepath, billimagegeneratedname,billportpathid) values(?,?,?,?,?,?,?,?)");
			ps.setString(1,bill.getBillno() );
			ps.setString(2,bill.getCompanyid() );
			ps.setString(3,bill.getBilldate() );
			ps.setString(4, bill.getBilldateen());
			ps.setString(5, bill.getBillimagename());
			ps.setString(6, bill.getBillimagepath());
			ps.setString(7, bill.getBillimagegeneratedname());
			ps.setString(8, "1");
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
	
	public ResultSet viewbillDao()
	{
		
		con=DBConnection.getConnection();
		String query="select billtbl.*, billportpathtbl.ipport, billportpathtbl.filepath, companytbl.companyname from billtbl join billportpathtbl on billportpathtbl.billportpathid=billtbl.billportpathid join companytbl on billtbl.companyid=companytbl.companyid";
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			if(rs!=null){
				return rs;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
		
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
	public boolean deletebilldata(String billid){
		String query="delete from billtbl where billid='"+billid+"'";
		int i=0;
		try{
			con=DBConnection.getConnection();
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
		String query="select billtbl.*, companytbl.companyname from billtbl join companytbl on companytbl.companyid=billtbl.companyid where billtbl.billid='"+billid+"'";
		try{
			con=DBConnection.getConnectionNext(branchdb);
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			if(rs.next()){
				bill.setBillid(rs.getString("billid"));
				bill.setBilldate(rs.getString("billdate"));
				bill.setBilldateen(rs.getString("billdateen"));
				bill.setBillno(rs.getString("billno"));
				bill.setCompanyid(rs.getString("companyid"));
				bill.setCompanyname(rs.getString("companyname"));
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
		return bill;
	}
	public boolean editbillDao(String branchdb,Bill bill) {
		String query="update billtbl set billno=?,billdate=?,billdateen=?,companyid=?,billimagegeneratedname=? where billid=?";
		int i=0;
		try{
			con=DBConnection.getConnectionNext(branchdb);
			ps=con.prepareStatement(query);
			ps.setString(1, bill.getBillno());
			ps.setString(2, bill.getBilldate());
			ps.setString(3, bill.getBilldateen());
			ps.setString(4, bill.getCompanyid());
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
	
	public JSONObject getDepreciation(){
		
		JSONObject jObjDevice=null;
		String query="select *,inventoryitemdetail.itemname from depreciation join inventoryitemdetail on inventoryitemdetail.itemcode=depreciation.itemcode";
		try{
			con=DBConnection.getConnection();
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			JSONArray jsonArray=new JSONArray();
			while(rs.next()){
				JSONObject jobj = new JSONObject();
				String did=rs.getString("did");
				String itemcode=rs.getString("itemcode");
			    String lastyrdep=rs.getString("lastyrdep");
			    String curyrdep=rs.getString("curyrdep");
			    String rate=rs.getString("rate");
			    String totaldep=rs.getString("totaldep");
			    String balance=rs.getString("balance");
			    String itemname=rs.getString("itemname");
			    String groupname=rs.getString("groupname");
			   
			   jobj.put("did", did);
					jobj.put("itemcode", itemcode);
					jobj.put("lastyrdep", lastyrdep);
					jobj.put("curyrdep", curyrdep);
				    jobj.put("rate", rate);
				    jobj.put("totaldep", totaldep);
				    jobj.put("balance", balance);
				    jobj.put("itemname", itemname);
				    jobj.put("groupname", groupname);
				    jsonArray.put(jobj);
				    
				    jObjDevice = new JSONObject();
				    jObjDevice.put("data", jsonArray);
			}
		}catch(Exception e){
			System.out.println(e);
		}
		return jObjDevice;
	}
	
	public List<String> getDashboardDetails(String username)
	{
		List<String> list=new ArrayList<String>();
		String usercount;
		String query="select (select count(*) from usertbl) as totaluser, (select count(*) from grouptbl) as totalgroup, (select count(*) from inventorytbl) as totalinventory,(select count(*) from inventorytbl where inputter='"+username+"') as inputcount";
		con=DBConnection.getConnection();
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			
			if(rs.next())
			{
				list.add(rs.getString("totaluser"));
				list.add(rs.getString("totalgroup"));
				list.add(rs.getString("totalinventory"));
				list.add(rs.getString("inputcount"));
			}
			return list;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
		
	}
}
