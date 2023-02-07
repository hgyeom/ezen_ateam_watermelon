<!--=============================================================================================================================
작성자 : 노동혁
작성일 : 2021-09-13
		1. 로그인HTML작성    					2021.09.13
		2. 주석처리							2021.09.16
		3. 팟리스트 세션 추가작업-두성수 			2021.09.27
		4. 팟리스트 주석-두성수					2021.09.28
		5. 로그인 오류 처리-두성수					2021.09.28
		해야할거 uno 넣고 비번틀렸을때 로그인 불가 처리
=============================================================================================================================-->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="VO.*" %>
<%@ page import="DTO.*" %>
<%@ page import="java.util.ArrayList"%>


<% 

String name,uno,bir,gender,e_mail;
String mno,singer;
String log_arr = request.getParameter("log_arr");			// 유저정보담은 log_arr 출력확인

//out.print("loginok.jsp login_arr : " + log_arr);
System.out.println("loginok.jsp login_arr : " + log_arr);

String str = log_arr.replace("<!>",",");					// <!> 기준으로 리플레이스
String[] strArr = str.split(",");							// 리플레이스한후 "," 기준으로 스플릿

String userid = strArr[0];
String userpw = strArr[1];

//System.out.print(userid+"~"+userpw);

//객체생성후 유저정보셋팅
LoginVO vo = new LoginVO();
vo.setUserid(userid);
vo.setUserpw(userpw);

LoginDTO dto = new LoginDTO();
dto.Login(vo);

name        =  vo.getName();
uno         =  vo.getUno();
bir	        =  vo.getBir();
gender      =  vo.getGender();
e_mail 		=  vo.getE_id();

