<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="VO.*" %>
<%@ page import="DTO.*" %>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.sql.*"%>
<%
LoginVO login   = (LoginVO)session.getAttribute("login");
if(login == null)
{
	response.sendRedirect("../main/main.jsp");
}


int uno = Integer.parseInt(request.getParameter("uno"));

PlaylistDTO dto = new PlaylistDTO();


if(dto.CountPlaylist(uno) < 5)
{
	
	dto.MakePlaylist(uno);
}
%>
