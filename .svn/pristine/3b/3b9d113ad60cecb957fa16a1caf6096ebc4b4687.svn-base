/*=============================================================================================================================
작성자 : 노동혁
작성일 : 2021-09-13
		1. 로그인 자바스크립트(AJAX)기능구현     2021.09.13
		2. 기능 설명 주석처리					 2021.09.16
=============================================================================================================================*/
	
	//로그인완료 
    


	//loginok 메소드


	function changerloginid()
	{
		$(".alert_userid").html("");
	}
	
	function changerloginpw()
	{
		$(".alert_userpw").html("");
	}

	function LoginOk() 
	{		
			var userid = $("#userid").val();
			var userpw = $("#userpw").val();
			
			if(userid =="" & userpw=="")//유저아이디,유저비밀번호가 입력이되지않았을때
			{
				$(".alert_userid").html("아이디를 입력하세요!");				//아이디입력 알림을 DIV에 알림지정
				//$( "#alert_userid" ).css( 'outline-color', '#ff0d0d' );
				$(".alert_userpw").html("비밀번호를 입력하세요!");			//비밀번호입력 알림을 DIV에 알림지정
				$("#userid").focus();
				return;
			}else if(userid == "")
			{
				$(".alert_userid").html("아이디를 입력하세요!");				//아이디입력 알림을 DIV에 알림지정
	
				$("#userid").focus();
				return;
			}else if(userpw == "")
			{
				$(".alert_userpw").html("비밀번호를 입력하세요!");			//비밀번호입력 알림을 DIV에 알림지정
				$("#userpw").focus();		
				return;
			}else if(userid != "")
			{
				$(".alert_userid").text("");								//alert_id 클라스를 가진 DIV의 값을 ""으로 지정
			}
			
			$("#Modal_Login_btn").toggle();
			$("#Modal_Join_btn").toggle();
			$("#loding").toggle();
			
			//document.all.cattery.style.visibility="visible";
			
				
			//log_arr 배열 선언
			log_arr    = [];
			
			//"login" 에서 입력한 회원가입 정보를  arr[0]에 합쳐서 넣어준다.
			log_arr[0] = userid + "<!>" + userpw;
			
			$.ajax({
				url: "../login/loginok.jsp",
				type: "post",
				dataType: "html",
				traditional : true,											//AJAX에서 배열을 넘기기위해  "traditional : true" 라는 데이터 직렬화 옵션 넣어주기
				data: {"log_arr" : log_arr},
				success: function(data)
				{			
					document.location="../main/index.jsp";					//회원가입마치고 바로 main.jsp페이지로 이동
				},
				error: function (request, status, error)
				{
					alert("error!!");
				}
			});
	}
	
	function LoginOk() 
	{		
			var userid = $("#userid").val();
			var userpw = $("#userpw").val();
			
			if(userid =="" & userpw=="")//유저아이디,유저비밀번호가 입력이되지않았을때
			{
				$(".alert_userid").html("아이디를 입력하세요!");				//아이디입력 알림을 DIV에 알림지정
				//$( "#alert_userid" ).css( 'outline-color', '#ff0d0d' );
				$(".alert_userpw").html("비밀번호를 입력하세요!");			//비밀번호입력 알림을 DIV에 알림지정
				$("#userid").focus();
				return;
			}else if(userid == "")
			{
				$(".alert_userid").html("아이디를 입력하세요!");				//아이디입력 알림을 DIV에 알림지정
	
				$("#userid").focus();
				return;
			}else if(userpw == "")
			{
				$(".alert_userpw").html("비밀번호를 입력하세요!");			//비밀번호입력 알림을 DIV에 알림지정
				$("#userpw").focus();		
				return;
			}else if(userid != "")
			{
				$(".alert_userid").text("");								//alert_id 클라스를 가진 DIV의 값을 ""으로 지정
			}
			Modal_Join_btn
			$("#Modal_Login_btn").toggle();
			$("#Modal_Join_btn").toggle();
			$("#loding").toggle();
			
			//document.all.cattery.style.visibility="visible";
			
				
			//log_arr 배열 선언
			log_arr    = [];
			
			//"login" 에서 입력한 회원가입 정보를  arr[0]에 합쳐서 넣어준다.
			log_arr[0] = userid + "<!>" + userpw;
			
			$.ajax({
				url: "../login/loginok.jsp",
				type: "post",
				dataType: "html",
				traditional : true,											//AJAX에서 배열을 넘기기위해  "traditional : true" 라는 데이터 직렬화 옵션 넣어주기
				data: {"log_arr" : log_arr},
				success: function(data)
				{			
					document.location="../main/index.jsp";					//회원가입마치고 바로 main.jsp페이지로 이동
				},
				error: function (request, status, error)
				{
					alert("error!!");
				}
			});
	}
	
	
	
	

/*=============================================================================================================================*/
	/*   
	<traditional> 
	- Type: Boolean.
	- 데이터에 배열을 전송할 때 데이터 직렬화를 하는 옵션이다.
	- $.ajaxSettings,traditional = true, 로 적어도 된다. */
	