if ( uno == null)
{
	System.out.println("로그인 실패");
	%>
		<script>
		window.onload = function()
		{
			alert("로그인 실패");
		}
		</script>
	<%
}else
{
	vo.setBir(bir);						//생년월일
	vo.setE_id(e_mail);					//이메일
	vo.setUserid(userid);				//유저아이디
	vo.setGender(gender);				//성별
	vo.setName(name);					//이름
	vo.setUno(uno);						//유저번호
	session.setAttribute("login",vo);	//세션지정




	PodlistDTO ballad_dto = new PodlistDTO();
	PodlistVO ballad_vo = new PodlistVO();
	ballad_dto.podlist("발라드");							// 메소드를 사용해서 댄스라는 장르의 노래를 가져온다
	ArrayList<String> ballad = (ArrayList) session.getAttribute("ballad"); //처음 리스트를 가져오기 위한 함수

	for(int i = 0; i <= 29; i++) 						// 최대 30개까지 가져오기 위한 방법으로 사용
	{
		
		ballad_vo = ballad_dto.getItem(i);							// vo1에서 getItem으로 타이틀, 앨범명, 가수, 노래번호, 플레이 타임을 가져온다
		 if(ballad==null)
		 {
			 ballad = new ArrayList<String>();				// 리스트를 선언 해주는  함수
			 session.setAttribute("ballad", ballad);		// 세션이름 "Podlist"에 세션에 저장한다.
		 }
		 ballad.add(ballad_vo.getTitle()+"<r>"+ballad_vo.getAlbum()+"<r>"+ballad_vo.getSinger()+"<r>"+ballad_vo.getMno()+"<r>"+ballad_vo.getPtime());
		 //리스트에 정수형으로 넣어서 배열로 넘겨준다.
	}

	PodlistDTO Dance_dto = new PodlistDTO();
	PodlistVO Dance_vo = new PodlistVO();
	Dance_dto.podlist("댄스");
	ArrayList<String> Dance = (ArrayList) session.getAttribute("Dance");
	for(int i = 0; i<=29; i++)
	{
		
		Dance_vo = Dance_dto.getItem(i);
		if(Dance == null)
		{
			Dance = new ArrayList<String>();
			session.setAttribute("Dance", Dance);
		}
		Dance.add(Dance_vo.getTitle()+"<r>"+Dance_vo.getAlbum()+"<r>"+Dance_vo.getSinger()+"<r>"+Dance_vo.getMno()+"<r>"+Dance_vo.getPtime());
	}

	PodlistDTO Hip_hop_dto = new PodlistDTO();
	PodlistVO Hip_hop_vo = new PodlistVO();
	Hip_hop_dto.podlist("랩/힙합");
	ArrayList<String> Hip_hop = (ArrayList) session.getAttribute("Hip_hop");
	for(int i = 0; i<=29; i++)
	{
		
		Hip_hop_vo = Hip_hop_dto.getItem(i);

		if(Hip_hop == null)
		{
			Hip_hop = new ArrayList<String>();
			session.setAttribute("Hip_hop", Hip_hop);
		}
		Hip_hop.add(Hip_hop_vo.getTitle()+"<r>"+Hip_hop_vo.getAlbum()+"<r>"+Hip_hop_vo.getSinger()+"<r>"+Hip_hop_vo.getMno()+"<r>"+Hip_hop_vo.getPtime());
	}

	PodlistDTO ost_dto = new PodlistDTO();
	PodlistVO ost_vo = new PodlistVO();
	ost_dto.podlist("드라마");
	ArrayList<String> ost = (ArrayList) session.getAttribute("ost");
	for(int i = 0; i<=29; i++)
	{
		
		ost_vo = ost_dto.getItem(i);

		if(ost == null)
		{
			ost = new ArrayList<String>();
			session.setAttribute("ost", ost);
		}
		ost.add(ost_vo.getTitle()+"<r>"+ost_vo.getAlbum()+"<r>"+ost_vo.getSinger()+"<r>"+ost_vo.getMno()+"<r>"+ost_vo.getPtime());
	}

	PodlistDTO rock_dto = new PodlistDTO();
	PodlistVO rock_vo = new PodlistVO();
	rock_dto.podlist("록");
	ArrayList<String> rock = (ArrayList) session.getAttribute("rock");
	for(int i = 0; i<=29; i++)
	{
		
		rock_vo = rock_dto.getItem(i);

		if(rock == null)
		{
			rock = new ArrayList<String>();
			session.setAttribute("rock", rock);
		}
		rock.add(rock_vo.getTitle()+"<r>"+rock_vo.getAlbum()+"<r>"+rock_vo.getSinger()+"<r>"+rock_vo.getMno()+"<r>"+rock_vo.getPtime());
	}

	PodlistDTO RaB_dto = new PodlistDTO();
	PodlistVO RaB_vo = new PodlistVO();
	RaB_dto.podlist("R&B");
	ArrayList<String> RaB = (ArrayList) session.getAttribute("RaB");
	for(int i = 0; i<=29; i++)
	{
		
		RaB_vo = RaB_dto.getItem(i);

		if(RaB == null)
		{
			RaB = new ArrayList<String>();
			session.setAttribute("RaB", RaB);
		}
		RaB.add(RaB_vo.getTitle()+"<r>"+RaB_vo.getAlbum()+"<r>"+RaB_vo.getSinger()+"<r>"+RaB_vo.getMno()+"<r>"+RaB_vo.getPtime());
	}
	
	PodlistDTO Indie_dto = new PodlistDTO();
	PodlistVO Indie_vo = new PodlistVO();
	Indie_dto.podlist("인디");
	ArrayList<String> Indie = (ArrayList) session.getAttribute("Indie");
	for(int i = 0; i<=29; i++)
	{
		
		Indie_vo = Indie_dto.getItem(i);

		if(Indie == null)
		{
			Indie = new ArrayList<String>();
			session.setAttribute("Indie", Indie);
		}
		Indie.add(Indie_vo.getTitle()+"<r>"+Indie_vo.getAlbum()+"<r>"+Indie_vo.getSinger()+"<r>"+Indie_vo.getMno()+"<r>"+Indie_vo.getPtime());
	}
	
	
	PodlistDTO Folk_dto = new PodlistDTO();
	PodlistVO Folk_vo = new PodlistVO();
	Folk_dto.podlist("포크");
	ArrayList<String> Folk = (ArrayList) session.getAttribute("Folk");
	for(int i = 0; i<=29; i++)
	{
		
		Folk_vo = Folk_dto.getItem(i);
		
		if(Folk == null)
		{
			Folk = new ArrayList<String>();
			session.setAttribute("Folk", Folk);
		}
		Folk.add(Folk_vo.getTitle()+"<r>"+Folk_vo.getAlbum()+"<r>"+Folk_vo.getSinger()+"<r>"+Folk_vo.getMno()+"<r>"+Folk_vo.getPtime());
	}
	
	PodlistDTO POP_dto = new PodlistDTO();
	PodlistVO POP_vo = new PodlistVO();
	POP_dto.podlist("POP");
	ArrayList<String> POP = (ArrayList) session.getAttribute("POP");
	for(int i = 0; i<=29; i++)
	{
		
		POP_vo = POP_dto.getItem(i);
		
		if(POP == null)
		{
			POP = new ArrayList<String>();
			session.setAttribute("POP", POP);
		}
		POP.add(POP_vo.getTitle()+"<r>"+POP_vo.getAlbum()+"<r>"+POP_vo.getSinger()+"<r>"+POP_vo.getMno()+"<r>"+POP_vo.getPtime());
	}
	

	System.out.println("loginok 유저이름:"+name);
	System.out.println("loginok 유저번호:" + uno);
	System.out.println("loginok 유저생년월일:"+bir);
	System.out.println("loginok 유저성별:"+gender);
	System.out.println("loginok 유저이메일:"+e_mail);
	System.out.println("loginok 유저아이디:"+userid);
}


%>
