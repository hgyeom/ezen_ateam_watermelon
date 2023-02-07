<!-- ==============================================================
작성자 : 두성수
최초 작성일 : 2021.09.30
		1. 플레이 서치 인물 검색(완전) 구현 	- 두성수	  210930
		2. 서치 버그 수정 						  211001
		3. 주석처리 							  211001
		
=============================================================== -->

<%@ page contentType="text/html;charset=utf-8" %>   
<%@ include file="../include/head.jsp" %>
<%
LatelyDTO L_dto   = new LatelyDTO();
PodlistVO L_vo    = new PodlistVO();
L_dto.Lately(login.getUno()); 						//노래의 토탈값을 가져오기 위한 값
L_dto.Latelysong(login.getUno()); 					//노래 번호를 가져오기 위한 값
//System.out.println("최근 들은 목록의 토탈값:"+L_dto.getTotalCount2());

int L_total = L_dto.getTotalCount2();				// 유저번호에 대한 최근들은 노래의 토탉밧
int ptotal = dto.CountPlaylist(uno);
String mno_list = "";	
String mno = "";									// 리스트 형식으로 만들어 보내기 위한 변수 선언
int likeno;
//likelistDTO likedto = new likelistDTO();
%>
<script>
/*============================================================================
 플레이 버튼을 눌렀을 때 배열로 지정했던 mno값을 보내주기 위한 스크립트
 ============================================================================*/
 function DoPlay(mno)
 {	
	if( mno != null)
	{
		window.parent.DoPlay(mno);	

	}else
	{
		mno_list = $("#mno").val();
		window.parent.DoPlay(mno_list);
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
	
		if(!confirm("을(를) 삭제하시겠습니까?")) 
		 {
			alert("삭제안됨");
			

			//document.location = "../main/index.jsp";
	     }
		 
		 else 
	     {
			alert(" 삭제완료.");
	    	//dto.DeletePlaylist(uno,pno);
	    	
	    	//document.location = "../main/index.jsp";
	     }
	
}
</script>
     <div class="sub-wrap" id="sub-wrap2">
         <div class="nav">
         <div id="nav">최근 재생한 목록</div>
      </div>
        <div class="contents">
	        <div class="a-container1">
	         <div class="p-container1">
	            <div class= "p-subcon1">
	               <ul>
	                  <li><h1>최근 재생한 목록</h1></li>
	                  <li><span>●&nbsp;<%=L_total %>곡</span></li>
	               </ul>
	            </div>
	         </div>
	         <div class="p-container2">
	            <div class="p-subcon2">
	               <ul>
	                  <li><a href="javascript:DoPlay();"><i class="fa fa-play-circle fa-3x" aria-hidden="true"></i></a></li> 
	                 <!--  <li><a href="#"><i class="far fa-heart fa-2x" aria-hidden="true"></i></a></li> -->
	                  <li id="sub-searchbtn">
	                     <div class="sub-searchbtn">
	                        <input type="search" id="search" placeholder="플레이리스트에서 검색 ">
	                        <button class="icon"><a href="#"><i class="fa fa-search fa-2x"></i></a></button>
	                     </div>   
	                  </li>
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

	               for(int i = 0; i < L_total; i++)
	               {
					
	            	 /*==========================================================
	            	 음악번호를 가져와 가져온 음악번호를 활용하여 다시 한번 
	            	 음악의 정보를 가져와서 뿌려주는 작업을 거친다
	            	 ==========================================================*/  
	            	 L_vo = L_dto.getItem(i);								 //최근 들은 음악 정보를 getitem 이며 순서대로 가져와진다.
	            	 
	            	 /*==========================================================
	            	 음악 번호를 음악 정보를 가져오기 위한 playerDTO를 활용해 가져온다.
	            	 ==========================================================*/
	            	 PlayerDTO p_dto = new PlayerDTO();
	    			 PlayerVO  p_vo  = new PlayerVO();
	    			 p_vo = p_dto.getMusic(L_vo.getMno());
	    			 
	    			 
				     String album  = p_vo.getAlbum();
				     String singer = p_vo.getSinger();
				     String title  = p_vo.getTitle();
 				     String ptime   = p_vo.getPtime();
	    			 
	                 //System.out.println(ptime);
	                 double min;
	                 double sec;
	         		 double time = Double.parseDouble(ptime);        // 플레이 타임을 문자열에서 실수형으로 변환
	         		 time = Math.round(time);						// 소수 첫째자리 기준으로 반올림
	         		 min = time/60;									// 분을 구하는 공식
	         		 sec = Math.round(time%60);						// 초를 구하는 공식
	         		 mno = L_vo.getMno();
         			 if( mno_list != "")								
         			 {
         			 	mno_list += ",";         				
         			 }
         			 mno_list += mno;
         			 
         			 System.out.println("mno_list : "+mno_list);
					  %>
					  <!-- ============================= mno , uno 히든값 지정 ================================= -->
       				   <input type="hidden" id="likemno<%=i %>" name="likemno<%=i %>" value="<%= mno %>">
       				   <input type="hidden" id="likeuno<%=i %>" name="likeuno<%=i %>" value="<%= uno %>">
       				   <input type="hidden" id="likemno" name="likemno" value="<%= mno %>">
       				   <input type="hidden" id="likeuno" name="likeuno" value="<%= uno %>">
       				  <!-- ============================= mno , uno 히든값 지정 ================================= -->
					   <input type="hidden" id="likemno<%=i %>" name="likemno<%=i %>" value="<%= mno %>">
	         		   <input type="hidden" id="likeuno<%=i %>" name="likeuno<%=i %>" value="<%= uno %>">
	                   <ul class="p-list">
	                     <li class="p-no"><%=i + 1%></li>
	                     <li class="p-play"><i onclick="javascript:DoPlay('<%= mno %>');" class="fas fa-play fa-lg"></i></li>
	                     <li class="p-title"><%= title %></li>
	                     <li class="p-name"><%=singer %></li>
	                     <li class="p-album"><%=album %></li>
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
	                  <%
	               }
	               %>
	               <ul><li class="endline"></li></ul>
	               <input type="hidden" id="mno" name="mno" value="<%= mno_list %>">
	            </div>
            </div>
         </div>  
      </div> 
   </div>      
<%@ include file="../include/tail.jsp" %>