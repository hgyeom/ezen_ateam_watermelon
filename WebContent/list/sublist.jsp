<%@ page contentType="text/html;charset=utf-8" %>	
<%@ include file="../include/head.jsp" %>
<%
if(login == null)
{
	response.sendRedirect("../main/main.jsp");
}


%>
<!-- ===================================================================== -->
    		<div class="sub-wrap" id="sub-wrap2">
				<div class="nav">
					<div id="nav">  검색하기 ▶  추천</div>
				</div>
			    <div class="contents">
			      	<div class="container">
						<%
							for (int i = 1; i <= 2; i++) {
						%>
						<div class="podcast">
							<h3>검색 세부 페이지</h3>
							<h6>sublist 구현 예정</h6>
							<div class="podlisttext">
								<a href="../list/relist.jsp">모두 보기</a>
							</div>
							<ul>
								<li><a href="../list/playlist.jsp"> <img
										src="https://cdnimg.melon.co.kr/cm/album/images/003/48/330/348330_500.jpg/melon/resize/282/quality/80/optimize"
										alt="https://cdnimg.melon.co.kr/cm/album/images/003/48/330/348330_500.jpg/melon/resize/282/quality/80/optimize"> 
										<div id="albuminfo"><span id="artist_name">이승철</span><br><span id="album_name">Live + Sound Of Double</span></div>
								</a></li>
								<li><a href="../list/playlist.jsp"> <img
										src="../img/sunmi.png" 
										alt="img/sunmi.png">
											<div id="albuminfo"><span id="artist_name">선미</span><br><span id="album_name">6분의 1</span></div>
								</a></li>
								<li><a href="../list/playlist.jsp"> <img
										src="../img/AKMU.png" 
										alt="img/AKMU.png"> 
										<div id="albuminfo"><span id="artist_name">AKMU</span><br><span id="album_name">NEXT EPISODE</span></div>
								</a></li>
								<li><a href="../list/playlist.jsp"> <img
										src="https://musicmeta-phinf.pstatic.net/album/005/902/5902422.jpg?type=r480Fll&v=20210806065522" 
										alt="https://musicmeta-phinf.pstatic.net/album/005/902/5902422.jpg?type=r480Fll&v=20210806065522">
										<div id="albuminfo"><span id="artist_name">방탄소년단</span><br><span id="album_name">Butter</span></div>
								</a></li>
								<li><a href="../list/playlist.jsp"> <img
										src="../img/BeWhy.jpg" 
										alt="img/BeWhy.jpg">
										<div id="albuminfo"><span id="artist_name">BewhY</span><br><span id="album_name">The Movie Star</span></div>
								</a></li>
							</ul>
						</div>
						<div class="podcast">
							<h3>검색 세부 페이지</h3>
							<h6>sublist 구현 예정</h6>
							<div class="podlisttext">
								<a href="#">모두 보기</a>
							</div>
							<ul>
								<li><a href="../list/playlist.jsp"> <img
										src="https://musicmeta-phinf.pstatic.net/album/006/400/6400461.jpg?type=r360Fll&v=20210908180510"
										alt="https://musicmeta-phinf.pstatic.net/album/006/400/6400461.jpg?type=r360Fll&v=20210908180510"> 
										<div id="albuminfo"><span id="artist_name">CL</span><br><span id="album_name">SPICY</span></div>
								</a></li>
								<li><a href="../list/playlist.jsp"> <img
										src="https://musicmeta-phinf.pstatic.net/album/006/400/6400333.jpg?type=r360Fll&v=20210908175913" 
										alt="https://musicmeta-phinf.pstatic.net/album/006/400/6400333.jpg?type=r360Fll&v=20210908175913">
											<div id="albuminfo"><span id="artist_name">이센스윙스</span><br><span id="album_name">사람이 먼저다</span></div>
								</a></li>
								<li><a href="../list/playlist.jsp"> <img
										src="https://musicmeta-phinf.pstatic.net/album/006/400/6400790.jpg?type=r360Fll&v=20210908175914" 
										alt="https://musicmeta-phinf.pstatic.net/album/006/400/6400790.jpg?type=r360Fll&v=20210908175914"> 
										<div id="albuminfo"><span id="artist_name">퍼플키스</span><br><span id="album_name">HIDE & SEEK</span></div>
								</a></li>
								<li><a href="../list/playlist.jsp"> <img
										src="https://musicmeta-phinf.pstatic.net/album/006/400/6400292.jpg?type=r360Fll&v=20210908115931" 
										alt="https://musicmeta-phinf.pstatic.net/album/006/400/6400292.jpg?type=r360Fll&v=20210908115931">
										<div id="albuminfo"><span id="artist_name">ICHILLIN'</span><br><span id="album_name">GOT'YA</span></div>
								</a></li>
								<li><a href="../list/playlist.jsp"> <img
										src="https://musicmeta-phinf.pstatic.net/album/006/399/6399728.jpg?type=r360Fll&v=20210908115928" 
										alt="https://musicmeta-phinf.pstatic.net/album/006/399/6399728.jpg?type=r360Fll&v=20210908115928">
										<div id="albuminfo"><span id="artist_name">한살차이</span><br><span id="album_name">If You</span></div>
								</a></li>
							</ul>
						</div>
						<%
							}
						%>
					</div>
				</div>
			</div>		
      </div>
<%@ include file="../include/tail.jsp" %>