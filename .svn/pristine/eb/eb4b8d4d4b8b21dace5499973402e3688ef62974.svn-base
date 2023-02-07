/*-=============================================================================================================================
작성자 : 두성수
작성일 : 2021-09-13
		1. 최초작성 			  				2021.09.14
		2. 주석처리							2021.09.16
=============================================================================================================================-*/
package DTO;

import java.sql.*;
import DTO.*;
import VO.*;

public class LoginDTO extends CommonDTO
{
	//로그인 메소드
	public boolean Login(LoginVO vo)
	{
	
		//DB open
		this.OpenDB();

		String sql = "";
		
		//select문 시작
		sql  = "select * from userinfo where userid='" + vo.getUserid()+"' and userpw=md5('"+vo.getUserpw()+"')";
		//select문 종료
		
		//Query 실행
		this.RunQuery(sql);
		
		//rs.next()메소드로 조회
		if(this.GetNextResult() == true)
		{
			
			//System.out.println("logindto check1");
			vo.setName(this.GetValue("name"));		//이름
			vo.setE_id(this.GetValue("e_id"));		//이메일
			vo.setGender(this.GetValue("gender"));	//성별
			vo.setUno(this.GetValue("uno"));		//유저번호
			vo.setBir(this.GetValue("bir"));		//생년월일
			vo.setUserid(this.GetValue("userid"));	//유저아이디
			vo.setUserpw(this.GetValue("userpw"));	//유저비밀번호
			//Query 종료
			this.CloseQuery();
			//DB close
			this.CloseDB();
			
		}else
		{
			this.CloseQuery();
			this.CloseDB();
			return false;
		}
		return true;
	}
	

}
