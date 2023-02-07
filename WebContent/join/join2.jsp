<!--=============================================================================================================================
작성자 : 노동혁
작성일 : 2021-09-13
		1. 회원가입HTML작성    				2021.09.13
		2. 주석처리						2021.09.16
=============================================================================================================================-->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

String dataurl    = request.getParameter("dataurl");			//join1에서 전달받은 dataurl
System.out.println("join2.jsp dataurl : " + dataurl);			//dataurl  콘솔출력 확인용
//out.print(dataurl);

%>
<script src="../js/join.js"></script>

<form id="loginform" name="loginform" method="post" action="">
	<div class="modal_content" id="modal_content" title="클릭하면 창이 닫힙니다.">
		<!-- join1에서 받은 dataurl를 hidden으로 -->
		<input type="hidden" value="<%=dataurl%>" id="data">
		<!-- <div class="close" onclick="javascript:ModalClose();">&times;</div>		&times;은 X라는 표시 글자라를 엔티티숫자로 표시한것이다. -->
		<div class="modal_title"><h1 >회원가입 (2/2)</h1></div>
		<br>
		<div>
		
			<div class="gender">성&emsp;&emsp;별 
            	<select name="gender_select" id="gender_select" onchange="changeselect()">
					<option value="성별">성별</option>
					<option value="남자">남자</option>
					<option value="여자">여자</option>
				</select>
            </div>
            <div class="alert_gen" name="alert_gen"></div>				<!-- 성별 미선택시 alert div -->
			<div class="name"> 
				이&emsp;&emsp;름<input type="text" id="username" name="username" placeholder="이름 입력" size=10 maxlength=10 onkeyup="changeid()">
			</div>
			<div class="alert_name" name="alert_name"></div>				<!-- 이름 불입력시 alert div -->
			
			<div class="birthday">
				생년월일<input type="date" id="bir_day" name="bir_day" onchange="changedate()">
			</div>
			<div class="alert_bir_day" name="alert_bir_day"></div>			<!-- 생년월일 미선택시 alert div -->
			<div class="email_box">
				<input type="text" name="email_01" id="email_01" maxlength=10 placeholder="이메일 입력" onkeyup="changeemail1()">@
				<input type="text" name="email_02" id="email_02" maxlength=20 placeholder="주소 입력" onkeyup="changeemail2()">
				<select name="selectEmail" id="selectEmail" onchange="changeselectemai()">
					 <option value="dir" selected>직접입력</option>
					 <option value="naver.com">naver.com</option>
					 <option value="hanmail.net">hanmail.net</option>
					 <option value="daum.net">daum.net</option>				
					 <option value="nate.com">nate.com</option>
					 <option value="gmail.com">gmail.com</option>				
				</select>
			</div>
			<div class="alert_email" name="alert_email"></div>			<!-- 이메일 불입력시 및 미 선택시 alert div -->
			<div id="loding" style="display: none;"><img src="../img/loading.gif" width="50px" height="50px"></div>						<!--  -->
			<div style="margin-top: 15px;"><input type="button" value="가입완료" class="Modal_joinlast_btn" id="Modal_joinlast_btn" onclick="javascript:joinext2();"></div> <!-- joinnext2()는 AXAX를 이용해 "join2.jsp" 에서 입력한 데이터들을 "joinok.jsp"페이지로 값을 전달 이벤트 -->
			<div id="Modal_pev_btn"><a href="javascript:GetModalPage('../join/join.jsp');">뒤로가기</a></div>	<!--GetModalPage는  AJAX를 이용해 모달간 이동 메소드 -->
		</div>
	</div>
</form>