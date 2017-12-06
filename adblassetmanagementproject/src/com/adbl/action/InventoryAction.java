package com.adbl.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.security.auth.Subject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.adbl.dao.InventoryDao;
import com.adbl.daoimpl.InventoryDaoImpl;
import com.adbl.model.Inventory;

public class InventoryAction {
	
	public Inventory addinventory(HttpServletRequest request, HttpServletResponse response) {
		boolean status=false;
		String legacyid=request.getParameter("legacyid");
		String groupcode=request.getParameter("groupcode");
		String itemname=request.getParameter("itemname");
		String transactionid=request.getParameter("transactionid");
		String model=request.getParameter("model");
		String decisiondate=request.getParameter("decisiondate");
		String decisiondateen=request.getParameter("decisiondateen");
		String purchasedate=request.getParameter("purchasedate");
		String purchasedateen=request.getParameter("purchasedateen");
		String depreciationrate=request.getParameter("depreciationrate");
		String supplierid=request.getParameter("supplierid");
		String fundsource=request.getParameter("fundsource");
		String unitname=request.getParameter("unitname");
		String itemsize=request.getParameter("itemsize");
		String rate=request.getParameter("rate");
		String quantity=request.getParameter("quantity");
		String amount=request.getParameter("amount");
		String amcstart=request.getParameter("amcstart");
		String amcstarten=request.getParameter("amcstarten");
		String amcend=request.getParameter("amcend");
		String amcenden=request.getParameter("amcenden");
		String amccost=request.getParameter("amccost");
		String amccompanyid=request.getParameter("amccompanyid");
		String insurancestart=request.getParameter("insurancestart");
		String insurancestarten=request.getParameter("insurancestarten");
		String insuranceend=request.getParameter("insuranceend");
		String insuranceenden=request.getParameter("insuranceenden");
		String insurancepremuimamount=request.getParameter("insurancepremuimamount");
		String insurancecompanyid=request.getParameter("insurancecompanyid");
		String vehicleno=request.getParameter("vehicleno");
		String chesisno=request.getParameter("chesisno");
		String engineno=request.getParameter("engineno");
		String warrantyid=request.getParameter("warrantyid");
		String warrantystart=request.getParameter("warrantystart");
		String warrantystarten=request.getParameter("warrantystarten");
		String warrantyend=request.getParameter("warrantyend");
		String warrantyenden=request.getParameter("warrantyenden");
		String itemconditionid=request.getParameter("itemconditionid");
		String macaddress=request.getParameter("macaddress");
		String licenseno=request.getParameter("licenseno");
		String itemcode=request.getParameter("itemcode");
		String yeartxn=request.getParameter("year");
		
		
		Inventory inventory=new Inventory();
		inventory.setAmccompanyid(amccompanyid);
		inventory.setAmccost(amccost);
		inventory.setAmcend(amcend);
		inventory.setAmcenden(amcenden);
		inventory.setAmcstart(amcstarten);
		inventory.setAmcstarten(amcstarten);
		inventory.setAmount(insurancepremuimamount);
		inventory.setChesisno(chesisno);
		inventory.setDecisiondateen(decisiondateen);
		inventory.setDecisiondate(decisiondate);
		inventory.setDepreciationrate(depreciationrate);
		inventory.setEngineno(engineno);
		inventory.setFundsource(fundsource);
		inventory.setGroupcode(groupcode);
		inventory.setInsurancecompanyid(insurancecompanyid);
		inventory.setInsuranceend(insuranceenden);
		inventory.setInsuranceenden(insuranceenden);
		inventory.setInsurancepremuimamount(insurancepremuimamount);
		inventory.setInsurancestart(insurancestarten);
		inventory.setInsurancestarten(insurancestarten);
		inventory.setItemname(itemname);
		inventory.setItemsize(itemsize);
		inventory.setLegacyid(legacyid);
		inventory.setModel(model);
		inventory.setPurchasedate(purchasedate);
		inventory.setPurchasedateen(purchasedateen);
		inventory.setQuantity(quantity);
		inventory.setRate(rate);
		inventory.setSupplierid(supplierid);
		inventory.setTransactionid(transactionid);
		inventory.setUnitname(unitname);
		inventory.setVehicleno(vehicleno);
		inventory.setWarrantyid(warrantyid);
		inventory.setWarrantyend(warrantyenden);
		inventory.setWarrantyenden(warrantyenden);
		inventory.setWarrantystart(warrantystarten);
		inventory.setWarrantystarten(warrantystarten);
		inventory.setItemconditionid(itemconditionid);
		inventory.setMacaddress(macaddress);
		inventory.setLicenseno(licenseno);
		//inventory.setItemcode(itemcode);
		
		String branchdb=request.getParameter("branchdb");
		DateFormat dateformat=new SimpleDateFormat("YYYY");
		Date date=new Date();
		
		
		String[] year=purchasedateen.split("-");
		Generator g=new Generator(branchdb);
		String branchcode="001";
		
		
		String transaction_id=g.transactionidgenerator(branchcode,dateformat.format(date));
		inventory.setGenerated_transactionid(transaction_id);
		String value=null;
		if(inventory.getAmccompanyid().equals("")){
			inventory.setAmccompanyid(value);
		}
		if(inventory.getInsurancecompanyid().equals("")){
			inventory.setInsurancecompanyid(value);
		}
		if(inventory.getFundsource().equals("")){
			inventory.setFundsource(value);
		}
		if(inventory.getSupplierid().equals("")){
			inventory.setSupplierid(value);
		}
		if(inventory.getItemconditionid().equals("")){
			inventory.setItemconditionid(value);
		}
		InventoryDao idao=new InventoryDaoImpl(branchdb);
		try {
			List list=new ArrayList<>();
			for(int i=1;i<=Integer.parseInt(quantity);i++){
				String item_code=g.itemcodegenerator(groupcode, year[0]);
				
				list.add(item_code);
				System.out.println(list);
				inventory.setGenerated_itemcode(list);
				idao.addalldao(inventory);
				String[] ids=idao.selectids();
				idao.additionaldetaildao(inventory,ids);
				String additionaldetailid=idao.selectadditionaldetailid();
				status=idao.inventorydao(inventory,additionaldetailid, item_code,transaction_id);
				}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return inventory;
	}

	public void deleteinventory(HttpServletRequest request, HttpServletResponse response) {
		
		
		String itemcode=request.getParameter("itemcode");
		String inventoryotherdetailid=request.getParameter("inventoryotherdetailid");
		String amcid=request.getParameter("acmid");
		String insuranceid=request.getParameter("insuranceid");
		String warrantyid=request.getParameter("warrantyid");
		String branchdb=request.getParameter("branchdb");
		
		
		InventoryDao idao=new InventoryDaoImpl(branchdb);
		boolean status=idao.deleteinventorydao(itemcode,inventoryotherdetailid,amcid,insuranceid,warrantyid);
		if(status)
		{
			request.setAttribute("msg", "File Deleted Successfully");
			request.setAttribute("action", "delete");
			RequestDispatcher rd=request.getRequestDispatcher("view/inventory/viewinventory.jsp");
			try {
				rd.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
		
	}
	public boolean issueconfirmation(HttpServletRequest request, HttpServletResponse response){
		HttpSession session=request.getSession();
		ResultSet userdetail=(ResultSet)session.getAttribute("userdetail");
		
		String branchdb="";
		try {
			branchdb = userdetail.getString("branchdb");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String issueid=request.getParameter("issueid");
		String statusid=request.getParameter("id");
		
		InventoryDao i=new InventoryDaoImpl(branchdb);
		Boolean status=i.issueconfirmation(issueid,statusid);
		return status;
		
	}

}
