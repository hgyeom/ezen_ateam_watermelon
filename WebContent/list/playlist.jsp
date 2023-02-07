<!-- ==============================================================
작성자 : 김무겸
최초 작성일 : 2021.09.27
		1. 플레이리스트 음악목록 출력 	- 김무겸	  210929
		
=============================================================== -->

<%@ page contentType="text/html;charset=utf-8" %>   
<%@ include file="../include/head.jsp" %>
<%

if(login == null)
{
	response.sendRedirect("../main/main.jsp");
}
int pno = 0;
String pname = "";
String mno = "";
String mno_list = "";
if(login != null)
{
	pno = Integer.parseInt(request.getParameter("pno"));
	pname = request.getParameter("pname");
}

PlaylistVO list_vo = null;
int ptotal = dto.TotalPlaylist(uno,pno);
dto.PlaylistMusic(uno,pno);

%>


<script>
window.onload = function() 
{
   if(LoginCheck=="null")
   {
      alert("로그인 후 이용가능합니다.");
      document.location="../main/main.jsp";
   }
}


function DoPlay(mno)
{
	if( mno == null)
	{
		mno_list = $("#mno").val();
		window.parent.DoPlay(mno_list);
	}else
	{
		window.parent.DoPlay(mno);	
	}

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
 function DeletePlaylist()
{	
	
		if(!confirm("<%=pname%> 을(를) 삭제하시겠습니까?")) 
		 {
			return;
	     }
		 
		 else 
	     {
	    	document.location = "../list/deleteplaylist.jsp?uno="+ <%=uno%> + "&pno=" + <%=pno%>;
	     }
	
} 

</script>
     <div class="sub-wrap" id="sub-wrap2">
         <div class="nav">
         <div id="nav">내  플레이리스트 ▶&nbsp;<%= pname %></div>
      </div>
        <div class="contents">
	        <div class="a-container1">
	         <div class="p-container1">
	            <div class= "p-subcon1" style="background: linear-gradient(to bottom right, #006450, #000000);">
	               <ul class="m-subcon">
						<li class="m-title"><h1><%= pname %></h1>
	       					<div class="Rename">
	       						<i id="Rename" onclick="javascript:GetModalPage('../list/RenamePlaylist.jsp?pno=<%=pno%>&uno=<%=uno%>&pname=<%=pname%>');" class="far fa-edit fa-lg"></i>&nbsp;&nbsp;
	       						<i onclick="javascript:DeletePlaylist();" class="far fa-trash-alt fa-lg" aria-hidden="true"></i>
	       					</div>
	       				</li>
		       			<li><span>●&nbsp;<%=ptotal%>곡 </span></li>
					</ul>
	            </div>
	         </div>
	         <div class="p-container2">
	            <div class="p-subcon2">
	               <ul>
	                  <li><a href="javascript:DoPlay();"><i class="fa fa-play-circle fa-3x" aria-hidden="true"></i></a></li> 
	                  <!-- <li><a href="#"><i class="far fa-heart fa-2x" aria-hidden="true"></i></a></li> -->
	                  <!-- <li><a href="#"><i onclick="javascript:DeletePlaylist();" class="far fa-trash-alt fa-2x" aria-hidden="true"></i></a></li> -->
	               </ul>
	            </div>
	         </div>   
	         <div class="p-container3">
	            <div class="p-subcon3">
	               <ul class="p-menu">
	                  <li class="p-no">#</li>
	                  <li class="p-info"></li>
	                  <li class="p-title">제목</li>
	                  <li class="p-name">아티스트</li>
	                  <li class="p-album">앨범명</li>
	                  <li class="p-time">재생시간</li>
	               </ul>
	   
	               <%
				   double min;
				   double sec;
	               for(int i = 0; i < ptotal; i++)
	               {
	                  list_vo = dto.getMusic(i);
	                  String ptime = list_vo.getPtime();
		              mno = String.valueOf(list_vo.getMno());
					  /*------------------------------------------------------------------------------------*/
		              double time = Double.parseDouble(ptime);       	// 플레이 타임을 문자열에서 실수형으로 변환
					  time = Math.round(time);							// 소수 첫째자리 기준으로 반올림
					  min = time/60;									// 분을 구하는 공식
					  sec = Math.round(time%60);						// 초를 구하는 공식
					  /*------------------------------------------------------------------------------------*/
					  if( mno_list != "")								
					  {
						mno_list += ",";         				
					  }
					  mno_list += mno;
					  System.out.println("playlist mno = " + mno);
					  %>
					  <!-- ============================= mno , uno 히든값 지정 ================================= -->
         				<input type="hidden" id="likemno<%=i %>" name="likemno<%=i %>" value="<%= mno %>">
         				<input type="hidden" id="likeuno<%=i %>" name="likeuno<%=i %>" value="<%= uno %>">
       				  <!-- ============================= mno , uno 히든값 지정 ================================= -->
	                   <ul class="p-list">
	                     <li class="p-no"><%=i + 1%></li>
	                     <li class="p-play"><i onclick="javascript:DoPlay('<%= mno %>');" class="fas fa-play fa-lg"></i></li>
	                     <li class="p-title"><%= list_vo.getTitle() %></li>
	                     <li class="p-name"><%= list_vo.getSinger()%></li>
	                     <li class="p-album"><%= list_vo.getAlbum()%></li>
	                     <li class="p-time"><%=(int)min %>분 <%=String.format("%02d",(int)sec)%>초</li>
	                     <li class="p-info"><a href="javascript:GetModalPage('../list/music_info.jsp?mno=<%=mno%>');"><i class="far fa-file-alt fa-lg"></i></a></li>
	                     <!--============================ Search()를해서 그 값이 ture또는 false경우르 통해 하트를 다르게  출력  시작================================ -->
							<% 
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
						  <!--============================ Search()를해서 그 값이 ture또는 false경우르 통해 하트를 다르게  출력 종료 ================================ -->
	                      	                  </ul>
	                 	<%
	               		}
	               		%>
	               <ul><li class="endline"></li></ul>
	               <input type="hidden" id="mno" name="mno" value="<%= mno_list %>">
	         	   <% 
	         	   System.out.println("playlist mno_list : " + mno_list); 
	         	   System.out.println("playlist mno = " + mno);
	         	   %>
	            </div>
            </div>
         </div>  
      </div> 
   </div>      
<%@ include file="../include/tail.jsp" %>