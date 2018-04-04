package com.org.dbconnection;

import java.sql.DriverManager;

import com.mysql.jdbc.Connection;

public class DBConnection {
	private static Connection con=null;
    static{//instantiation block-called before constructor static-once work is done remains constant
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public static Connection getConnection(){
        try{
            con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/adblheadofficedb","root","123456");//javproject name of database
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
    public static Connection getConnectionNext(String branchdb){
        try{
            con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/"+branchdb+"","root","123456");//javproject name of database
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
}
