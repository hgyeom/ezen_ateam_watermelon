<!-- =================================================================================================================
작성자 : 김무겸
작성일 : 2021-09-30
		1. 최초작성    				2021.09.30
				 
=================================================================================================================-->

<%
int pno = Integer.parseInt(request.getParameter("pno"));
String pname = request.getParameter("pname");
%>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<div class="modal_content3" id="modal_content3" title="클릭하면 창이 닫힙니다.">
		<div class="close" onclick="javascript:ModalClose();">&times;</div><!-- &times;은 X라는 표시 글자를 엔티티숫자로 표시한것이다. -->
		<div class="modal_title"><h3>플레이리스트 이름 변경</h3></div>
		<div>			
			<div style="height: 60px; margin-left: 15px;"><input type="text" id="pl_name" name="pl_name" placeholder="&nbsp;<%=pname %>" size=10 maxlength=10>
				<i class="fas fa-check" id="RenamePlaylist_btn" onclick="javascript:RenamePlaylist();" ></i>
			</div>
			<div class="alert_pl_name" name="alert_pl_name"></div>
			<input type="hidden" id="renamepno" class="renamepno" value="<%=pno%>">
			
			<%-- <br>
			<br>
			<div><a href="../list/playlist.jsp?pno=<%=pno%>&pname=<%=pname%>">뒤로가기</a></div> --%>
		</div>		
		</div>
	</div>