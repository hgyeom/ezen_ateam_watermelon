package Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import VO.*;

@WebServlet("/idCheckServlet")

public class idCheckServlet extends HttpServlet{
	
     protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
     {
    	 LoginVO vo = new LoginVO();
    	 
    	 
    	 String mHost     = "jdbc:mysql://192.168.0.70:3306/watermelon?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";		//DBBASE이름 변경시 변경해주기!
 		 String mUserId   = "root";																											//mysql 아이디
 		 String mPassword = "ezen";																											//mysql 비밀번호
 		 
 		 String sql = "";
 		 
 		 Statement stmt;
 		 Connection mConnection;
 		 ResultSet rs;
    	 
         String userid = request.getParameter("id");
         //System.out.print("idServlet.JAVA userid 출력확인 : "+userid);
         
         vo.setUserid(userid);
          
         try
         {	
			Class.forName("com.mysql.cj.jdbc.Driver");
			mConnection =
				
				DriverManager.getConnection(mHost,mUserId,mPassword);						
				//userid 조회
				//select문 실행
				sql   = "select userid from userinfo where userid='" + vo.getUserid() + "'" ;
				//select문 종료
				
				stmt  = mConnection.createStatement();
				
				rs    = stmt.executeQuery(sql);
				//값이 있는지 조회 
				if (rs.next() == true)
				{
					String useridchek   = rs.getString(userid);
					vo.setUserid(useridchek);
					rs.close();
					mConnection.close();
					return;
				}else 
				{
					PrintWriter out = response.getWriter();
		         	out.print("success");						//중복아이디가 없을 경우 success 값 리턴
				}

				rs.close();
				mConnection.close();
			}catch(Exception e)
			{
				PrintWriter out = response.getWriter();
				out.print("fail");								
				e.printStackTrace();
			}
         	
          
     }
}