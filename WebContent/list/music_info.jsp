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


String mno = request.getParameter("mno");
System.out.print(mno);

PlayerDTO playDTO =  new PlayerDTO();
PlayerVO  playVO  = playDTO.getMusic(mno);         			
	
String title  = playVO.getTitle();
String singer = playVO.getSinger();
String album  = playVO.getAlbum();
String ptime  = playVO.getPtime(); 
String genre  = playVO.getGenre();
String redate = playVO.getRedate();
String img    = playVO.getImg_url();
%>

<div class="modal_content" id="modal_content" title="클릭하면 창이 닫힙니다.">
	<div class="close" onclick="javascript:ModalClose();">&times;</div><!-- &times;은 X라는 표시 글자를 엔티티숫자로 표시한것이다. -->
	<div class="modal_title"><h1>곡 정보</h1></div>
	<div class="music-info">
		<ul class="music-info-img">
			<li><img src="<%=img %>"
			 alt="<%=img %>"> 
			</li>
		</ul>
		<ul class="music-info0">
			<li class="music-info1">제목</li>
			<li class="music-info2"><%=title %></li>
		</ul>
		<ul class="music-info0">
			<li class="music-info1">가수</li>
			<li class="music-info2"><%= singer %></li>
		</ul>
		<ul class="music-info0">
			<li class="music-info1">앨범</li>
			<li class="music-info2"><%= album %></li>
		</ul>
		<ul class="music-info0">
			<li class="music-info1">장르</li>
			<li class="music-info2"><%= genre %></li>
		</ul>
		<ul class="music-info0">
			<li class="music-info1">발매일</li>
			<li class="music-info2"><%= redate %></li>
		</ul>
		<br>		
	</div>
</div>
