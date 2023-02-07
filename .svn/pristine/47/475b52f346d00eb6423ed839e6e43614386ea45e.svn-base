<!-- =================================================================================================================
작성자 : 노동혁
작성일 : 2021-09-14
		1. html최초작성    			2021.09.14
		2. 변경기능구현				2021.09.27		 
=================================================================================================================-->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="VO.*" %>
<%@ page import="DTO.*" %>
<%
//login값 불러오기
LoginVO login   = (LoginVO)session.getAttribute("login");
String uno      = login.getUno();
//System.out.println("mypage.jsp새션유지 확인:"+ login);


String arr = request.getParameter("arr");				// 회원정보담은 arr
System.out.println("mymodiok 출력확인용 : " + arr);			// 회원정보담은 arr 출력확인



if(arr == null)									//비밀번호 정보가 null일 경우
{
	response.sendRedirect("../main/main.jsp");	//main.jsp로 리다이렉트
	return;
}


String str = arr.replace("<!>",",");			// <!> 기준으로 리플레이스
String[] strArr = str.split(",");				// 리플레이스한후 "," 기준으로 스플릿


//배열 길이 출력확인용
System.out.println("mymodiok_arr size : " + strArr.length);
//스플릿한 유저정보를 배열순서대로 새로운변수로저장
	String userpw = strArr[0];			
	String comfirm = strArr[1];	

System.out.println("mymodiok.jsp 정보받기확인용  : " + userpw + "/" + comfirm);




if (comfirm == null || userpw == null) 
{
	out.print("유효한 값이 지정되지 않았습니다.");
	response.sendRedirect("../main/index.jsp");			//main.jsp로 리다이렉트
	return;
}



//객체생성후 유저정보셋팅
JoinVO vo= new JoinVO();
vo.setUserpw(userpw);
vo.setUno(uno);
//System.out.println(userpw);

//비밀번호변경 메소드불러오기
MypageDTO dto = new MypageDTO();
dto.MyUpdate(vo);
%>
