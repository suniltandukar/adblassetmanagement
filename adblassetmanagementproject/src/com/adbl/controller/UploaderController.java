package com.adbl.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.*;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.*;

import com.adbl.action.OtherAction;
import com.adbl.model.Bill;

/**
 * Servlet implementation class UploaderController
 */
@WebServlet("/UploaderController")
public class UploaderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String UPLOAD_DIRECTORY = "C:/Users/sunil/git/adblassetmanagementproject/adblassetmanagementproject/WebContent/view/uploadedbills";
	//private final String UPLOAD_DIRECTORY = "C:/xampp/tomcat/webapps/adblassetbillimages/billimages";
	Map<String,String> formMap = new HashMap<String,String>();
	
	
    public UploaderController() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
	}

	public void destroy() {
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
		MultipartRequest req = new MultipartRequest(request, UPLOAD_DIRECTORY, 1024 * 1024 * 1024);
	      String billno=req.getParameter("billno");
	      String companyid=req.getParameter("companyid");
	      String billdate=req.getParameter("billdate");
	      String billdateen=req.getParameter("billdateen");
	      String branchdb=req.getParameter("branchdb");
	      
	     String[] billdateString=billdate.split("-");
	     String[] billdateenString=billdateen.split("-");
	     String billdateyear=billdateString[0];
	     String billdateenyear=billdateenString[0];
	     String billimagegeneratedname=billdateyear+billno+billdateenyear;
	     
	  	
	      Bill bill=new Bill();
		bill.setBilldate(billdate);
		bill.setBilldateen(billdateen);
		bill.setBillno(billno);
		bill.setBranchdb(branchdb);
		bill.setCompanyid(companyid);
		bill.setBillimagepath(UPLOAD_DIRECTORY);
		bill.setBillimagegeneratedname(billimagegeneratedname);
		   
try{	   
	    Enumeration files = req.getFileNames();
	    while (files.hasMoreElements()) {
	        String name = (String) files.nextElement();
	        String filename = req.getFilesystemName(name);
	        System.out.println(filename);
	        bill.setBillimagename(filename);
	        String type = req.getContentType(name);
	        System.out.println(type);
	      
	        File uploadedFile = req.getFile(name);
	        System.out.println(uploadedFile);
	    	
	        FileInputStream fis = new FileInputStream(uploadedFile);
	        BufferedReader in = new BufferedReader(new InputStreamReader(fis));

	        FileWriter fstream = new FileWriter(UPLOAD_DIRECTORY + name, true);
	        BufferedWriter out11 = new BufferedWriter(fstream);

	        String aLine = null;
	        while ((aLine = in.readLine()) != null) {
	            //Process each line and add output to Dest.txt file
	            out11.write(aLine);
	            out11.newLine();
	        }
	        in.close();
	        out11.close();
               }    
	    OtherAction action = new OtherAction();
		action.saveFileData(request, response,bill);
            } catch (Exception ex) {
               request.setAttribute("message", "File Upload Failed due to " + ex);
            }          
         
        }
    
      
     
    }		
	


