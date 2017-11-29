package com.adbl.action;

import java.io.File;
import java.util.Date;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {
    
    //implement the rename(File f) method to satisfy the 
    // FileRenamePolicy interface contract
    public File rename(File f){
    
        //Get the parent directory path as in h:/home/user or /home/user
        String parentDir = f.getParent( );
      
        //Get filename without its path location, such as 'index.txt'
        String fname = f.getName( );
        System.out.println("filename="+fname);
        
      
        //Get the extension if the file has one
        String fileExt = "";
        int i = -1;
        if(( i = fname.indexOf(".")) != -1){
      
            fileExt = fname.substring(i);
            fname = fname.substring(0,i);
        }
      
        //add the timestamp
        fname = 20120202 + "1000";
      
        //piece together the filename
        fname = parentDir + System.getProperty(
            "file.separator") + fname + fileExt;
      
        File temp = new File(fname);
 
        System.out.println("temp"+temp);
         return temp;
    }

}