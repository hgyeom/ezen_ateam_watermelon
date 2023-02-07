/*=============================================================================================================================
작성자 : 김무겸
작성일 : 2021-09-30
		1. 플레이리스트 이름 변경     2021.09.30
		
=============================================================================================================================*/
	
	
	function RenamePlaylist(pno) 
	{
		var pl_name = $("#pl_name").val();
		var pno     = $("#renamepno").val();
		//alert(pno);
		
		if(pl_name =="" )
		{
			$(".alert_pl_name").html("변경할 이름을 입력하세요.");						//유저비밀번호 알림을 DIV에 알림지정
			$("#alert_pl_name").focus();
			return;
		}else if(pl_name != "")
		{
			$(".alert_pl_name").text("");									//alert_pw 클라스를 가진 DIV의 값을 ""으로 지정
		}
		
		arr = [];
		arr[0] = pl_name + "<!>" + pno;
		$.ajax({
			url: "../list/renameok.jsp",
			type: "post",
			dataType: "html",										
			traditional : true,											//AJAX에서 배열을 넘기기위해  "traditional : true" 라는 데이터 직렬화 옵션 넣어주기
			data: {"arr" : arr},
			success: function(data)
			{			
				alert("플레이리스트 이름이 변경되었습니다.");
				document.location = "../list/playlist.jsp?pno=" + pno + "&pname="+ pl_name;
			},
			error: function (request, status, error)
			{
				alert(" Rename error!!");
			}
		});
	}
	
/*=============================================================================================================================*/
	/*   
	<traditional> 
	- Type: Boolean.
	- 데이터에 배열을 전송할 때 데이터 직렬화를 하는 옵션이다.
	- $.ajaxSettings,traditional = true, 로 적어도 된다. */
	
	/*
	function RenamePlaylist2(page) 
	{
		var userpw = $("#pl_name").val();
		var comfirm = $("#userpw_comfirm").val();
		
		if(userpw =="")//유저비밀번호,비밀번호 확인입력 칸이 입력이되지않았을때
		{
			$(".alert_pw").html("비밀번호를 입력하세요!");						//유저비밀번호 알림을 DIV에 알림지정
			//$( "#alert_userid" ).css( 'outline-color', '#ff0d0d' );
			$("#userpw").focus();
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
	}*/