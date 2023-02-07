<%@ page contentType="text/html;charset=utf-8" %>	
<%@ include file="../include/head.jsp" %>
<%
if(login == null)
{
%>
	<script>
	alert("로그인 후 이용 가능합니다.");
	document.location = "../main/main.jsp";
	</script>
<%
}

likelistDTO like_dto= new likelistDTO();
PlaylistVO  like_vo = null;

int total_like = like_dto.TotalLike(uno);
like_dto.Getlikelist(uno);

String mno_list = "";
int ptotal = dto.CountPlaylist(uno);//플레이리스트에 추가를 위해 플레이리스트 수를 얻어옴
%>
<script>
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
</script>
		<!-- ===================================================================== -->
			<div class="sub-wrap" id="sub-wrap2">
				<div class="nav">
					<div id="nav">  좋아요 표시한 곡</div>
				</div>
				<div class="contents">
					<div class="a-container1">
					   	<div class="p-container1">
						   	<div class= "p-subcon1">
						   		<ul class="l-subcon">
						   			<li><i class="fas fa-heart fa-4x" aria-hidden="true"></i><h1>좋아요 표시한 곡</h1></li>
						   			<li><span>●&nbsp;<%=total_like %>곡 </span></li>
						   		</ul>
						   	</div>
					   </div>
					   <div class="p-container2">
					   	<div class="p-subcon2">
					    	<ul>
					    		<li><a href="javascript:DoPlay();"><i class="fa fa-play-circle fa-3x" aria-hidden="true"></i></a></li> 
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
			  					for(int i = 0; i < total_like; i++)
			  					{
			  						like_vo = like_dto.getItem(i);
									
			  						String ptime = like_vo.getPtime();
			  		                String mno = String.valueOf(like_vo.getMno());
			  					    double time = Double.parseDouble(ptime);       	// 플레이 타임을 문자열에서 실수형으로 변환
			  					    double min;
			  					    double sec;
			  					    time = Math.round(time);							// 소수 첫째자리 기준으로 반올림
			  					    min = time/60;									// 분을 구하는 공식
			  					    sec = Math.round(time%60);						// 초를 구하는 공식
			  					    if( mno_list != "")								
			  					    {
			  					  	  mno_list += ",";         				
			  					    }
			  					    mno_list += mno;
			  					  	System.out.println("liketoplaylist mno : " + like_vo.getMno());
			  					%>
			  					<!-- ============================= mno , uno 히든값 지정 ================================= -->
	         					<input type="hidden" id="likemno<%=i %>" name="likemno<%=i %>" value="<%= mno %>">
	         					<input type="hidden" id="likeuno<%=i %>" name="likeuno<%=i %>" value="<%= uno %>">
	         					<!-- ============================= mno , uno 히든값 지정 ================================= -->
								<ul class="p-list">
					       			<li class="p-no"><%= i +1%></li>
					       			<li class="p-play"><i onclick="javascript:DoPlay('<%= mno %>');" class="fas fa-play fa-lg"></i></li>
					       			<li class="p-title"><%= like_vo.getTitle() %></li>
					       			<li class="p-name"><%= like_vo.getSinger() %></li>
					       			<li class="p-album"><%= like_vo.getAlbum() %></li>
					       			<li class="p-time"><%=(int)min %>분 <%=String.format("%02d",(int)sec)%>초</li>
					       			<li class="p-info"><a href="javascript:GetModalPage('../list/music_info.jsp');"><i class="far fa-file-alt fa-lg"></i></a></li>
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
							} 
							%>
							<ul><li class="endline"></li></ul>
							<input type="hidden" id="mno" name="mno" value="<%= mno_list %>">
			        	</div>
			        </div>  
			     </div>   
			</div>			     
		  </div> 
		</div>   
<%@ include file="../include/tail.jsp" %>