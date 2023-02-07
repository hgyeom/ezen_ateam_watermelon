<!-- ----------------------------------------------------------- 

	회원가입 처리 페이지
	2021 09 13 : 노동혁				최초작성  
	2021 09 14 : 김무겸 				arr값 null일때 메인페이지 리다이렉트 추가
				  					회원가입 완료시 메인페이지 리다이렉트 추가
	2021 09 23 : 김무겸 				회원가입 구현

--------------------------------------------------------------->

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="VO.*" %>
<%@ page import="DTO.*" %>
<%@ page import="java.util.ArrayList"%>
<% 

String arr = request.getParameter("arr");		
System.out.println("joinok : " + arr);			// 회원가입정보담은 arr 출력확인


if(arr == null)									//유저정보가 null일 경우
{
	response.sendRedirect("../main/main.jsp");	//main.jsp로 리다이렉트
	return;
}

String str = arr.replace("<!>",",");			// <!> 기준으로 리플레이스
String[] strArr = str.split(",");				// 리플레이스한후 "," 기준으로 스플릿


//배열 길이 출력확인용
System.out.println("arr size : " + strArr.length);
	//스플릿한 유저정보를 배열순서대로 새로운변수로저장
	String userid = strArr[0];					
	String userpw = strArr[1];					
	String gender = strArr[2];
	String name   = strArr[3];
	String bir    = strArr[4];
	String e_id1  = strArr[5];
	String e_id2  = strArr[6];
	String e_id   = e_id1 +"@"+ e_id2;

//배열 출력확인용
System.out.println("joinok.jsp 정보받기확인용  : " + userid + "/" + userpw + "/" + gender+ "/" + name+ "/" +bir+ "/" + e_id);

//화면 출력 확인용
out.println("userid :" + userid);
out.println("userpw :" + userpw);
out.println("gender :" + gender);
out.println("name :" + name);
out.println("bir :" + bir);
out.println("e_id1 :" + e_id1);
out.println("e_id2 :" + e_id2);

//유저정보가 null경우
if (userid == null || userpw == null || gender == null || name == null || bir == null || e_id1 == null || e_id2 == null) 
{
	out.print("휴효한 값이 지정되지 않았습니다.");
	response.sendRedirect("../main/main.jsp");			//main.jsp로 리다이렉트
	return;
}

//객체생성후 유저정보셋팅
JoinVO vo= new JoinVO();
vo.setUserid(userid);
vo.setUserpw(userpw);
vo.setGender(gender);
vo.setName(name);
vo.setBir(bir);
vo.setE_id(e_id);

//회원가입
JoinDTO dto = new JoinDTO();

