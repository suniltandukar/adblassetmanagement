package com.adbl.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.adbl.dao.InventoryDao;
import com.adbl.dao.UserDao;
import com.adbl.daoimpl.InventoryDaoImpl;
import com.adbl.daoimpl.UserDaoImpl;
import com.adbl.model.Inventory;
import com.adbl.model.UserModel;

public class InventoryEditAction {
	
	public Inventory editinventory(HttpServletRequest request, HttpServletResponse response) {
		boolean status=false;
		String lastyrdep=request.getParameter("lastyrdep");
		
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
		String warrantystart=request.getParameter("warrantystart");
		String warrantystarten=request.getParameter("warrantystarten");
		String warrantyend=request.getParameter("warrantyend");
		String warrantyenden=request.getParameter("warrantyenden");
		String itemconditionid=request.getParameter("itemconditionid");
		String macaddress=request.getParameter("macaddress");
		String licenseno=request.getParameter("licenseno");
		String itemcode=request.getParameter("itemcode");
		String previousdate=request.getParameter("previousdate");
		String previousgroupcode=request.getParameter("previousgroupcode");
		String donationpercentage=request.getParameter("donationpercentage");
		
		String amcid=request.getParameter("amcid");
		String insuranceid=request.getParameter("insuranceid");
		String inventoryotherdetailid=request.getParameter("inventoryotherdetailid");
		String warrantyid=request.getParameter("warrantyid");
		String depeffectivedate=request.getParameter("depeffectivedate");
		String depeffectivedateen=request.getParameter("depeffectivedateen");
		
		Inventory inventory=new Inventory();
		inventory.setAmccompanyid(amccompanyid);
		inventory.setAmccost(amccost);
		inventory.setAmcend(amcend);
		inventory.setAmcenden(amcenden);
		inventory.setAmcstart(amcstart);
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
		inventory.setInsuranceend(insuranceend);
		inventory.setInsuranceenden(insuranceenden);
		inventory.setInsurancepremuimamount(insurancepremuimamount);
		inventory.setInsurancestart(insurancestart);
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
		inventory.setWarrantyend(warrantyend);
		inventory.setWarrantyenden(warrantyenden);
		inventory.setWarrantystart(warrantystart);
		inventory.setWarrantystarten(warrantystarten);
		inventory.setItemconditionid(itemconditionid);
		inventory.setMacaddress(macaddress);
		inventory.setLicenseno(licenseno);
		inventory.setItemcode(itemcode);
		inventory.setDonationpercentage(donationpercentage);
		inventory.setAmcid(amcid);
		inventory.setInsuranceid(insuranceid);
		inventory.setInventoryotherdetailid(inventoryotherdetailid);
		inventory.setWarrantyid(warrantyid);
		inventory.setLastyrdep(lastyrdep);
		inventory.setDepeffectivedate(depeffectivedate);
		inventory.setDepeffectivedateen(depeffectivedateen);
		
		
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
		InventoryDao idao=new InventoryDaoImpl();
		boolean stats=false;
		String updated_itemcode="";
		String[] year=purchasedateen.split("-");
		if(previousgroupcode.equals(groupcode) && previousdate.equals(year[0]))// need to be thought
		{
			inventory.setUpdated_itemcode(itemcode);
			stats=idao.editalldaocodechanged(inventory);
			
		}
		else{
			Generator g=new Generator();
			updated_itemcode=g.itemcodegenerator(groupcode, year[0]);
			inventory.setUpdated_itemcode(updated_itemcode);
			stats=idao.editalldaocodechanged(inventory);
		}
		
		if(stats)
		{
			String genitemcode=inventory.getUpdated_itemcode();
			boolean depstatus=idao.insertDep(inventory,genitemcode);
			System.out.println("depreciation insert status="+depstatus);
			UserDao userdao=new UserDaoImpl();
			HttpSession session=request.getSession();
			UserModel um=(UserModel) session.getAttribute("userDetail");
			String action="Inventory "+itemcode+ " Edited By "+um.getUsername();
			boolean sts=userdao.loghistorydao(um.getUsername(), action);
		return inventory;
		}
		return null;
	}

}



