package DTO;

import java.sql.*;
import VO.*;



public class MypageDTO extends CommonDTO
{
	
	public boolean MyUpdate(JoinVO vo)
	{
		try
		{
			//DB LOAD
			this.LoadDriver();
			
			//DB open
			this.OpenDB();
			
			
			//Statement stmt = null;			
			String sql = "";	
			
			//비밀번호를 업데이트한다.
			sql  = "update userinfo ";
			sql += "set userpw = md5('" + vo.getUserpw() + "') ";
			sql += "where uno = '" + vo.getUno() + "' ";
			
			//Query 실행
			this.RunSQL(sql);
			
			//System.out.println("Mypage__CommonDTO_SQL_RunSQL출력확인용 : " + sql);
			//DB close
			this.CloseDB();
			
		}catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}			
		return true;
	}
}
