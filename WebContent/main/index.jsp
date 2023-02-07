<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="VO.*" %>
<%@ page import="DTO.*" %>
<%
LoginVO login   = (LoginVO)session.getAttribute("login");
System.out.println("index.jsp 세션확인: "+ login);
String unn  	= (String)session.getAttribute("uno");
System.out.println("uno 세션 : " + unn);
%>    


<script type="text/javascript">



var mainURL 	= "main.jsp";
var playURL 	= "../include/player.jsp";

var mainFrame   = null;
var playerFrame = null;

/*==================================================================
 세션에서 값을 받아와서 LoginCheck의 변수에 추가 해준다.
 ==================================================================*/
var LoginCheck  ="<%=(LoginVO)session.getAttribute("login")%>";     //로그인 세션을 LoginCheck에 추가해준다.

var play_list = null;
var uno = null;
var pno = null;

function DoPlay(mno_list)
{
	//플레이 목록을 기억시킨다.
	play_list = mno_list;
	
	playerFrame.src = playURL + "?mno=" + mno_list;
}

function ViewPlayList()
{
	
	if(play_list == null)
	{
		alert("재생목록에 음악이 없습니다.");
	}else
	{
	
	//alert(play_list);
	//$("#mainFrm").document.location = "../list/playerlist.jsp";
	//playURL = url;
	mainFrame.src = "../list/playerlist.jsp?mno=" + play_list;
	}
}

window.onload = function() 
{
	/*==================================================================
	 LoginCheck변수를 비교하여서 로그인세션이 null(없다면)이면  alert으로 사용자에게 알려준뒤
	 메인페이지로 이동시킨다.
	 ==================================================================*/
	if(LoginCheck=="null")
	{
		document.location="../main/main.jsp";
	}
		
	window.document.body.ownerDocument.clear();
	var ifrmFlag = document.getElementById('mainFrm');
	if(ifrmFlag != null && ifrmFlag != "null" && ifrmFlag != "")
	{
		document.body.removeChild(ifrmFlag);
	}
	mainFrame = document.createElement("iframe");
	mainFrame.id = "mainFrm";
	mainFrame.src = mainURL;
	mainFrame.width = "100%";
	mainFrame.height = "90%";
	//mainFrame.style.height = "calc(100% - 100px)";
	mainFrame.frameBorder = "0";
	mainFrame.scrolling = "yes";
		
	document.body.appendChild(mainFrame);
	if(LoginCheck!="null")
	{
		playerFrame = document.createElement("iframe");
		playerFrame.id = "subFrm";
		playerFrame.src = playURL;
		playerFrame.width = "100%";
		playerFrame.height = "100px";
		playerFrame.frameBorder = "0";
		playerFrame.scrolling = "no";	
		document.body.appendChild(playerFrame);
	}
};


</script>
 
<body topmargin="0" leftmargin="0" style="overflow: hidden;">
</body>
