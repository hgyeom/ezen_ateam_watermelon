/*=============================================================================================================================
작성자 : 노동혁
작성일 : 2021-09-13
		1. 회원가입 자바스크립트(AJAX)기능구현    2021.09.13
		2. 기능 설명 주석처리					2021.09.16
=============================================================================================================================*/


	// 실시간 아이디 중복체크 기능 ( 'join.jsp' 12라인)

	function idCheck(){
	    //jQuery에서 선택자역할
	    var idStr = $("#userid").val();
	    
	    $.ajax({
	    	type    : 'get',												//GET방식으로 지정
	        url     : "../idCheckServlet?id="+idStr,						//(Servlet 패키지) idCheckServlet파일 존재
	        success : function(data){
	        	
	        	//DATA출력확인
	        	//alert("idchek:"+data);
	        	
	        	if(data == "success")//반환값이 SUCCESS일 경우
	        	{		        	
	        		if($('#userid').val() == "")							//아이디입력칸이 빈칸일경우
	        		{
	        			$(".alert_id").text("");							//alert_id 클라스를 가진 DIV의 값을 ""으로 지정 
	        			$(".Modal_joinnext_btn").attr("disabled",false);	//해체--다음 버튼 클릭할 수 있게 입력제한 해제
	        		}else//아이디입력칸이 빈칸이 아닌경우
	        		{
	        			$(".alert_id").text("사용가능한 아이디입니다.");		//"사용가능한 아이디" 라고 alert_id 클라스를 가진 DIV에 지정
	        			$(".Modal_joinnext_btn").attr("disabled",false);	//해체--다음 버튼 클릭할 수 있게 입력제한 해제
	        		}
	            }else if(data == "fail")//반환값이 FAIL일 경우
	            {
	            	if($('#userid').val() == "")//아이디입력칸이 빈칸일경우
	        		{
	        			$(".alert_id").text("");							//alert_id 클라스를 가진 DIV의 값을 ""으로 지정 	     		
			            $(".Modal_joinnext_btn").attr("disabled",true);		//설정--다음 버튼 클릭할 수 없게 입력제한
	        		}else//아이디입력칸이 빈칸이 아닌경우
        			{
	        			$(".alert_id").text("중복된 아이디입니다.");			//"중복된 아이디입니다" 라고 alert_id 클라스를 가진 DIV에 지정
			            $(".Modal_joinnext_btn").attr("disabled",true);		//설정--다음 버튼 클릭할 수 없게 입력제한
        			}
	            	
	            }
	        }
	    });
	}
	
/*=============================================================================================================================*/
	
	
	
	// ( 'join' ) 페이지에서 '계속하기' 버튼 클릭시 이벤트 ( 17라인 )
	
	function joinnext(page) 
	{	
			var userid = $("#userid").val(); 
			var userpw = $("#userpw").val(); 
			var userrpw = $("#userpw_comfirm").val(); 
			
			if(userid =="" & userpw=="" & userrpw=="")						//유저아이디, 유저비밀번호, 비밀번호확인칸의 입력이 빈칸일경우 
			{
				$(".alert_id").html("아이디를 입력하세요!");					//아이디입력 알림을 DIV에 알림지정
				$(".alert_pw").html("비밀번호를 입력하세요!");				//비밀번호입력 알림을 DIV에 알림지정
				$(".alert_pw_cofirm").html("비밀번호확인를 입력하세요!");		//비밀번호확인입력 알림을 DIV에 알림지정
				$('#userid').focus();										//유저아이디입력칸 포커스

				return;
			}else if(userid == "")//유저아이디 입력이 빈칸일경우 
			{	
				$(".alert_id").html("아이디를 입력하세요!");					//아이디입력 알림을 DIV에 알림지정

				$('#userid').focus();//유저아이디입력칸 포커스
				return;
				
			}else if(userpw == "")// 유저비밀번호 입력이 빈칸일경우
			{
				$(".alert_pw").html("비밀번호를 입력하세요!");				//비밀번호입력 알림을 DIV에 알림지정
				
				$('#userpw').focus();//유저아이디입력칸 포커스
				return;
				
			}else if(userrpw == "")//비밀번호확인칸의 입력이 빈칸일경우
			{
				$(".alert_pw_cofirm").html("비밀번호확인를 입력하세요!");		//비밀번호확인입력 알림을 DIV에 알림지정
				
				$('#userpw_comfirm').focus();//유저아이디입력칸 포커스
				return;
			}else if(userpw != userrpw)//비밀번호가 일치하지않는 경우
			{
				$(".alert_pw_cofirm").html("비밀번호가 일치하지않습니다!");	//비밀번호확인입력 알림을 DIV에 알림지정

				$('#userpw_comfirm').focus();//유저아이디입력칸 포커스
				return;
			}
			
			var dataurl = userid + "<!>" + userpw;							//daturl로 userid와 userpw로 묶어  회원가입1에서 회원가입2페이지로 값을 전달
			
			//alert(dataurl);
			GetModalPage2(page,dataurl);									//page와 dataurl를 "GetModalPage2" 로 전달
	
	}
