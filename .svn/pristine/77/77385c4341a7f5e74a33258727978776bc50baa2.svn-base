/*=============================================================================================================================
작성자 : 장가영
작성일 : 2021-09-13
기능 : 오디오 플레이어
		1. 음악로드, 재생, 일시정지 구현    						2021.09.13
		2. 이전곡 재생, 다음곡 재생, 볼륨컨트롤 구현				    2021.09.14
		3. 재생시간 구현 , 주석								2021.09.16
		4. 프로그래스 바 이동, 아티스트명, 음악명, 앨범이미지 출력		2021.09.23
		5. 볼륨 상세 이벤트 구현(클릭토글, 볼륨 값에 따라 토글)		    2021.09.24
		6. 재생, 일시정지 버튼 토글							    2021.09.26
		7. 루프, 셔플 버튼 이벤트
		8. 노래가 재생이 되었을때 최근재생목록으로 만들기	-두성수		2021.10.01
=============================================================================================================================*/


var audioPlayer = null; // audio 태그
var playBtn     = null; // 재생 버튼
var pauseBtn    = null; // 일시정지 버튼-->토글
var NextBtn     = null; // 다음음악 버튼
var PreBtn      = null; // 이전음악 버튼
var VolBtn      = null; // 볼륨 컨트롤 버튼
var progressBar = null; // 재생로딩바 
var loopBtn     = null; // 루프 버튼
var randomBtn   = null; // 셔플 버튼
var PlayList    = []; 	// 총 음악갯수
var TitleList   = []; 	// 총 음악갯수 대비 제목
var SingerList  = []; 	// 총 음악갯수 대비 가수
var ImgList     = []; 	// 총 음악갯수 대비 이미지
var PlayNo 	    = -1;	// 현재음악번호
var PlayMode    = 0;    //0-셔플X, 1-셔플O
var RandMode    = 0;    //0-랜덤X, 1-랜덤O

//===================================플레이어를 초기화 한다. ===========================================

window.onload = function()
{
	//===================== audio.jsp에서 id 불러오기================================================
	
	audioPlayer = document.querySelector('#audioContainer'); 			// audio 태그
	playBtn     = document.querySelector('#playBtn');					// 재생 버튼
	//pauseBtn  = document.querySelector('#pauseBtn');					// 일시정지 버튼-->토글
	NextBtn     = document.querySelector('#nextBtn');					// 다음음악 버튼
	PreBtn      = document.querySelector('#preBtn'); 					// 이전음악 버튼
	VolBtn      = document.querySelector('#volBtn'); 					// 볼륨 컨트롤 버튼
	progressBar = document.querySelector('.page_two__main__time_bar'); 	// 재생로딩바 
	loopBtn     = document.querySelector('#loopBtn');					// 루프 버튼
	randomBtn   = document.querySelector('#randomBtn');					// 셔플 버튼
	
	//======================== audio.jsp에서 클릭이벤트 시 작동 ========================================
	
	//playBtn.addEventListener('click', playAudio);    
	//pauseBtn.addEventListener('click', pauseAudio);
	NextBtn.addEventListener('click', handleNextBtnClick);
	PreBtn.addEventListener('click', handlePreBtnClick);
	VolBtn.addEventListener('click', set_vol);
	progressBar.addEventListener('mousedown', BeginProgress);
	progressBar.addEventListener('mouseup', EndProgress);

	//=========================== audio.jsp에서 audio태그 source에서 재생목록을 로드 =====================
	
	PlayList = [];  //플레이리스트
	
	$("#audioContainer source").each(function(index,item)
	{
		if(item.src != "")
		{
			PlayList.push(item.src);					//플레이리스트 불러오기
				
			TitleList.push($(item).attr("title"));  	//곡명 불러오기
				
			SingerList.push($(item).attr("artist")); 	//가수명 불러오기

			ImgList.push($(item).attr("img"));			//앨범이미지 불러오기
		}
		
	});
	PlayNo = 0;    //플레이리스트 첫 순서
	
	
	
	//============================= 음악종료 후 다음곡 자동재생 =========================================
	
	$("#audioContainer").bind('ended', function()
	{
		handleNextBtnClick();
	});	
	
	//=================================현재 재생시간, 음악 전체시간 초기화  ===============================
	
	$("#curtime").text('00:00');					
	$("#duration").text('00:00');
	
	// =============================== 볼륨 초기화 =================================================

	audioPlayer.volume = 0.5;
	
	// =============================== 볼륨 크기에 따라 볼륨 아이콘 토글 ==================================
	
	$("input#volBar").mouseup(function(){
		
		if(audioPlayer.volume == 0)
		{ 
			//볼륨크기가 0일 때 음소거 아이콘으로 변경한다.
			$('#volBtn').attr('class','fas fa-volume-mute');
		}else
		{
			$('#volBtn').attr('class','fas fa-volume-up');
		}	
	});

	
}	

