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


int uno  = Integer.parseInt(request.getParameter("uno"));
int mno  = Integer.parseInt(request.getParameter("mno")); 
int pno  = Integer.parseInt(request.getParameter("pno"));

PlaylistDTO dto = new PlaylistDTO();
System.out.println("==========================");
System.out.println("uno ㅁㄴㅇㅁㄴㅇ : " + uno);
System.out.println("==========================");
System.out.println("mno ㅁㄴㅇㅁㄴㅇ : " + mno);
System.out.println("==========================");
System.out.println("pno ㅁㄴㅇㅁㄴㅇ : " + pno);
System.out.println("==========================");
/* dto.AddPlaylistMusic(1, 5713422, 741); */
dto.AddPlaylistMusic(uno, mno, pno);
%>