<!-- ==============================================================
작성자 : 두성수
최초 작성일 : 2021.09.30
		1. 플레이 서치 인물 검색 구현 	- 두성수	 	  210930
		2. 서치 버그 수정 						  211001
		3. 주석처리 							  211001
		4. 플레이 버튼 활성화						  211001
		
		
=============================================================== -->
<%@ page contentType="text/html;charset=utf-8" %>	
<%@ include file="../include/head.jsp" %>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type='text/javascript' src='../js/jquery.bgiframe.min.js'></script>
<script type='text/javascript' src='../js/jquery.ajaxQueue.js'></script>
<script type='text/javascript' src='../js/jquery.autocomplete.js'></script>
<script type='text/javascript' src='../js/search.js'></script>
<link rel="stylesheet" type="text/css" href="../css/jquery.autocomplete.css" />
<%
String key  	= request.getParameter("key");

System.out.println("searchget.jsp키값 확인 : " + key);
if(key  == null) key  = "";
SearchDTO s_dto = new SearchDTO();
PodlistVO p_vo = new PodlistVO();

int ptotal = dto.CountPlaylist(uno);

/*==========================================================================
가수 검색을 위한 Searchsinger를 실행
검색 이후 토탈값을 구하기 위한 S_total
==========================================================================*/
s_dto.Searchsinger(key);
int S_total = s_dto.getTotalCount();

/*==========================================================================
노래 검색을 위한 Searchtitle를 실행
검색 이후 토탈값을 구하기 위한 t_total
==========================================================================*/
s_dto.Searchtitle(key);
int t_total = s_dto.getTotalCount2();



String S_Singer ="";
%>
<!-- ===================================================================== -->
<script>