//회원가입후 메인페이지에서 자동로그인 
if(dto.Join(vo) == true)
{
	LoginVO go_login = new LoginVO();
	go_login.setUserid(userid);
	go_login.setUserpw(userpw);
	
	LoginDTO login = new LoginDTO();
	login.Login(go_login);
	String e_mail;
	String uno;
	
	name        =  go_login.getName();
	uno         =  go_login.getUno();
	bir	        =  go_login.getBir();
	gender      =  go_login.getGender();
	e_mail 		=  go_login.getE_id();
	
	go_login.setBir(bir);						//생년월일
	go_login.setE_id(e_mail);					//이메일
	go_login.setUserid(userid);					//유저아이디
	go_login.setGender(gender);					//성별
	go_login.setName(name);						//이름
	session.setAttribute("login",go_login);		//세션지정
	
	PodlistDTO ballad_dto = new PodlistDTO();
	PodlistVO ballad_vo = null;
	ArrayList<String> ballad = (ArrayList) session.getAttribute("ballad"); //처음 리스트를 가져오기 위한 함수
	if(ballad != null){
	for(int i = 0; i <= 29; i++) 						// 최대 30개까지 가져오기 위한 방법으로 사용
	{
		ballad_dto.podlist("발라드");							// 메소드를 사용해서 댄스라는 장르의 노래를 가져온다
		ballad_vo = ballad_dto.getItem(i);							// vo1에서 getItem으로 타이틀, 앨범명, 가수, 노래번호, 플레이 타임을 가져온다
		 if(ballad==null)
		 {
			 ballad = new ArrayList<String>();				// 리스트를 선언 해주는  함수
			 session.setAttribute("ballad", ballad);		// 세션이름 "Podlist"에 세션에 저장한다.
		 }
		 ballad.add(ballad_vo.getTitle()+"<r>"+ballad_vo.getAlbum()+"<r>"+ballad_vo.getSinger()+"<r>"+ballad_vo.getMno()+"<r>"+ballad_vo.getPtime());
		 //리스트에 정수형으로 넣어서 배열로 넘겨준다.
	}
	}
	PodlistDTO Dance_dto = new PodlistDTO();
	PodlistVO Dance_vo = null;
	ArrayList<String> Dance = (ArrayList) session.getAttribute("Dance");
	for(int i = 0; i<=29; i++)
	{
		Dance_dto.podlist("댄스");
		Dance_vo = Dance_dto.getItem(i);
		if(Dance == null)
		{
			Dance = new ArrayList<String>();
			session.setAttribute("Dance", Dance);
		}
		Dance.add(Dance_vo.getTitle()+"<r>"+Dance_vo.getAlbum()+"<r>"+Dance_vo.getSinger()+"<r>"+Dance_vo.getMno()+"<r>"+Dance_vo.getPtime());
	}

	PodlistDTO Hip_hop_dto = new PodlistDTO();
	PodlistVO Hip_hop_vo = null;
	ArrayList<String> Hip_hop = (ArrayList) session.getAttribute("Hip_hop");
	for(int i = 0; i<=29; i++)
	{
		Hip_hop_dto.podlist("랩/힙합");
		Hip_hop_vo = Hip_hop_dto.getItem(i);

		if(Hip_hop == null)
		{
			Hip_hop = new ArrayList<String>();
			session.setAttribute("Hip_hop", Hip_hop);
		}
		Hip_hop.add(Hip_hop_vo.getTitle()+"<r>"+Hip_hop_vo.getAlbum()+"<r>"+Hip_hop_vo.getSinger()+"<r>"+Hip_hop_vo.getMno()+"<r>"+Hip_hop_vo.getPtime());
	}

	PodlistDTO ost_dto = new PodlistDTO();
	PodlistVO ost_vo = null;
	ArrayList<String> ost = (ArrayList) session.getAttribute("ost");
	for(int i = 0; i<=29; i++)
	{
		ost_dto.podlist("드라마");
		ost_vo = ost_dto.getItem(i);

		if(ost == null)
		{
			ost = new ArrayList<String>();
			session.setAttribute("ost", ost);
		}
		ost.add(ost_vo.getTitle()+"<r>"+ost_vo.getAlbum()+"<r>"+ost_vo.getSinger()+"<r>"+ost_vo.getMno()+"<r>"+ost_vo.getPtime());
	}

	PodlistDTO rock_dto = new PodlistDTO();
	PodlistVO rock_vo = null;
	ArrayList<String> rock = (ArrayList) session.getAttribute("rock");
	for(int i = 0; i<=29; i++)
	{
		rock_dto.podlist("록");
		rock_vo = rock_dto.getItem(i);

		if(rock == null)
		{
			rock = new ArrayList<String>();
			session.setAttribute("rock", rock);
		}
		rock.add(rock_vo.getTitle()+"<r>"+rock_vo.getAlbum()+"<r>"+rock_vo.getSinger()+"<r>"+rock_vo.getMno()+"<r>"+rock_vo.getPtime());
	}

	PodlistDTO RaB_dto = new PodlistDTO();
	PodlistVO RaB_vo = null;
	ArrayList<String> RaB = (ArrayList) session.getAttribute("RaB");
	for(int i = 0; i<=29; i++)
	{
		RaB_dto.podlist("R&B");
		RaB_vo = RaB_dto.getItem(i);

		if(RaB == null)
		{
			RaB = new ArrayList<String>();
			session.setAttribute("RaB", RaB);
		}
		RaB.add(RaB_vo.getTitle()+"<r>"+RaB_vo.getAlbum()+"<r>"+RaB_vo.getSinger()+"<r>"+RaB_vo.getMno()+"<r>"+RaB_vo.getPtime());
	}
	
	PodlistDTO Indie_dto = new PodlistDTO();
	PodlistVO Indie_vo = null;
	ArrayList<String> Indie = (ArrayList) session.getAttribute("Indie");
	for(int i = 0; i<=29; i++)
	{
		Indie_dto.podlist("인디");
		Indie_vo = Indie_dto.getItem(i);

		if(Indie == null)
		{
			Indie = new ArrayList<String>();
			session.setAttribute("Indie", Indie);
		}
		Indie.add(Indie_vo.getTitle()+"<r>"+Indie_vo.getAlbum()+"<r>"+Indie_vo.getSinger()+"<r>"+Indie_vo.getMno()+"<r>"+Indie_vo.getPtime());
	}
	
	
	PodlistDTO Folk_dto = new PodlistDTO();
	PodlistVO Folk_vo = null;
	ArrayList<String> Folk = (ArrayList) session.getAttribute("Folk");
	for(int i = 0; i<=29; i++)
	{
		Folk_dto.podlist("포크");
		Folk_vo = Folk_dto.getItem(i);

		if(Folk == null)
		{
			Folk = new ArrayList<String>();
			session.setAttribute("Folk", Folk);
		}
		Folk.add(Folk_vo.getTitle()+"<r>"+Folk_vo.getAlbum()+"<r>"+Folk_vo.getSinger()+"<r>"+Folk_vo.getMno()+"<r>"+Folk_vo.getPtime());
	}
}
%>
	