//========================================볼륨 조절================================================

function set_vol(val){	
	
	audioPlayer.volume = val / 100; 
}

// =================================볼륨버튼 토글(볼륨<->음소거)=======================================

function toggleVolume(id) {

	if(id.hasClass('fa-volume-up')){ 
    	// 볼륨 -> 음소거
    	id.removeClass('fa-volume-up');
    	id.addClass('fa-volume-mute');
    	audioPlayer.muted = true;
    	$("input#volBar").val("0");  					//range를 0으로 바꾼다.
    	
    }else if(id.hasClass('fa-volume-mute')){
    	// 음소거 -> 볼륨
    	id.removeClass('fa-volume-mute');
    	id.addClass('fa-volume-up');
    	$("input#volBar").val(audioPlayer.volume * 100);  //음소거 전 볼륨값으로 되돌린다.
    	audioPlayer.muted = false;
    	
    }
}


/*
 * 오디오 재생시 인터벌 시작 : 재생 로딩바 시작 : 재생시간 포맷 변경 시작
 */
//==============================================음악 재생 시간 출력===================================
function startAudioTimer(){
	// 플레이어가 재생중일 때 실시간재생 시간을 초단위로 출력한다.
	var progressBar = $('.time_bar__time_stamp');
	var progress_val = 0;							 // 재생로딩바 값
	var playtime = 0;								 // 재생시간 값
	
	audioTimer = setInterval(function(){  					// math.round = 00:00 형태로 변환
		currentTime = Math.round(audioPlayer.currentTime);  // audio태그에서 현재 재생시간 가져온다.
		duration = Math.round(audioPlayer.duration);		// audio태그에서 음악 전체시간 가져온다.
		playtime = setTimeFormat(currentTime);				// 현재 재생시간의 포맷을 변경한다.
		maxtime = setTimeFormat(duration);					// 음악 전체시간의 포맷을 변경한다.

		progress_val = (currentTime/duration)* 100;			// 전체 음악시간을 100으로 잡고  현재 재생시간을 계산
		progress_val = progress_val.toFixed(1);				// 소숫점 첫째자리까지 나타낸다.
		
		$("#curtime").text(playtime);						// 현재 재생시간을 audio.jsp에 출력한다.
		$("#duration").text(maxtime);						// 전체 음악시간을 audio.jsp에 출력한다.
		progressBar.css("width", progress_val + "%");		// 재생 시간 1초당 전체로딩바 width 증가하도록
	}, 1000);
	
}


// =========================================재생시간 포맷 변경=========================================

function setTimeFormat(sec_time){
	var sec_num = sec_time;							// 초 단위의 현재재생시간
	var minutes = Math.floor(sec_num / 60);         // 초 단위의 현재재생시간 계산, 
													// math.floor로 소숫점 절삭하여 분에 해당하는 몫을 구한다.
	var seconds = sec_num - (minutes * 60);			// 계산하여 초 값을 구한다.
	
	if(minutes < 10) { minutes = "0"+ minutes;}		
	if(seconds < 10) { seconds = "0"+ seconds;}
	
	return minutes + ":" + seconds;					// startAudioTimer에
													// playtime, maxtime으로 return
}


