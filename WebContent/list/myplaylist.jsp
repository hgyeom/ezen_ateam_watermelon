<%@ page contentType="text/html;charset=utf-8" %>	
<%@ include file="../include/head.jsp" %>
<!-- ===================================================================== -->
<%
if(login == null)
{
	response.sendRedirect("../main/main.jsp");
}

//dto.getItem(uno);


%>
   <div class="sub-wrap" id="sub-wrap2">
	<div class="nav">
			<div id="nav">  내 플레이리스트</div>
		</div>    
      <div class="contents">
      	<div class="podlisttext">	
      		<h3>내 플레이리스트</h3>
      	</div>
         <div class="podcast">
            <ul>
			<%
			for(int y = 0; y < total; y++)
    		{
 				vo = dto.getItem(y);
 				
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
         </div>  
    </div>  
  </div>  
<%@ include file="../include/tail.jsp" %>