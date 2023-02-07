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
int pno = Integer.parseInt(request.getParameter("pno"));

out.print(uno);
out.print("!!");
out.print(pno); 

PlaylistDTO dto = new PlaylistDTO();
dto.DeletePlaylist(uno, pno);

%>
<script>
document.location = "../main/main.jsp ";

</script> 