/* ========================================= 재생중인 음악의 프로그래스바 이동 =============================
 * BeginProgress - mousedown 이벤트
 * EndProgress   - mouseup 이벤트
 */

function BeginProgress()
{
	if( $("#duration").text() == "00:00")
	{
		alert("재생중인 음악이 없습니다.");
		return;
	}	
}

function EndProgress()
{
	if( $("#duration").text() == "00:00")
	{
		//alert("재생중인 음악이 없습니다.");
		return;
	}
	
	var ProcBar = $(".time_bar__time_stamp");
	
	//alert(event.pageX);
	//alert(this.offsetLeft);
	
	//현재 클릭된 프로그래스바의 길이
	var curWidth = event.pageX - this.offsetLeft;
	//alert(curWidth);
	
	//프로그래스바의 전체 길이
	var totalWidth = this.offsetWidth;
	//alert(totalWidth);
	
	//프로그래스바를 칠한다.
		
	//클릭된 위치가 몇 퍼센트인지 계산!!
	var percent = (curWidth * 100)/totalWidth;
	
	var progressBar = $('.time_bar__time_stamp');
	//alert(percent);
	progressBar.css("width", percent + "%");
	//alert(percent);
	
	//전체 시간 대비 클릭된 위치로 이동
	playtime = (audioPlayer.duration * percent)/100;
	audioPlayer.currentTime = playtime;	
}


// ===================================음악을 재생한다.(처음 재생 시 기본 값 세팅)=================================
function playAudio(){
	
	//alert(audioPlayer.currentTime);
	
	if(audioPlayer.currentTime != 0) // 일시정지 후 시작
	{
		audioPlayer.play();
	}else	                         // 처음부터 시작
	{
		var source = document.querySelector('#audioSource');
		source.src = PlayList[PlayNo];
		audioPlayer.load();
		
		//mno 를 가져오기 위한 값
		var mno = source.src.replace("http://localhost:8080/wav/","").replace(".wav","").replace("http://192.168.0.70:8080/wav/","")
		audioPlayer.loop = false;
		audioPlayer.play();				// 음악 재생
		
/*=========================================================================================================================
 * ajax를 이용하여서 음악번호를 보내서 Latelyok페이지에서 업데이트/인서트를 해준다.
 =========================================================================================================================*/
		//alert("확인용 mno :"+ mno);
		$.ajax({
			url : 'Latelyok.jsp', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
			mathod : 'get',
			data : {
			mno : mno 				//Latelyok.jsp페이지로 데이터를 보냄
			},
			success : function(data){ //DB접근 후 가져온 데이터
			
			}
			})


		
		startAudioTimer();				// 음악 재생 시 실시간재생 시간을 초단위로 출력하는 코드
		// 곡명을 표시한다. (디버그용)
		//$(".currrent_music_info__singer").html(source.src);
		
		//곡 이미지 표시			
		$("#music_img").attr("src" ,ImgList[PlayNo]);
		
		//곡명 표시
		$(".currrent_music_info__title").html(TitleList[PlayNo]);
		
		//가수명 표시
		$(".currrent_music_info__singer").html(SingerList[PlayNo]);
		
		//특정 시간으로 점프
		//audioPlayer.currentTime = 65;
	}

}


//=====================================음악을 일시정지한다.=====================================

function pauseAudio(){
	
	audioPlayer.pause();
}

//================================재생버튼 토글(재생<->일시정지)==================================

