<!-- 
작성자 : 장가영
작성일 : 2021-09-01
		1. 모달 회원가입, 로그인창 구현    2021.09.03		 
-->
<script>

</script>

<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="../include/head.jsp" %>
			<!-- ===================================================================== -->
			<div class="sub-wrap" id="sub-wrap2">
				<div class="nav">
					<div id="nav">  홈</div>
				</div>
				<div class="contents">
					<div class="container">
					<%
					if(uno == 0)
					{
					%>
						<div class="podcast">
							<a href="javascript:GetModalPage('../login/login.jsp');"><h3>로그인 후 이용이 가능합니다.</h3></a>
						</div>
					<%	
					}else
					{
						LatelyDTO L_dto   = new LatelyDTO();
						PodlistVO L_vo    = new PodlistVO();
					%> 
						<div class="podcast">
							<h3>최근 재생한 목록</h3>
							<h6></h6>
							<!-- <div class="podlisttext">
								<a href="../list/relist.jsp">모두 보기</a>
							</div>
							 -->
							<ul>
							<%
								 if (L_dto.Lately(Integer.toString(uno)) == false)
								 {
								 %>
									<li><a href="#"> <img
											src="../img/noplay.jpg	"
											alt="https://musicmeta-phinf.pstatic.net/album/006/400/6400461.jpg?type=r360Fll&v=20210908180510"> 
											<div id="albuminfo"><span id="artist_name">최근재생한 목록</span><br><span id="album_name">노래가 없습니다</span></div>
									</a></li>
								<%
								}else 
								{
									
									
									
									L_dto.Lately(Integer.toString(uno));				//노래의 토탈값을 가져오기 위한 값

									
									L_dto.Latelysong(Integer.toString(uno)); 			//노래 번호를 가져오기 위한 값
									
									PlayerDTO p_dto = new PlayerDTO();					//음악 정보를 가져오기 위한 작업
					    			PlayerVO  p_vo  = new PlayerVO();					//음악 정보를 가져오기 위한 작업
									
					    				L_vo = L_dto.getItem(0);							//첫번째 노래를 가져온다
					    			
					    				p_vo = p_dto.getMusic(L_vo.getMno());				//첫번째 노래의 mno를 이용해 타이틀 url등 가져온다
					   
					    			
									
									%>
									<li><a href="../list/relist.jsp"> <img
										src="<%=p_vo.getImg_url() %>"
										alt="https://musicmeta-phinf.pstatic.net/album/006/400/6400461.jpg?type=r360Fll&v=20210908180510"> 
										<div id="albuminfo"><span id="artist_name">최근재생한 목록</span><br><span id="album_name"><%=p_vo.getTitle() %> 등...</span></div>
									</a></li>
									<%
								}
							%>
							
							</ul>
						</div>
						
						<div class="podcast">
							<h3>나만의 추천</h3>
							<h6>최근에 재생한 음악을 기반으로 추천드립니다.</h6>
							<!-- <div class="podlisttext">
								<a href="../list/relist.jsp">모두 보기</a>
							</div>
							 -->
							 <ul>
								 <%
								 if (L_dto.Lately(Integer.toString(uno)) == false)
								 {
								 %>
									<li><a href="#"> <img
											src="../img/noplay.jpg	"
											alt="노래가 없습니다"> 
											<div id="albuminfo"><span id="artist_name">나만의 추천</span><br><span id="album_name">노래가 없습니다</span></div>
									</a></li>
								<%
								}else
								{
									//System.out.println("유자반하"+uno);
									L_dto.Lately(Integer.toString(uno));				//노래의 토탈값을 가져오기 위한 값
									int L_total = L_dto.getTotalCount();				// 유저번호에 대한 최근들은 노래의 토탉밧
									
									L_dto.Latelysong(Integer.toString(uno)); 			//노래 번호를 가져오기 위한 값
									if (L_total>4 )
									{
								 		for(int a = 0; a<4; a++)
								 		{
								 			
								 			PlayerDTO p_dto = new PlayerDTO();			//음악 정보를 가져오기 위한 작업
							    			PlayerVO  p_vo  = new PlayerVO();			//음악 정보를 가져오기 위한 작업
							    			
								 			L_vo = L_dto.getItem(a);
								 			//System.out.println("메인에 넘어오는 번호 확인용"+L_vo.getMno());
								 			p_vo = p_dto.getMusic(L_vo.getMno());
								 			
										    String album   = p_vo.getAlbum();
										    String singer  = p_vo.getSinger();
										    String title   = p_vo.getTitle();
										    String url     = p_vo.getImg_url();
										    String mno     = p_vo.getMno();
							    		%>	 
											<li onclick ="changeIframeUrl('../list/relist.jsp?);"><a href="../list/srelist.jsp?mno=<%= mno %>&title=<%= title %>"><img
													src="<%=url %>" 
													alt="https://musicmeta-phinf.pstatic.net/album/005/902/5902422.jpg?type=r480Fll&v=20210806065522">
													<div id="albuminfo"><span id="artist_name"><%= singer %></span><br><span id="album_name"><%= title %></span></div>
											</a></li>

									<%
									   }
									}else
									{
										for(int a = 0; a<L_total; a++)
								 		{
								 			PlayerDTO p_dto = new PlayerDTO();			//음악 정보를 가져오기 위한 작업
							    			PlayerVO  p_vo  = new PlayerVO();			//음악 정보를 가져오기 위한 작업
							    			
											L_vo = L_dto.getItem(a);
											
											
											p_vo = p_dto.getMusic(L_vo.getMno());
								 			
										    String album   = p_vo.getAlbum();
										    String singer  = p_vo.getSinger();
										    String title   = p_vo.getTitle();
						 				    String url     = p_vo.getImg_url();
						 				    String mno     = p_vo.getMno();
									 		%>	
									 		 
											<li onclick ="changeIframeUrl('../list/relist.jsp?);"><a href="../list/srelist.jsp?mno=<%= mno %>&title=<%= title %>"><img
													src="<%=url %>" 
													alt="https://musicmeta-phinf.pstatic.net/album/005/902/5902422.jpg?type=r480Fll&v=20210806065522">
													<div id="albuminfo"><span id="artist_name"><%= singer %></span><br><span id="album_name"><%= title %></span></div>
											</a></li>
									  <%
									  	}
									}
								}
								%>
							 </ul>
						</div>
						<%
						if(total != 0)
						{ 
						%>
						<div class="podcast">
							<h3>내 플레이리스트</h3>
							<h6>내 플레이리스트 입니다.</h6>
							<!-- <div class="podlisttext">
								<a href="../list/relist.jsp">모두 보기</a>
							</div>
							 -->
							<ul>
								<%
			               		 for(int y = 0; y < total; y++)
			                     {
			            	     	vo = dto.getItem(y);
			            	     	//main_dto.PlaylistMusic(uno,vo.getPno());
			            	     	System.out.println("pno : " + vo.getPno());;
			               		 %>
			               	  		<li onclick ="changeIframeUrl('../list/playlist.jsp?pno=<%= vo.getPno()%>&pname=<%= vo.getP_name()%>');">
			               	  			<a href="#">
			               	  			<%
			               	  			if(vo.getImg_url() != null)
			               	  			{
			               	  			%>
										<img src="<%= vo.getImg_url()%>" alt="../img/noplay.jpg	">
										<%
			               	  			}else
			               	  			{
			               	  			%>
			               	  				<img src="../img/noplay.jpg" alt="../img/noplay.jpg">
			               	  			<% 
			               	  			}
			               	  			if(vo.getSinger() != null || vo.getAlbum() != null)
			               	  			{
										%>
										 	 <div id="albuminfo"><span id="artist_name"><%= vo.getP_name() %></span><br><span id="album_name"><%= vo.getSinger()%> 의 <%= vo.getAlbum() %> 등</span></div>
										<%
			               	  			}else
			               	  			{
										%>
											<div id="albuminfo"><span id="artist_name">노래가 없습니다</span><br><span id="album_name"></span></div>
										<%
			               	  			}
										%>
									</a></li>
			               		 <%
			                     } 
			                     %>
							</ul>
						<%
						}
						%>
						</div>
						<br><br><br><br><br>
						<%
						}
						if(login != null)
						{ 
						%>
						<br><br><br>
						<%
						} 
						%>
					</div>
				</div>
			</div>
<%@ include file="../include/tail.jsp" %>