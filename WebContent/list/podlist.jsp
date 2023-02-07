<!--************************************************************************* 
작성자 : 두성수
최초 작성일 : 2021-09-23

		1. 팟리스트 리스트 페이지 랜덤값 추가 									2021.09.23
		2. 팟리스트 LoginOK.jsp 페이지에서 세션 추가 							2021.09.27
		3. 새로고침시 리스트 유지 추가  										2021.09.27
		4. 주석처리													2021.09.28
		5. 재생버튼 클릭이벤트 index.jsp페이지에 javascript 추가 (장가영)		2021.09.28
		6. 페이징 처리 및 마무리											2021.09.29
		7. 좋아요 표시하기 로직 구현										2021.09.30(노동혁)

***************************************************************************-->

<%@ page contentType="text/html;charset=utf-8" %>	
<%@ include file="../include/head.jsp" %>
<%@ page import="VO.*" %>
<%@ page import="DTO.*" %>
<%
if(login == null)
{
	response.sendRedirect("../main/main.jsp");
}

int ptotal = dto.CountPlaylist(uno);

String genre = request.getParameter("genre");
System.out.println("페이지에서 넘어오는 장르 확인 : "+ genre);
String mno = "";
int likeno;
%>
<script>
/*============================================================================
 플레이 버튼을 눌렀을 때 배열로 지정했던 mno값을 보내주기 위한 스크립트
 ============================================================================*/
 
 function DoPlay(mno)
{	//전체재생
	if( mno == "")
	{
		mno_list = $("#mno").val();
		window.parent.DoPlay(mno_list);
	}else//한곡 재생
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
<!-- ===================================================================== -->
  	<div class="sub-wrap" id="sub-wrap2">
   		<div class="nav">
			<div id="nav">  팟캐스트 ▶ 팟캐스트 이름</div>
		</div>
     	<div class="contents">
     	 <div class="a-container1">	
	         <div class="p-container1">
	         	<div class= "p-subcon1">
	         		<ul>
	         			<li><h1> <%= genre %></h1></li>
	         			<li><span>●&nbsp; 30곡 </span></li>
	         		</ul>
	         	</div>
	         </div>
	         <div class="p-container2">
	         	<div class="p-subcon2">
		         	<ul>
		         		<li><a href="javascript:DoPlay('');"><i class="fa fa-play-circle fa-3x" aria-hidden="true"></i></a></li>
		         		<%--  <%
		         		//System.out.print("podlist_mno :"+mno); 
	         			if(likedto.Search(String.valueOf(uno), String.valueOf(mno)) != true)
	         			{	
	         			%>	<!-- 좋아요 표시를 해놓은것이 맞는경우엔  빨간색  하트로 표시 -->
	         				<li><a href="#" onclick="javascrpit:AllLike();"><i class="fas fa-heart fa-2x" aria-hidden="true" id="biglike"></i></a></li>
	         			<%
	         			}else
	         			{
	         			%>	<!-- 좋아요 표시를 해놓은것이 아닐시에 빈 하트로 표시 -->
	         				<li><a href="#" onclick="javascrpit:AllLike();"><i class="far fa-heart fa-2x" aria-hidden="true" id="biglike"></i></a></li>
	         			<%
	         			}
		       			%> --%>
		  
		         		<!--  <li><a href="#" onclick="javascrpit:AllLike(mno, String.valueOf(uno),);"><i class="far fa-heart fa-2x" aria-hidden="true" id="biglike"></i></a></li>-->
		         		
		         	</ul>
	         	</div>
	         </div>	
	         <%
	         if (login == null)
	         {
	
	         }else
	         {
	         %>
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
		         		String mno_list = "";								// 리스트 형식으로 만들어 보내기 위한 변수 선언
		         		String str      = "";
		         		double min;
		         		double sec;
		         		for(int i = 0; i <= 29; i++)
		         		{
							/*==============================================
							받아온 장르에 따른 if 문을 돌려서 페이징 처리 
							===============================================*/
							if(genre.equals("댄스"))
							{
								str	= Dance.get(i);							// str 받아온값을 저장	
							}
							if(genre.equals("발라드"))
							{
								str	= ballad.get(i);							// str 받아온값을 저장	
							}
							if(genre.equals("랩/힙합"))
							{
								str	= Hip_hop.get(i);							// str 받아온값을 저장	
							}
							if(genre.equals("국내드라마"))
							{
								str	= ost.get(i);							// str 받아온값을 저장	
							}
							if(genre.equals("록"))
							{
								str	= rock.get(i);							// str 받아온값을 저장	
							}
							if(genre.equals("RaB"))
							{
								str	= RaB.get(i);							// str 받아온값을 저장	
							}
							if(genre.equals("인디"))
							{
								str	= Indie.get(i);							// str 받아온값을 저장	
							}
							if(genre.equals("포크"))
							{
								str	= Folk.get(i);							// str 받아온값을 저장	
							}
							if(genre.equals("POP"))
							{
								str	= POP.get(i);							// str 받아온값을 저장	
								System.out.println(str);
							}
							
							
		         			/*==============================================
		         			loginOK.jsp 에서 넘어온 값(세션)을 받아와서 배열로 만들어 
		         			지정해주는 코드
		         			===============================================*/
		         								
		         			String[] strArr = str.split("<r>");				// <r> 기준으로 배열로 만들어 준다.
		         			String title    = strArr[0];					// 타이틀을 배열로 지정
		         			String album    = strArr[1];					// 앨범을 배열로 지정
		         			String singer   = strArr[2];					// 가수을 배열로 지정
		         			mno             = strArr[3];					// 음악번호을 배열로 지정
		         			String ptime    = strArr[4];					// 플레이 타임을 배열로 지정
							likeno          = Integer.parseInt(mno);
		         			
		         			double time = Double.parseDouble(ptime);        // 플레이 타임을 문자열에서 실수형으로 변환
		         			time = Math.round(time);						// 소수 첫째자리 기준으로 반올림
		         			min = time/60;				// 분을 구하는 공식
		         			sec = Math.round(time%60);				// 초를 구하는 공식
		         			/*==============================================
		         			mno를 리스트 형식으로 만들어 보내기 위한 코드
		         			
		         			===============================================*/
		         			
		         			if( mno_list != "")								
		         			{
		         				mno_list += ",";         				
		         			}
		         			System.out.println(mno_list);
		         			mno_list += mno;
			         		%>
			         		<!-- ============================= mno , uno 히든값 지정 ================================= -->
	         					<input type="hidden" id="likemno<%=i %>" name="likemno<%=i %>" value="<%= mno %>">
	         					<input type="hidden" id="likeuno<%=i %>" name="likeuno<%=i %>" value="<%= uno %>">
	         					<input type="hidden" id="likemno" name="likemno" value="<%= mno %>">
	         					<input type="hidden" id="likeuno" name="likeuno" value="<%= uno %>">
	         				<!-- ============================= mno , uno 히든값 지정 ================================= -->
			       			<ul class="p-list">
			       			
			         			<li class="p-no"><%= i+1 %></li>
			         			<li class="p-play"><i onclick="javascript:DoPlay('<%= mno %>');" class="fas fa-play fa-lg"></i></li>
			         			<li class="p-title"><%=title %></li>
			         			<li class="p-name"><%=singer%></li>
			         			<li class="p-album"><%=album%></li>
			         			<!-- 0분00초로 나타내 주기위해 String.format("%02d",(int)sec)을 사용하여서 00초로 나타낼수 있다.  -->
			         			<li class="p-time"><%=(int)min %>분 <%=String.format("%02d",(int)sec)%>초</li> 
			         			<li class="p-info" ><a href="javascript:GetModalPage('../list/music_info.jsp?mno=<%=mno%>');"><i class="far fa-file-alt fa-lg"></i></a></li>
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
	         		<br><br>
	         		<input type="hidden" id="mno" name="mno" value="<%= mno_list %>">
	         	</div>
	         </div>  
	         <%
	         }
	         %>
	      </div> 
	      
      </div>
	</div>
 </div>		        
<%@ include file="../include/tail.jsp" %>