function togglePlay(id) 
{
	if(PlayList[PlayNo] != null)
	{	
		if(id.hasClass('fa-play-circle'))
		{ // 재생버튼 -> 일시정지버튼
			 id.removeClass('fa-play-circle');
			 id.addClass('fa-pause-circle');
			 playAudio();
			  
		}else if(id.hasClass('fa-pause-circle'))
		{ // 일시정지버튼 -> 재생버튼
			
			id.removeClass('fa-pause-circle'); 
			id.addClass('fa-play-circle');
			pauseAudio();
		}
	}else{
		alert("음악을 선택하세요.");
	}	
}

// ==================================다음음악재생 버튼클릭이벤트====================================
// 현재 재생음악과 전체 음악 수를 계산하여 작동.
// 다음으로 넘어갈 때 일시정지 후 음악로드->플레이로 작동.

function handleNextBtnClick()
{
	if(PlayList[PlayNo] != null)
	{
		if(PlayNo < 0)
		{
			loadAudio();
		}else
		{
			if(RandMode == 0)
			{
				//뒤섞지 않음
				PlayNo += 1;
			}else
			{
				//N개 음악에서 랜덤한 음악번호 생성
				r = Math.random() * 1000;
				r = (r % (PlayList.length - 1)) + 1;
				r = parseInt(r);
				PlayNo = r;
			}
				 
			if(PlayNo > (PlayList.length-1)){
				//마지막 곡임.
				if(PlayMode == 1)
				{
					//반복재생
					PlayNo = 0;
				}else
				{
					//전곡재생끝
					PlayNo = PlayList.length-1;
					audioContainer.pause();					
					alert("마지막 곡까지 재생이 완료되었습니다.");
					return;
				}				
			}
			audioContainer.pause();
			audioPlayer.currentTime = 0;
			playAudio();
		}   
	}else
	{
		alert("음악을 선택하세요.");
	}		
}


// ===================================이전음악재생 버튼클릭이벤트====================================
// 현재 재생음악과 전체 음악 수를 계산하여 작동.
// 다음으로 넘어갈 때 일시정지 후 음악로드->플레이로 작동.

function handlePreBtnClick(){
	if(PlayList[PlayNo] != null)
	{	
		if(PlayNo < 0)
		{
			loadAudio();
		}else
		{	
			
			PlayNo -= 1;
			if(PlayNo < 0){
				PlayNo = PlayList.length-1;
			}
			audioContainer.pause();
			audioPlayer.currentTime = 0;
			playAudio();
		}
	}else{
		alert("음악을 선택하세요.");
	}	
}


//==================================루프 버튼 클릭이벤트 =============================================

function toggleLoop(id) 
{
	if(PlayList[PlayNo] != null)
	{
		
		if(id.hasClass('active'))
		{
			//루프 해제
			id.removeClass('active');
			
			//전곡순차재생
			PlayMode = 0;
	               
      	}else
      	{
      		//루프 적용
      		id.addClass('active');
      		
			//전곡반복재생
			PlayMode = 1;      		
      	}
		//alert(PlayMode);
	}else{
		alert("음악을 선택하세요.");
	}	
}



//==================================셔플 버튼 클릭이벤트 =============================================

function toggleRandom(id) 
{
	if(PlayList[PlayNo] != null)
	{
		if(id.hasClass('active'))
		{
			//셔플 해제
			id.removeClass('active');
			
			RandMode = 0;
	               
      	}else
      	{
      		//셔플 적용
      		id.addClass('active');
      		
      		RandMode = 1;
      	}
	}else{
		alert("음악을 선택하세요.");
	}	
}

function ViewPlayList()
{
	window.parent.ViewPlayList();
	//$("mainFrm").document.location = "../list/playerlist.jsp";
	//playURL = url;
}

//재생바를 이동시킨다.
//jQuery slider	
/*
$(document).on('mousedown', progressBar, function(){

	progressBar.slider({
		slide:function(event,ui){
			progress_val : ui_value;
			if(progress_val = 0)
			{
				playAudio();
			}else
			{
				progressBar.css("width", ui_value, "%");		// 재생 시간 1초당 전체로딩바 width 증가하도록
			}	
		}	
	});
});
*/