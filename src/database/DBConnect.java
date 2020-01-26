package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnect {
	  private final String DBDRIVER = "org.postgresql.Driver" ;   
	    private final String DBURL = "jdbc:postgresql://localhost:5432/postgres" ;   
	    private final String DBUSER = "postgres" ;   
	    private final String DBPASSWORD = "000625" ;   
	    private Connection conn = null ; 
	    
	    public DBConnect()   {   
	        try{   
	            Class.forName(DBDRIVER) ;   
	            this.conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;  
	         //   System.out.println("Database connected."); 
	        }catch (Exception e){ 
	        	System.out.println("Fail connection:"+e.getMessage()); 
	        	e.printStackTrace();
	        	}   
	    }
	    public Connection getConnection(){   
	        return this.conn ;   
	    }   
	  
	  
	    public void close(){   
	        try{   
	            this.conn.close() ; 
	       //     System.out.println("Connection closed.");
	        }catch (Exception e){ }          
	    }
	    
//	    public static void main(String[] args) throws SQLException{
//	    	DBConnect db = new DBConnect();
//	    	Statement stmt = db.getConnection().createStatement();
//			ResultSet rs = stmt.executeQuery("select * from employee");
//			while(rs.next()){
//				int ssn = rs.getInt("ssn");
//				String fname = rs.getString("fname");
//				int salary = rs.getInt("salary");
//
//				System.out.println("SSN = "+ ssn);
//				System.out.println("FNAME = "+ fname);
//				System.out.println("SALARY = "+ salary);
//				System.out.println();
//			}
//	    }
}
