package com.adbl.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.adbl.action.OtherAction;

/**
 * Servlet implementation class AddController
 */
@WebServlet("/FileUploadController")
	
public class FileUploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public FileUploadController() {
	}

	public void init(ServletConfig config) throws ServletException {
	}

	public void destroy() {
	}

	@SuppressWarnings("unchecked")
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String File_Directory = "E:/spring project/JobPortal/WebContent/cv";
		// this map stores the data except the file
		Map<String,String> formMap = new HashMap<String,String>();
		if (ServletFileUpload.isMultipartContent(request)) {
			DiskFileItemFactory factory = new DiskFileItemFactory();// this
			ServletFileUpload upload = new ServletFileUpload(factory);
			try {
				List<FileItem> multiparts = upload.parseRequest(request);
				
				// use for each to iterate the list
				for (FileItem fileItem : multiparts) {
					// check if the fileitem is not a form field
					if (!fileItem.isFormField()) {

						String fileName = new File(fileItem.getName())
								.getName();
						formMap.put(fileItem.getFieldName(), fileName);// adding
						try {
							fileItem.write(new File(File_Directory
									+ File.separator + fileName));
						} catch (Exception e) {
							e.printStackTrace();
						}

					}
				}
				OtherAction fua = new OtherAction();
				fua.saveFileData(request, response, formMap);
			} catch (FileUploadException e) {
				e.printStackTrace();
			}

		}

	}

}
