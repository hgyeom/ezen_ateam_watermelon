/*-=============================================================================================================================
占쌜쇽옙占쏙옙 : 占쎈동占쏙옙
占쌜쇽옙占쏙옙 : 2021-09-13
		1. 회占쏙옙占쏙옙占쏙옙HTML占쌜쇽옙    				2021.09.13
		2. 占쌍쇽옙처占쏙옙						2021.09.16
=============================================================================================================================*/
package DTO;

import java.sql.*;

public class CommonDTO 
{
	public String mHost     = "127.0.0.1:3306/watermelon";			//DBBASE占싱몌옙 占쏙옙占쏙옙占� 占쏙옙占쏙옙占쏙옙占쌍깍옙!
	public String mUserId   = "아이디";									//mysql 占쏙옙占싱듸옙
	public String mPassword = "비밀번호";									//mysql 占쏙옙橘占싫�
	
	public Connection mConnection;
	public ResultSet  rs;
	
	/*-===================//Driver Load=============================================*/
	public boolean LoadDriver()
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			return true;
		}catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}
	
	
	/*======================//DB Open==========================================*/
	public boolean OpenDB()
	{
		if(LoadDriver() == false)
		{
			return false;
		}
		
		String mServer = "jdbc:mysql://" + mHost + "?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
		
		try
		{
			this.mConnection = 
					DriverManager.getConnection(mServer,mUserId,mPassword);
			return true;
		}catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}
	
	
	/*======================//DB Close=============================================*/
	public void CloseDB()
	{
		try
		{
			this.mConnection.close();
		}catch(Exception e)
		{
			
		}
	}	
	
	
	/*===================// Query 占쏙옙占쏙옙=============================================*/
	public boolean RunSQL(String sql) 									//占쏙옙占쏙옙占쏙옙 : insert, update, delete 	 占쌨소듸옙 :	executeUpdate() 占쏙옙환占쏙옙 : 처占쏙옙占쏙옙 占쏙옙占쌘듸옙(row)占쏙옙 占쏙옙占쏙옙
	{
		try
		{
			System.out.println("CommonDTO_SQL_RunSQL異쒕젰 �솗�씤: " + sql);
			Statement stmt = mConnection.createStatement();
			stmt.executeUpdate(sql);
			return true;
		}catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}	
	
	/*====================//RunQuery=============================================*/
	public boolean RunQuery(String sql)									//占쏙옙占쏙옙占쏙옙 : select    占쌨소듸옙 : executeQuery()   占쏙옙환占쏙옙 : ResultSet
	{								
		try
		{
			//System.out.println("CommonDTO_SQL_RunQuery異쒕젰 �솗�씤: " + sql);
			Statement stmt = mConnection.createStatement();
			rs = stmt.executeQuery(sql);			
			return true;
		}catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}
	
	
	/*===================GetNextResult()占쏙옙占쏙옙=============================================*/
	public boolean GetNextResult()										//rs.next()占쏙옙占�
	{
		try
		{
			return rs.next();
		}catch(Exception e)
		{
			return false;
		}
	}	
	
	
	/*====================//GetValue() 占쏙옙占쏙옙=============================================*/
	public String GetValue(String name)									//getString 占쏙옙占� 占쏙옙占쌘울옙占쏙옙 占쏙옙쨈占�.
	{																	//GetNextResult()占쏙옙 占쌀띰옙占쏙옙 占쏙옙占쏙옙.
		try		
		{
			return rs.getString(name);
		}catch(Exception e)
		{
			return "";
		}
	}
	
	
	/*====================//GetInt() 占쏙옙占쏙옙==============================================*/
	public int GetInt(String name)										//getInt 占쏙옙占�  占쏙옙占쌘몌옙 占쏙옙쨈占�.	
	{																	//GetNextResult()占쏙옙 占쌀띰옙占쏙옙 占쏙옙占쏙옙
		try
		{
			return rs.getInt(name);
		}catch(Exception e)
		{
			return 0;
		}
	}	
	
	
	/*===================//CloseQuery() ============================================*/
	public void CloseQuery() 
	{
		try
		{
			rs.close();
		}catch(Exception e)
		{
		}
	}	
	
	/*===================//占쏙옙占시뤄옙占싱쏙옙=============================================*/
	public String _R(String value)
	{
		return value.replace("'","''");
	}
}