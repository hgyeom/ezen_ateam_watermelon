<!--=============================================================================================================================
작성자 : 김무겸
작성일 : 2021-09-16
		1. 로그아웃 페이지 구현			2021.09.16
=============================================================================================================================-->

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="VO.*" %>
<%@ page import="DTO.*" %>
<%

LoginVO login   = (LoginVO)session.getAttribute("login");	//세션 불러오기
session.setAttribute("login",null);							//login null 지정

%>
<script>
window.onload = function()
{
	//top = iframe 상위 html
	top.location = "../main/main.jsp"; 		//main.jsp로 top.location
}
</script>