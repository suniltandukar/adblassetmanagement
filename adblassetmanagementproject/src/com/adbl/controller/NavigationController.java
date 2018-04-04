package com.adbl.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.adbl.action.DepreciationCalculator;
import com.adbl.action.OtherAction;
import com.adbl.action.TransferAction;
import com.adbl.action.UserAction;
import com.adbl.dao.InventoryDao;
import com.adbl.dao.TransferDao;
import com.adbl.dao.UserDao;
import com.adbl.daoimpl.InventoryDaoImpl;
import com.adbl.daoimpl.TransferDaoImpl;
import com.adbl.daoimpl.UserDaoImpl;
import com.adbl.model.DepreciationModel;
import com.adbl.model.History;
import com.adbl.model.IssueModel;
import com.adbl.model.UserModel;


@WebServlet("/NavigationController")
public class NavigationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public NavigationController() {
        super();
    }
	public void init(ServletConfig config) throws ServletException {
	}

	public void destroy() {
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		if(uri.endsWith("viewinventory.click"))
		{
			
			RequestDispatcher rd=request.getRequestDispatcher("view/inventory/viewinventory.jsp");
			rd.forward(request, response);
		}
		if(uri.endsWith("getuserdetail.click"))
				{
			RequestDispatcher rd=request.getRequestDispatcher("view/transferissue/viewbranch.jsp");
			rd.forward(request, response);
				}
		if(uri.endsWith("getbranchview.click"))
				{
			String cid=request.getParameter("branch");
			System.out.println(cid+"cid");
			
			
			request.setAttribute("cid", cid);
			
			RequestDispatcher rd=request.getRequestDispatcher("view/inventory/branchinventories.jsp");
			rd.forward(request, response);
				}
		if(uri.endsWith("transferhistory.click"))
		{
			TransferDao t=new TransferDaoImpl();
			ResultSet transferhistory=t.transferhistorydao(request, response);
			request.setAttribute("transferhistory", transferhistory);
			RequestDispatcher rd=request.getRequestDispatcher("view/transferissue/transferhistory.jsp");
			rd.forward(request, response);
		}
		if(uri.endsWith("issuehistory.click"))
		{
			TransferDao t=new TransferDaoImpl();
			ResultSet issuehistory=t.issuehistorydao(request, response);
			request.setAttribute("issuehistory", issuehistory);
			RequestDispatcher rd=request.getRequestDispatcher("view/transferissue/issuehistory.jsp");
			rd.forward(request, response);
		}
		if(uri.endsWith("items.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/inventory/branchselect.jsp");
			rd.forward(request, response);
			
		}
		else if(uri.endsWith("addinventory.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/inventory/addinventory.jsp");
			rd.forward(request, response);
		}
				
		else if(uri.endsWith("editinventory.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/inventory/editinventory.jsp");
			rd.forward(request, response);
		}
		else if(uri.endsWith("viewinventoryitem.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/inventory/viewinventoryitem.jsp");
			rd.forward(request, response);
		}
		else if(uri.endsWith("initialdetails.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/initialdetails/initialdetails.jsp");
			rd.forward(request, response);
		}
		
		else if(uri.endsWith("userrolemanagement.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/usersettings/userrolemgmt.jsp");
			rd.forward(request, response);
		}
		else if(uri.endsWith("edituser.click"))
		{
			UserAction action=new UserAction();
			action.edituser(request, response);
			
		}
		else if(uri.endsWith("deleteuser.click"))
		{
			UserAction action=new UserAction();
			action.deleteuser(request, response);
			
		}
		else if(uri.endsWith("transferitem.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/transferissue/transferitem.jsp");
			rd.forward(request, response);
		}
		else if(uri.endsWith("issueitem.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/transferissue/issueitem.jsp");
			rd.forward(request, response);
		}
		else if(uri.endsWith("issueconfirmation.click"))
		{
			TransferAction t=new TransferAction();
			ResultSet issueditemdetails=t.issueditemsdetails(request, response);
			request.setAttribute("issueditemdetails", issueditemdetails);
			RequestDispatcher rd=request.getRequestDispatcher("view/transferissue/issueconfirmation.jsp");
			rd.forward(request, response);
		}
		else if(uri.endsWith("pendingtransfers.click"))
		{
			TransferAction t=new TransferAction();
			ResultSet transferdetails=t.transferitemsdetails(request, response);
			request.setAttribute("transferdetails", transferdetails);
			RequestDispatcher rd=request.getRequestDispatcher("view/transferissue/pendingtransfer.jsp");
			rd.forward(request, response);
		}
		else if(uri.endsWith("uploadbill.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/bill/uploadbill.jsp");
			rd.forward(request, response);
		}
		else if(uri.endsWith("viewbill.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/bill/viewbill.jsp");
			rd.forward(request, response);
		}	
		else if(uri.endsWith("downloadbill.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/bill/downloadbill.jsp");
			rd.forward(request, response);
		}
		else if(uri.endsWith("editbill.click"))
		{
			OtherAction o=new OtherAction();
			o.getbilldetail(request,response);
			RequestDispatcher rd=request.getRequestDispatcher("view/bill/editbill.jsp");
			rd.forward(request, response);
		}
		else if(uri.endsWith("issuedetail.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/transferissue/issuedetails.jsp");
			rd.forward(request, response);
		}
		
		else if(uri.endsWith("changeusernamepassword.click"))
		{
			HttpSession session=request.getSession();
			UserModel userdetail=(UserModel)session.getAttribute("userDetail");
			String username="";
			String password="";
			username=userdetail.getUsername();
			System.out.println(username+" is your username");
			 password=userdetail.getPassword();
			request.setAttribute("username", username);
			request.setAttribute("password", password);
			RequestDispatcher rd=request.getRequestDispatcher("view/UserSetting/changeusernamepassword.jsp");
			rd.forward(request, response);
		}
		
		else if(uri.endsWith("logindetails.click"))
		{
			UserDao userhistory=new UserDaoImpl();
			List<History> hist=userhistory.viewhistory(request,response);
			
			request.setAttribute("list", hist);
			RequestDispatcher rd=request.getRequestDispatcher("view/UserSetting/logindetails.jsp");
			rd.forward(request, response);
		}
		
		else if(uri.endsWith("viewuserdetail.click"))
				{
			
			
				}
	
		else if(uri.endsWith("getStaffName.click"))
		{
			PrintWriter out=response.getWriter();
			String staffid=request.getParameter("staffid");
			
			UserDao udao=new UserDaoImpl();
			String staffName=udao.getStaffName(staffid);
			System.out.println(staffName);
			out.println(staffName);
		}
		
		else if(uri.endsWith("staffItemDetails.click"))
	{
			RequestDispatcher rd=request.getRequestDispatcher("view/transferissue/staffItemsDetail.jsp");
			rd.forward(request, response);
	}
		
		else if(uri.endsWith("showStaffItemDetails.click"))
		{
			String staffCode=request.getParameter("staffCode");
			
			UserDao udao=new UserDaoImpl();
			List<IssueModel> list=udao.showStaffItems(staffCode);
			
			if(list!=null)
			{
				request.setAttribute("staffCode", staffCode);
				request.setAttribute("list", list);
				RequestDispatcher rd=request.getRequestDispatcher("view/transferissue/showStaffItemDetail.jsp");
				rd.forward(request, response);
			}
			else
			{
				request.setAttribute("staffCode", staffCode);
				RequestDispatcher rd=request.getRequestDispatcher("view/transferissue/showStaffItemDetail.jsp");
				rd.forward(request, response);
				
			}
		}
		else if(uri.endsWith("viewDep.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/Depreciation/viewDep.jsp");
			rd.forward(request, response);
		}
		else if(uri.endsWith("editDepreciation.click"))
		{
			request.setAttribute("id", request.getParameter("id"));
			request.setAttribute("itemcode", request.getParameter("itemcode"));
			request.setAttribute("lastyrdep", request.getParameter("lastyrdep"));
			RequestDispatcher rd=request.getRequestDispatcher("view/Depreciation/edit.jsp");
			rd.forward(request, response);
		}
		else if(uri.endsWith("depcalculation.click"))
		{
			DepreciationCalculator d=new DepreciationCalculator();
			InventoryDao idao = new InventoryDaoImpl();
			
			HttpSession session=request.getSession();
			String currentBranchcode=(String)session.getAttribute("currentBranchcode");
			String lastdate=idao.getGeneralSettings();
			
			
			List<String> itemlist=idao.getallItemcodes(currentBranchcode);
			DepreciationModel dm=null;
			List<DepreciationModel> depitemlist=new ArrayList<DepreciationModel>();
			DecimalFormat decimal=new DecimalFormat("##.00");
			for(String itemcode: itemlist){
				dm=new DepreciationModel();
				//inside for
				try{
				ResultSet rs = idao.getinventoryfordep(itemcode);
				String purchasedateen=rs.getString("purchasedateen");
				String depreciationrate=rs.getString("depreciationrate");
				String rate=rs.getString("rate");
				double depreciationamt=d.DepCalc(itemcode, lastdate, purchasedateen, depreciationrate, rate);
				dm.setItemcode(itemcode);
				dm.setFiscaldate(lastdate);
				dm.setPurchasedateen(purchasedateen);
				dm.setDepreciationrate(depreciationrate);
				dm.setRate(rate);
				dm.setThisyrdepamt(decimal.format(depreciationamt));
				
				depitemlist.add(dm);
				}
				catch(Exception e){
					System.out.println(e);
				}
				
			}
			
			request.setAttribute("depreciation", depitemlist);
			RequestDispatcher rd=request.getRequestDispatcher("view/Depreciation/calculatedDepreciation.jsp");
			rd.forward(request, response);
			
			
		}
		
	}

}
