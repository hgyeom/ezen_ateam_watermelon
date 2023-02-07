<!--=============================================================================================================================
작성자 : 노동혁
작성일 : 2021-09-13
		1. 로그인회원가입HTML작성    				2021.09.13
		2. 주석처리							2021.09.16
		3. 로그인 완료후 로딩이미지 만들기 -두성수 		2021.09.29
================================================================================================================================-->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script src="../js/login.js"></script>

<form id="loginform" name="loginform" method="post" action="">
	<div class="modal_content" id="modal_content" title="">
		<!-- ModalClose()는 join.js에 작성  X표시를 누르면 닫히는 이벤트 --><!-- &times;은 X라는 표시 글자라를 엔티티숫자로 표시한것이다. -->
		<!-- <div class="close" onclick="javascript:Close();">&times;</div> -->
		<div class="modal_title"><h1>로&nbsp;그&nbsp;인</h1></div>
		<br>
		<div>
			<div><input type="text" id="userid" name="userid" placeholder="아이디 입력" size=10 maxlength=10 value="" onkeyup="changerloginid()"></div>
			<!-- 유저아이디 불입력시 alert div -->
			<div class="alert_userid"></div>
			<div><input type="password" id="userpw" name="userpw" placeholder="비밀번호 입력" size=10 maxlength=20 value="" onkeyup="changerloginpw()"></div>
			<!-- 비밀번호 불입력시 alert div -->
			<div class="alert_userpw"></div>
			<br>
			<input type="button" value="로그인" class="Modal_Login_btn" id="Modal_Login_btn" onclick="javascript:LoginOk();"></div>	<!-- LoginOk()는 AXAX를 이용해 로그인페이지에서 입력한 데이터들을 메인페이지로 값을 전달 이벤트 -->
			<div id="loding" style="display: none;"><img src="../img/loading.gif" width="50px" height="50px"></div>						<!--  -->
			<br>
			<br>
			<div id="Modal_Join_btn">계정이 없으신가요?&emsp;<a href="javascript:GetModalPage('../join/join.jsp');">가입하기</a></div>		<!--GetModalPage는  AJAX를 이용해 모달간 이동 메소드 -->			
		</div>
	</div>
</form>