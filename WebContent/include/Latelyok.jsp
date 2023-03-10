<!--=================================================================== 
페이지 작성자 : 두성수
최초 작성일 : 2021.10.01
			1. 재생이 되었을때 최근 재생 목록을 위한 코드 작성			-2021.10.01
			2. 재생목록을 만들기 위한 LatelyDTO 작성				-2021.10.01
			
 ===================================================================-->

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="VO.*" %>
<%@ page import="DTO.*" %>
    
<%
/*==========================================================
최근 들은 목록을 저장하기 위한 작업으로 최신순/최대 50개 까지 저장이 되도록 만들어 진다.
==========================================================*/
String mno = request.getParameter("mno");
LoginVO login   = (LoginVO)session.getAttribute("login");


/*==========================================================
유저 번호를 활용한 인식을하고 이를 활용하여서 정보가 들어가는 유저정보를 나눈다.
==========================================================*/
String uno = login.getUno();

LatelyDTO dto = new LatelyDTO();

/*==========================================================
토탈 카운트를 얻어오기 위한 작업으로 위의 dto.Lately(uno, mno);같은 경우는
업데이트/새로쓰기를 정해주기 위한 토탈 카운트 이며

dto.Lately(uno); 같은 경우는 전체토탈을 얻어와 최대 50곡까지 저장할수 있도록 하는
토탈 카운트 이다.
==========================================================*/
dto.Lately(uno, mno);



if (dto.getCount() == 0)
{
	if (mno.equals(null))
	{
		System.out.println();
	}else
	{
	System.out.println("새로쓰기");
	dto.inLately(uno, mno);
	}
}else
{
	if (mno.equals(null))
	{
		System.out.println();
	}else
	{
	System.out.println("업데이트");
	dto.upLately(uno, mno);

	}
}

/*==========================================================
최귿 들은 노래 횟수를 최대 50개 까지 유지시켜주기 위함으로 
넘어가면 순서에 맞게 삭제해주는 쿼리이다.
==========================================================*/
dto.Lately(uno);
if(50 < dto.getTotalCount())
{
	dto.delLately(uno, mno);
}

%>