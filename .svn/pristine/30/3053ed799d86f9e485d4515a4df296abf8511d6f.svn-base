<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="VO.*" %>
<%@ page import="DTO.*" %>
<%
LoginVO login = (LoginVO)session.getAttribute("login");

String uuno = login.getUno();

String arr = request.getParameter("arr");
//System.out.println("renameok arr : " + arr);

if(arr == null)									
{
	response.sendRedirect("../main/main.jsp");
	return;
}

String str = arr.replace("<!>",",");
String[] strArr = str.split(",");	

String pl_name = strArr[0];
String ppno = strArr[1];
if (pl_name == null || ppno == null) 
{
	out.print("휴효한 값이 지정되지 않았습니다.");
	response.sendRedirect("../main/index.jsp");			//main.jsp로 리다이렉트
	return;
}

int pno = Integer.parseInt(ppno);
int uno = Integer.parseInt(uuno);
System.out.println("renameok pl_name : " + pl_name);
System.out.println("renameok pno : " + pno);
System.out.println("renameok uno : " + uuno);

PlaylistDTO dto = new PlaylistDTO();
dto.RenamePlaylist(pno,uno,pl_name);


%>
<script>


</script>