/*=============================================================================================================================*/

	
	//모달창 이동관련 AJAX
	
	function GetModalPage(page)
	{
		$.ajax({
			url: page,
			type: "post",
			dataType: "html",
			success: function(data)
			{			
				$(".modal").html(data);	//모달클라스DIV에 불러올 모달창을 HTML방식으로 삽입
			    $(".modal").fadeIn();	//모달보이게하기
			    $(".player").fadeOut();	//오디오태그안보이게하기		
			},
			error: function (request, status, error)
			{
				alert("join,js GetModalPage() error2!!");	//에러시 메세지
			}
		});
	}



	
	
/*=============================================================================================================================*/	
	//마이페이지 모달창 이동관련 AJAX
	function GetMypageModal(page)
	{
		$.ajax({
			url: page,
			type: "post",
			dataType: "html",
			success: function(data)
			{			
				$(".modal").html(data);	//모달클라스DIV에 불러올 모달창을 HTML방식으로 삽입
			    $(".modal").fadeIn();	//모달보이게하기	
			},
			error: function (request, status, error)
			{
				alert("join,js GetMypageModal() error1!!");	//에러시 메세지
			}
		});
	}
	
/*=============================================================================================================================*/
	
	
	// "Join1--> join2" 모달창 이동관련 데이터전달 AJAX
	
	function GetModalPage2(page,dataurl)
	{
		//alert(dataurl);
		$.ajax({
			url: page,
			type: "post",
			dataType: "html",
			data: "dataurl="+dataurl,	//joinnext()에서 얻은 dataurl
			success: function(data)
			{			
				$(".modal").html(data);	//모달클라스DIV에 불러올 모달창을 HTML방식으로 삽입
			    $(".modal").fadeIn();	//모달보이게하기
			    $(".player").fadeOut();	//오디오태그안보이게하기		
			},
			error: function (request, status, error)
			{
				alert("error!!");		//에러시 메세지
			}
		});
	}

/*=============================================================================================================================*/
	
	
	//닫기(X)버튼 클릭시 이벤트
	
	function ModalClose()
	{

		    $(".modal").fadeOut();	//모달컨텐츠창 닫힘
		    $(".player").fadeIn();	//오디오태그보이기
		
	}
	
	function Close()
	{
		if(login=null)
		{
		    $(".modal").fadeOut();	//모달컨텐츠창 닫힘
		    $(".player").fadeIn();	//오디오태그보이기
		}else
		{}
		
	}
	