function DoPlay(mno)
{
	if( mno == "")
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

</script>


   <div class="sub-wrap" id="sub-wrap2">
	<div class="nav">
			<div id="nav">  검색하기</div>
		</div>  
      <div class="contents">
      	<div class="a-container1">
	      	<div class="searchbtn">
	      		<input type="search" id="search" placeholder="아티스트, 곡 입력">
	      		<button class="icon" onclick="filter()"><i class="fa fa-search fa-2x"></i></button>
	      	</div>	
	      	<div class="podlisttext">	
	      		<h3>아티스트</h3>
	      	</div>
	      	 <% //for(int i=1; i<=3; i++) {%> 	
		         <div class="podcastlist">
		            <ul>
		            <%
		            try{
		            	
		            	/*=============================================================
		            	가수 검색을 위한 것이고 
		            	
		            	위에서 토탈값을 가져와 토탈값에 따라 표시해주는 양(가수)를 조절해준다.
		            	
		            	토탈값이 3개 이하면 그에 맞는 양(가수)을 표시해주기 위한 토탈값을 가져오는것이다
		            	=============================================================*/
		            	if (S_total >3)
		            	{
		            		for(int i = 0 ; i < 3; i++)
		            		{	
		            			/*=============================================================
		            			dto에서 보드리스트를 만든뒤 만든것을 가져오기 위한 getItem()이다.
		            			=============================================================*/
		            			p_vo = s_dto.getItem(i);
		            			S_Singer = p_vo.getSinger();
		            			
		            			
		            			
		            			/*=============================================================
		            			가수의 사진(앨범)의 url(사진)을 가져오기 위한 dto이다.		
		            			=============================================================*/
		            			s_dto.S_Singer_img(p_vo, S_Singer);

								
		            			%><a href="#" onclick ="changeIframeUrl('../search/searchlist.jsp?singer=<%=S_Singer%>');"><li style="background-color: #8D67AB;"><%=p_vo.getSinger() %><img src="<%= p_vo.getUrl()%>"></li></a><%
		            		}
		            	}else 
		            	{
		            		for(int i = 0 ; i < S_total; i++)
		            		{	
		            			/*=============================================================
		            			dto에서 보드리스트를 만든뒤 만든것을 가져오기 위한 getItem()이다.
		            			=============================================================*/
		            			p_vo = s_dto.getItem(i);
		            			S_Singer = p_vo.getSinger();
		            			
		            			
		            			
		            			/*=============================================================
		            			가수의 사진(앨범)의 url(사진)을 가져오기 위한 dto이다.		
		            			=============================================================*/
		            			s_dto.S_Singer_img(p_vo, S_Singer);

		            			%><a href="#" onclick ="changeIframeUrl('../search/searchlist.jsp?singer=<%=S_Singer%>');"><li style="background-color: #8D67AB;"><%=p_vo.getSinger() %><img src="<%= p_vo.getUrl()%>"></li></a><%
		            		}
		            	}
		            }catch(Exception e)
		            {
		            	
		            }
		            %>
		            </ul>
		         </div>
		         <div class="podlisttext">	
	      			<h3>곡</h3>
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
	                   try{
	                		
							/*========================================================
							노래의 토탈값을 거져와서 10개 이상인지 아닌지를 확인하는 작업이다.
							
							10개의 노래가 넘어가면 10개까지만 표시해주기 위함이다.
							
							그 이하면 그이하의 노래만 표시해주기 위함이다.
							========================================================*/
	                		if(t_total>10)
	                		{
	                			for(int i = 0 ; i < 10; i++)
	                			{	
	                				
	                				/*========================================================
	                				dto에서 노래 리스트를 만들어 넘어오는 값을 받아오기 위함이다.
	                				========================================================*/
	                				p_vo = s_dto.getItem2(i);
	                				int mno = Integer.parseInt(p_vo.getMno());
	                				/*
	                				System.out.print("제목:"+p_vo.getTitle());
	                				System.out.print("앨범:"+p_vo.getAlbum());
	                				System.out.print("가수:"+p_vo.getSinger());
	                				System.out.print("사진:"+p_vo.getUrl());
	                				System.out.print("번호:"+p_vo.getMno());
	                				*/
	            	         		double min;
	            	         		double sec;
	                				double time = Double.parseDouble(p_vo.getPtime());      // 플레이 타임을 문자열에서 실수형으로 변환
	        	         			time = Math.round(time);								// 소수 첫째자리 기준으로 반올림
	        	         			min = time/60;											// 분을 구하는 공식
        	         				sec = Math.round(time%60);								// 초를 구하는 공식
	                				%>
	                				<!-- ============================= mno , uno 히든값 지정 ================================= -->
			         					 <input type="hidden" id="likemno<%=i %>" name="likemno<%=i %>" value="<%= mno %>">
			         					 <input type="hidden" id="likeuno<%=i %>" name="likeuno<%=i %>" value="<%= uno %>">
			         					 <input type="hidden" id="likemno" name="likemno" value="<%= mno %>">
			         					 <input type="hidden" id="likeuno" name="likeuno" value="<%= uno %>">
			         				<!-- ============================= mno , uno 히든값 지정 ================================= -->
      					                 <ul class="p-list">
					                     <li class="p-no"><%=i+1 %></li>
					                     <li class="p-play"><i onclick="javascript:DoPlay('<%= p_vo.getMno() %>');" class="fas fa-play fa-lg"></i></li>
					                     <li class="p-title"><%=p_vo.getTitle() %></li>
					                     <li class="p-name"><%=p_vo.getSinger() %></li>
					                     <li class="p-album"><%=p_vo.getAlbum() %></li>
					                     <li class="p-time"><%=(int)min %>분 <%=String.format("%02d",(int)sec)%>초</li>
					                     <li class="p-info"><a href="javascript:GetModalPage('../list/music_info.jsp?mno=<%= p_vo.getMno() %>');"><i class="far fa-file-alt fa-lg"></i></a></li>
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
	                		}else 
	                		{
	                			for(int i = 0 ; i < t_total; i++)
	                			{	
	                				/*========================================================
	                				dto에서 노래 리스트를 만들어 넘어오는 값을 받아오기 위함이다.
	                				========================================================*/
	                				p_vo = s_dto.getItem2(i);
	                				int mno = Integer.parseInt(p_vo.getMno());
	                				/*
	                				System.out.print("제목:"+p_vo.getTitle());
	                				System.out.print("앨범:"+p_vo.getAlbum());
	                				System.out.print("가수:"+p_vo.getSinger());
	                				System.out.print("사진:"+p_vo.getUrl());
	                				System.out.print("번호:"+p_vo.getMno());
	                				*/
	            	         		double min;
	            	         		double sec;
	                				double time = Double.parseDouble(p_vo.getPtime());      // 플레이 타임을 문자열에서 실수형으로 변환
	        	         			time = Math.round(time);								// 소수 첫째자리 기준으로 반올림
	        	         			min = time/60;											// 분을 구하는 공식
	        	         			sec = Math.round(time%60);								// 초를 구하는 공식
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
				                     <li class="p-no"><%=i+1 %></li>
				                     <li class="p-play"><i onclick="javascript:DoPlay('<%= p_vo.getMno() %>');" class="fas fa-play fa-lg"></i></li>
				                     <li class="p-title"><%=p_vo.getTitle() %></li>
				                     <li class="p-name"><%=p_vo.getSinger() %></li>
				                     <li class="p-album"><%=p_vo.getAlbum() %></li>
				                     <li class="p-time"><%=(int)min %>분 <%=String.format("%02d",(int)sec)%>초</li>
				                     <li class="p-info"><a href="javascript:GetModalPage('../list/music_info.jsp?mno=<%=p_vo.getMno() %>');"><i class="far fa-file-alt fa-lg"></i></a></li>
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
			                               		//System.out.println(vo.getPno());
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
	                		}
	                	}catch(Exception e)
	                	{
	                		
	                	}
						%>

                  	<ul><li class="endline"></li></ul>
	            </div>
            </div> 
         </div>
      </div>
    </div>  
  </div>  
<%@ include file="../include/tail.jsp" %>