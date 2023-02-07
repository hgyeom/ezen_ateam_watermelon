<!--=============================================================================================================================
작성자 : 노동혁
작성일 : 2021-09-13
		1. 회원가입HTML작성    				2021.09.13
		2. 주석처리						2021.09.16
=============================================================================================================================-->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<script src="../js/join.js"></script>

<form id="loginform" name="loginform" method="post" action="">
	<div class="modal_content" id="modal_content" title="">
		<!-- ModalClose()는 join.js에 작성  X표시를 누르면 닫히는 이벤트 --><!-- &times;은 X라는 표시 글자라를 엔티티숫자로 표시한것이다. -->
		<!-- <div class="close"></div> -->
		<div class="modal_title"><h1 >회원가입 (1/2)</h1></div>
		<div>
			<div><input type="text" id="userid" name="userid" placeholder="아이디 입력" size=10 maxlength=10  onkeyup="idCheck()"></div>  <!-- idCheck()는  입력할때마다 아이디를 AJAX로 중복검사해주는 KEYUP이벤트 -->
			<!-- 아이디 불입력시 alert div  및   실시간 중복아이디 검사 결과 div  -->
			<div class="alert_id" name="alert_id"></div>

			<div><input type="password" id="userpw" name="userpw" placeholder="비밀번호 입력" size=10 maxlength=10 onkeyup="pwchange1()"></div>
			<!-- 비밀번호 불입력시 alert div -->
			<div class="alert_pw" name="alert_pw"></div>
			
			<div><input type="password" id="userpw_comfirm" name="comfirm" placeholder="비밀번호 확인입력"size=10 maxlength=10 onkeyup="pwchange2()"></div>
			<!-- 비밀번호확인란  불입력시 비밀번호와 비밀번호확인 불일치시 alert div -->
			<div class="alert_pw_cofirm" name="alert_pw_cofirm"></div>
			
			<br>
			<div><input type="button" value="계속하기" class="Modal_joinnext_btn" id="Modal_joinnext_btn" onclick="javascript:joinnext('../join/join2.jsp');"></div> <!-- joinnext()는 AXAX를 이용해 회원가입1에서 입력한 데이터들을 회원가입2페이지로 값을 전달 이벤트 -->
			<br>
			<br>
			<div>이미 계정이 있으신가요??&emsp;<a href="javascript:GetModalPage('../login/login.jsp');">로그인하기</a></div> <!--GetModalPage는  AJAX를 이용해 모달간 이동 메소드 -->
		</div>
	</div>
</form>

