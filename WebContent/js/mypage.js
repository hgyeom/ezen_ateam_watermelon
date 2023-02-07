/*=============================================================================================================================
작성자 : 노동혁
작성일 : 2021-09-27
		1. 회원정보변경 자바스크립트(AJAX)기능구현     2021.09.27
		
=============================================================================================================================*/
	
	function Mymodiok2(page) 
	{
		var userpw = $("#userpw").val();
		var comfirm = $("#userpw_comfirm").val();
		
		if(userpw =="" & userpw_comfirm=="")//유저비밀번호,비밀번호 확인입력 칸이 입력이되지않았을때
		{
			$(".alert_pw").html("비밀번호를 입력하세요!");						//유저비밀번호 알림을 DIV에 알림지정
			//$( "#alert_userid" ).css( 'outline-color', '#ff0d0d' );
			$(".alert_pw_cofirm").html("비밀번호확인칸을 입력하세요!");			//비밀번호확인입력을 DIV에 알림지정
			$("#userpw").focus();
			return;
		}else if(userpw == "")
		{
			$(".alert_pw").html("비밀번호를 입력하세요!");						//유저비밀번호 알림을 DIV에 알림지정

			$("#userpw").focus();
			return;
		}else if(comfirm == "")
		{
			$(".alert_pw_cofirm").html("비밀번호확인칸을 입력하세요!");			//비밀번호확인입력을 DIV에 알림지정
			$("#userpw_comfirm").focus();		
			return;
		}else if(userpw != "")
		{
			$(".alert_pw").text("");									//alert_pw 클라스를 가진 DIV의 값을 ""으로 지정
		}
		
		//log_arr 배열 선언
		arr    = [];
		
		//"login" 에서 입력한 회원가입 정보를  arr[0]에 합쳐서 넣어준다.
		arr[0] = userpw + "<!>" + comfirm;
		
		$.ajax({
			url: "../mypage/mymodiok.jsp",
			type: "post",
			dataType: "html",
			traditional : true,											//AJAX에서 배열을 넘기기위해  "traditional : true" 라는 데이터 직렬화 옵션 넣어주기
			data: {"arr" : arr},
			success: function(data)
			{			

				alert("비밀번호가 변경되었습니다.");
				document.location="../main/index.jsp";					//회원가입마치고 바로 index.jsp페이지로 이동
			},
			error: function (request, status, error)
			{
				alert(" Mymodiok error!!");
			}
		});
	}
	
/*=============================================================================================================================*/
	/*   
	<traditional> 
	- Type: Boolean.
	- 데이터에 배열을 전송할 때 데이터 직렬화를 하는 옵션이다.
	- $.ajaxSettings,traditional = true, 로 적어도 된다. */
	