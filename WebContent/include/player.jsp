<!-- 
작성자 : 두성수
작성일 : 2021-09-08
		1. 오디오 관련 기능구현    2021.09.08
-->
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="uft-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="../css/main.css">
	<link rel="stylesheet" href="../css/modal.css">
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="../js/list.js"></script>
</head>

<body>		
	<div class="aside">
		   <%@ include file="../include/audio.jsp" %>
		 </div>
			<!-- <div class="footer">copyright</div> -->
			
	
		<!-- <button id='play'>play</button> -->
<!--				
<script>

var index = 1;
	$('#next').click(function() {
		index++;
		if(index > $('#collect_a source').length) index=2;
		console.log( index + '번째 소스 재생' );
	
		$('#collect_a source#main').attr('src',
			$('#collect_a source:nth-child('+index+')').attr('src'));
		$("#collect_a")[0].load();
		$("#collect_a")[0].play();
	});

	$('#Pre').click(function() {
		index--;
		if(index < 2) index = $('#collect_a source').length;
		$('#collect_a source#main').attr('src',
				$('#collect_a source:nth-child('+index+')').attr('src'));
		$("#collect_a")[0].load();
		$("#collect_a")[0].play();	
	});
	
var index = 2;	
	var aud = document.getElementById("collect_a");
	aud.onended = function() {
		index++;
		console.log("abc")
		if(index > $('#collect_a source').length) index=2;
		
	
		$('#collect_a source#main').attr('src',
			$('#collect_a source:nth-child('+index+')').attr('src'));
		$("#collect_a")[0].load();
		$("#collect_a")[0].play();
	};
	
	document.querySelector("#music").addEventListener("ended", yourFunction, false);
	
	/*
	$('#Pre').click(function() {
		index--;
		if(index < $('#collect_a source').length) index=2;
		console.log( index + '번째 소스 재생' );
	
		$('#collect_a source#main').attr('src',
			$('#collect_a source:nth-child('+index+')').attr('src'));
		$("#collect_a")[0].load();
		$("#collect_a")[0].play();
	});
	*/
</script>
-->
</body>
</html>