<!-- =============================================================================================================================
작성자 : 장가영
작성일 : 2021-09-28

기능 : 플레이어 재생목록 구현 페이지
============================================================================================================================= -->

<%@ page contentType="text/html;charset=utf-8" %>	
<%@ include file="../include/head.jsp" %>
<%@ page import="VO.*" %>
<%@ page import="DTO.*" %>
<!-- ===================================================================== -->
<script>
function DoPlay(mno)
{
	
	window.parent.DoPlay(mno);	
	//음악 파일 로드 시 alert 
	const Toast = Swal.mixin({
		  width: 250,
		  toast: true,
		  position: 'bottom',
		  showConfirmButton: false,
		  timer: 1000,
		  timerProgressBar: false
		});

		Toast.fire({
		  icon: 'success',
		  title: '음악 로드 완료'
		});
}

</script>
<%
if(login == null)
{
	response.sendRedirect("../main/main.jsp");
}
		
String mno_list = request.getParameter("mno");
String[] mno_array = null;
if(mno_list != null)
{
	mno_array = mno_list.split(",");
}
System.out.println("플레이어 리스트 uno: "+uno);
int ptotal = dto.CountPlaylist(uno);
%>

  	<div class="sub-wrap" id="sub-wrap2">
   		<div class="nav">
			<div id="nav">  플레이어 ▶  재생목록</div>
		</div>
     	<div class="contents">
     	<!--
         
       			<h2>재생 목록 (좋아요 표시한 곡)</h1>
       			<h4>지금 재생 중</h4>
         		<ul class="p-list">
         			<li class="p-no">1</li>
         			<li class="p-info"><a href="javascript:GetModalPage('../list/music_info.jsp');"><i class="far fa-file-alt fa-lg"></i></a></li>
         			<li class="p-title">title_name</li>
         			<li class="p-name">artist_name</li>
         			<li class="p-album">album_name</li>
         			<li class="p-time">play_time</li>
         			<li class="p-icon" ><i class="far fa-heart fa-lg"></i></li>
	       			<li class="p-add"><i class="fas fa-plus fa-lg"></i>
       					<ul class="add-list">
       						<li id="add-list">플레이리스트 #1</li>
       						<li id="add-list">플레이리스트 #2</li>
       						<li id="add-list">플레이리스트 #3</li>
       						<li id="add-list">플레이리스트 #4</li>
       						<li id="add-list">플레이리스트 #5</li>
       					</ul>
	       			</li>
         		</ul>
         	</div>
         </div>
         -->
        <div class="a-container1">
         	<div class= "a-subcon1">
         		<h2>재생 목록</h1>
       			<h4></h4>
         		<%
         		//String title_name   = "Asdasd";
         		//String artist_name  = "art";
         		//String album_name   = "albn";
         		//String play_time    = "ptime";
         		//int playertotal = 10; // 실제 구현시 total + 1 필요
         		
         		for(int i = 0; i < mno_array.length ; i++)
         		{
    				PlayerDTO playDTO =  new PlayerDTO();
    				PlayerVO  playVO  = playDTO.getMusic(mno_array[i]);         			
	         		
    				String title  = playVO.getTitle();
    				String singer = playVO.getSinger();
    				String album  = playVO.getAlbum();
    				String ptime  = playVO.getPtime(); 
    				String mno    = mno_array[i];
    				double min;
	         		double sec;
	         		double time = Double.parseDouble(ptime);        // 플레이 타임을 문자열에서 실수형으로 변환
         			time = Math.round(time);						// 소수 첫째자리 기준으로 반올림
         			min = time/60;				// 분을 구하는 공식
         			sec = Math.round(time%60);		
         			
	         		%>
	       		<ul class="p-list">
	         		<!-- ============================= mno , uno 히든값 지정 ================================= -->
					<input type="hidden" id="likemno<%=i %>" name="likemno<%=i %>" value="<%= mno %>">
					<input type="hidden" id="likeuno<%=i %>" name="likeuno<%=i %>" value="<%= uno %>">
					<input type="hidden" id="likemno" name="likemno" value="<%= mno %>">
					<input type="hidden" id="likeuno" name="likeuno" value="<%= uno %>">
					<!-- ============================= mno , uno 히든값 지정 ================================= -->
         			<li class="p-no"><%=i + 1 %></li>
         			<li class="p-title"><%= title %></li>
         			<li class="p-name"><%= singer %></li>
         			<li class="p-album"><%= album %></li> 
         			<li class="p-time"><%=(int)min %>분 <%=String.format("%02d",(int)sec)%>초</li> 
         			<li class="p-info"><a href="javascript:GetModalPage('../list/music_info.jsp?mno=<%= mno %>');"><i class="far fa-file-alt fa-lg"></i></a></li>
         			<% 
         			System.out.println("라이크 uno:"+ uno);
     				System.out.println("라이크 mno:"+ mno);
         			if(likedto.Search(String.valueOf(uno), String.valueOf(mno)) != true)
         			{	
         			%>	<!-- 좋아요 표시를 해놓은것이 맞는경우엔  빨간색  하트로 표시 -->
         				<li class="p-icon" onclick="javascript:likelist('<%= i%>');"><i class="fas fa-heart fa-lg" id="like<%= i %>"></i></li>
         			<%
         			}else
         			{
         			%>	<!-- 좋아요 표시를 해놓은것이 아닐시에 빈 하트로 표시 -->
         				<li class="p-icon" onclick="javascript:likelist('<%= i%>');"><i class="far fa-heart fa-lg" id="like<%= i %>"></i></li>
         			<%
         			}
	       			%>
	       			<li class="p-add"><i class="fas fa-plus fa-lg"></i>
       					<ul class="add-list">
       					<%
                          	for(int j = 0; j < ptotal; j++)
                         		{
                             		vo = dto.getItem(j);
                             		System.out.println(vo.getPno());
                             		int pno = vo.getPno();
                          	%>
                          		<li id="add-list" onclick="javascript:AddPlaylistMusic('<%=i%>','<%=j%>');"><%=vo.getP_name() %>
                          		<div><input type="hidden" id="podpno<%=j%>" name="podpno<%=j%>" value="<%= pno%>"></div></li>	<!-- mtplaylist에 pno를 전달하기 위한 히든 -->
                          	<%
                          	}
                          	%>
       					</ul>
	       			</li>
         		</ul>
         			<%}%>
         		<ul><li class="endline"></li></ul>
         		<input type="hidden" id="mno" name="mno" value="<%= mno_list %>">
         	</div>
         </div>  
      </div> 
	</div>
 </div>		        
<%@ include file="../include/tail.jsp" %>