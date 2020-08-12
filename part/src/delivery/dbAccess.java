package  delivery;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class dbAccess {

	public static  Connection  InitializeDatabase() throws  ClassNotFoundException, SQLException{
		Connection  conn;
		
		String  username="root";
		String  password="root";
		
	//conn=DriverManager.getConnection("jdbc:mysql://localhost/delivery",username,password);
		 //conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_pkyoedb","teamrame_pkyoe","arkar");
		conn=DriverManager.getConnection("jdbc:mysql://mysql3000.mochahost.com/teamrame_delivery?useTimezone=true&serverTimezone=UTC","teamrame_yhk2","J@v@1234");
		
		
		
		
		
		return conn;
	
	}
	}