/*=============================================================================================================================*/	

	
	// ( 'join2' ) 페이지에서 '가입완료' 버튼 클릭시 이벤트 ( 64라인 )
	

	
	function joinext2() 
	{

			var gender_select = $("#gender_select").val(); 
			var username      = $("#username").val(); 
			var bir_day       = $("#bir_day").val(); 
			var email_01      = $("#email_01").val(); 
			var email_02      = $("#email_02").val(); 
			
			var data = $("#data").val();			//"join2.jsp" 21번라인에서  hidden로 저장된 값들을 data라는 변수로 쓰기위해 지정
			
			
			if($("#gender_select").val() == "성별")//성별 미선택일 경우 
			{
				$(".alert_gen").html("성별을 선택하세요!");
				//alert("성별을 선택해주세요");
				$("#gender_select")[0].focus();
				return;
			}else if($("#username").val() == "")//유저이름 입력이 빈칸일경우 
			{
				$(".alert_name").html("이름을 입력하세요!");
				//alert("이름를 입력해 주세요.");
				$('#username').focus();
				return;
			}else if($("#bir_day").val() == "")//생년월일 입력이 빈칸일경우 
			{
				$(".alert_bir_day").html("생년월일을 선택하세요!");
				//alert("생년월일을 선택해주세요.");
				
				return;
			}else if($("#email_01").val() == "")//이메일아이디 입력이 빈칸일경우 
			{
				$(".alert_email").html("이메일 아이디 입력 및 주소를 선택하세요!");
				//alert("이메일 아이디를 입력해주세요");
				$('#email_01').focus();
				return;
			}else if($("#email_02").val() == "")//이에일주소 입력이 빈칸 또는 미 선택일 경우 
			{
				$(".alert_email").html("이메일 아이디 입력 및 주소를 선택하세요!");
				$('#email_02').focus();
				return;
			}
			
			
			$("#Modal_pev_btn").toggle();
			$("#Modal_joinlast_btn").toggle();
			$("#loding").toggle();
			//arr 배열 선언
			arr = [];
			
			// 169라인에 지정한 data와 "join2" 에서 입력한 회원가입 정보를  arr[0]에 합쳐서 넣어준다.
			arr[0] = data + "<!>" + gender_select + "<!>" + username + "<!>" + bir_day + "<!>" + email_01 + "<!>" + email_02;
			
			
			//alert("joinext2 arr[0] 출력확인용 : "+arr);
			
			$.ajax({
				url: "../join/joinok.jsp",
				type: "post",
				dataType: "html",
				traditional : true,							//AJAX에서 배열을 넘기기위해  "traditional : true" 라는 데이터 직렬화 옵션 넣어주기
				data: {"arr" : arr},						
				success: function(data)
				{			
					document.location="../main/index.jsp";	//회원가입마치고 바로 main.jsp페이지로 이동
				},
				error: function (request, status, error)
				{
					alert(" joinnext2 error!!");
				}
			});
	}
	
	
	
/*=============================================================================================================================*/	

	// 잘못된 정보를 입력 받았을때 다시 입력시 값을 없애주는 코드
	function changeselect()
	{
		$(".alert_gen").html("");
	}
	
	function changeid()
	{
		$(".alert_name").html("");
	}
	
	function changeemail1()
	{
		$(".alert_email").html("");
	}
	
	function changeemail2()
	{
		$(".alert_email").html("");
	}
	
	function changedate()
	{
		$(".alert_bir_day").html("");
	}
	
	function pwchange1()
	{
		$(".alert_pw").html("");			
	}
	
	function pwchange2()
	{
		$(".alert_pw_cofirm").html("");	
	}
	
	function changeselectemai()
	{
		$(".alert_email").html("");
	}
	
	
	
/*=============================================================================================================================*/	
	
	
	//이메일 주소 선택 관련 기능
	
	$(document).ready(function(){
		$('#selectEmail').change(function(){						//이메일선택 옵션값이 변하는경우
		   $("#selectEmail option:selected").each(function () {		
				
			   //이메일 직접 입력 시
				if($(this).val()== 'dir'){ 
					 $("#email_02").val('');                		//'disabled value'으로 지정된 값을 초기화
					 //$("#email_02").attr("disabled",false); 		//해체--입력할수있게 입력제한을 해제할 수 있게 한다는것
				
				//이메일 직접입력 아닐 시		
				}else{ 
					 $("#email_02").val($(this).text());    		//선택한 값을 'email_02'에 입력
					//$("#email_02").attr("disabled",true); 		 //설정-- 직접입력이 아니므로 입력제한을 설정 한다는것
				}
		   });
		});
	});
	
/*=============================================================================================================================*/
	
	
	

	//영어와 숫자만 입력 가능하게 하는 기능
	/*function handleOnInput(e)  
	{  
	  e.value = e.value.replace(/[^A-Za-z0-9]/ig, '')
	}*/
