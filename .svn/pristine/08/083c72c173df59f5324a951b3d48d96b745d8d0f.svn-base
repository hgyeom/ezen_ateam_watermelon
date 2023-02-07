<!-- *************************************************************************************

작성자 : 장가영
작성일 : 2021-09-13

기능 : 오디오 플레이어 구현
		1.오디오 플레이시 최근 재생몽록 갱신 및 최대 50개 까지 저장하는 쿼리 - 두성수			2021.10.01


**************************************************************************************************** -->

<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="VO.*" %>
<%@ page import="DTO.*" %>
<%
LoginVO login   = (LoginVO)session.getAttribute("login");
String mno_list = request.getParameter("mno");
String[] mno_array = null;
if(mno_list != null)
{
	mno_array = mno_list.split(",");
}
/*
System.out.println("플레이어세션유지 확인:"+ login);
System.out.println("플레이어번호 확인:"+ login.getUno());
*/


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="../css/audio.css">
<script src="../js/jquery-3.6.0.js"></script>
<script src="../js/audio.js"></script>
</head>
<body>
	<audio id="audioContainer"><!-- audio play를 위함 -->
		<source id="audioSource">
		<%
		if(mno_array != null)
		{
			for(int i=0; i < mno_array.length; i++)
			{
				PlayerDTO dto =  new PlayerDTO();
				PlayerVO vo   = dto.getMusic(mno_array[i]);
				if(vo != null)
				{
					%>
					<source src="/wav/<%= vo.getMno() %>.wav" artist="<%= vo.getSinger() %>" title="<%= vo.getTitle() %>"  img="<%= vo.getImg_url() %>" mno="<%= vo.getMno() %>" uno="<%= login.getUno() %>">
					<%
				}
			}
		}
		%>

	</audio>
    <div class="page_two">
      <div class="page_two__main">
		<div class="playcontainer1">      
	        <div class="page_two__main__current_music_photo">
	          <img id="music_img" name="music_img" src="../img/noplay.jpg" />
	        </div>
	        <div class="page_two__main__current_music_info">
	          <div class="currrent_music_info__title"></div>
	          <div class="currrent_music_info__singer"></div>
	        </div>
	    </div>    
        <div class="playcontainer2">
	        <div class="page_two__main__play_time">
	          <span id="curtime"></span>
	          <span id="duration"></span>
	        </div>
	        <div class="page_two__main__time_bar">
	          <div class="time_bar__time_stamp"></div>
	          <i class="fas fa-circle"></i>
	        </div>
	        <div class="page_two__main__controller">
	          <i id="loopBtn" class="fas fa-sync-alt" onclick="toggleLoop($('#loopBtn'));"></i>
	          <i id="preBtn" class="fas fa-fast-backward"></i>
	          <i id="playBtn" class="fas fa-play-circle" onclick="togglePlay($('#playBtn'));"></i>
	          <!--  <i id="pauseBtn" class="fas fa-pause-circle"></i>-->
	          <i id="nextBtn" class="fas fa-fast-forward"></i>
	          <i id="randomBtn" class="fas fa-random" onclick="toggleRandom($('#randomBtn'));"></i>
			</div> 
		 </div>	    
	     <div class="playcontainer3">     
	          
	          <i id="volBtn" class="fas fa-volume-up" onclick="toggleVolume($('#volBtn'));"></i>
	          <!--
	          <div class="page_two__main__volume_bar">
		          <div class="volume_bar__volume_stamp"></div>
		          <i class="fas fa-circle"></i>
	       	  </div>
	       	  -->
	       	  <input id="volBar" type="range" min="0" max="100" step="1" value=""
	          oninput="set_vol(this.value)">
	          <i id="listBtn" class="fas fa-list" onclick="javascript:ViewPlayList();"></i>
	     </div>   
	   </div>     
      </div>
    </div>
    <script
      src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous">
    </script>

</body>
</html>