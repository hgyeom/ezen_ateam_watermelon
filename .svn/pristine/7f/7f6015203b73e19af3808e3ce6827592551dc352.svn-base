/*
작성자 : 장가영
작성일 : 2021-09-15	
기능: head.jsp에서 사용하는 script
	
===============================================================================
*/

//===================================================================로그인 버튼 이벤트


$(function(){ 
	  $("#btn-login").click(function(){
			GetModalPage("../login/login.jsp");
	  });
});


//=================================================================회원가입 버튼 이벤트

$(function(){
	$("#btn-join").click(function(){
		GetModalPage("../join/join.jsp");
	});
});



//================================================================유저아이콘 버튼 이벤트

$(function(){
	$(".userinfo .userbtn").hide();
	$(".userinfo").click(function(){
		$(".userinfo .userbtn").show();
		$("ul", this).mouseenter(function(){
			$("#btn-mypage").click(function(){
				GetMypageModal("../mypage/mypage.jsp");
			});
			$("#btn-playlist").click(function(){
        		document.location= "../list/myplaylist.jsp";
        		
        	});
        	$("#btn-logout").click(function(){
        		document.location= "../login/logout.jsp";
        	});
		});
		 $("ul", this).mouseleave(function(){
        	$(this).hide();
        });
 	});		
});

/*
//유저 아이콘 드롭다운 - 클릭 이벤트 시 slideToggle
 $(function () {
    $(".userinfo ul.userbtn").hide();
    $(".userinfo").click(function () {
        $("ul", this).slideToggle(300);
    
    	$("#golist").click(function(){
    		document.location= "../list/myplaylist.jsp";
    	});
    	
    	$("#gologout").click(function(){
    		document.location= "../login/logout.jsp";
    	});
    });
 });	 
 
*/


/*
 *  iframe 영역은 전체 페이지의 parent
 *  iframe name = mainFrm  
 *  iframe src  = mainURL
=========================================================================== 아이프레임 영역
*/

//iframe태그의 mainFrm src값 변경
function changeIframeUrl(url)
{
	 document.location = url;
	 //alert(url);
    //$("#mainFrm").attr('src',url);
	 parent.mainURL = url;
	 //alert(parent.mainURL);
}

//iframe 새로고침 이벤트 시 현재화면 유지된 상태로 새로고침 
window.onkeydown = function(e)
{
    /* 116 - F5,  Ctrl+F5 */
    if(e.keyCode == 116 || e.ctrlKey == true && (e.keyCode == 116)){
   	 
   	 //alert(parent.mainURL);	    	 
   	 parent.mainFrm.src = parent.mainURL;	    	 
        return false;
    }
}	 
