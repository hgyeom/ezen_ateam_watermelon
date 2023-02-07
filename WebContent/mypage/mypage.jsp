<!-- =================================================================================================================
작성자 : 노동혁
작성일 : 2021-09-14
		1. 최초작성    			2021.09.14
				 
=================================================================================================================-->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="VO.*" %>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.sql.*"%>
<%

LoginVO login   = (LoginVO)session.getAttribute("login");
//System.out.println("mypage.jsp새션유지 확인:"+ login);

%>
	<div class="modal_content" id="modal_content" title="클릭하면 창이 닫힙니다.">
		<div class="close" onclick="javascript:ModalClose();">&times;</div><!-- &times;은 X라는 표시 글자를 엔티티숫자로 표시한것이다. -->
		<div class="modal_title"><h1>마이페이지</h1></div>
		<br>
		<div class="mypage-info">
			<ul class="myinfo0">
				<li class="myinfo1">아이디</li>
				<li class="myinfo2"><%= login.getUserid() %></li>
			</ul>
			<ul class="myinfo0">
				<li class="myinfo1">이름</li>
				<li class="myinfo2"><%= login.getName() %></li>
			</ul>
			<ul class="myinfo0">
				<li class="myinfo1">성별</li>
				<li class="myinfo2"><%= login.getGender() %></li>
			</ul>
			<ul class="myinfo0">
				<li class="myinfo1">생년월일</li>
				<li class="myinfo2"><%= login.getBir() %></li>
			</ul>
			<ul class="myinfo0">
				<li class="myinfo1">이메일</li>
				<li class="myinfo2"><%= login.getE_id() %></li>
			</ul>
			<br>
			<div>비밀번호를 변경하시겠습니까?<br><a href="javascript:GetModalPage('../mypage/mymodi.jsp');"><br>비밀번호변경</a></div>		
		</div>
	</div>
