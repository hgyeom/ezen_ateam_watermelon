<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="VO.*" %>
<%@ page import="DTO.*" %>
<% 
LoginVO login   = (LoginVO)session.getAttribute("login");
if(login == null)
{
	response.sendRedirect("../main/main.jsp");
}



String uno = request.getParameter("uno"); 
String mno = request.getParameter("mno"); 

/* System.out.println("ok123"+uno);
System.out.print("!!");
System.out.print(":::::::::::"+mno);  */
 
 
likelistDTO dto = new likelistDTO();

if(dto.Search(uno,mno)==true)
{
	dto.AddLikelist(uno,mno);
	out.print("ADD");
}else
{
	dto.DeleteLikelist(uno, mno);
	//out.print("DELETE");
}


%>