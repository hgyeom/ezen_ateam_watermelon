/*-=============================================================================================================================
�ۼ��� : �μ���
�ۼ��� : 2021-09-13
		1. �����ۼ� 			  				2021.09.14
		2. �ּ�ó��							2021.09.16
=============================================================================================================================-*/
package DTO;

import java.sql.*;
import DTO.*;
import VO.*;

public class LoginDTO extends CommonDTO
{
	//�α��� �޼ҵ�
	public boolean Login(LoginVO vo)
	{
	
		//DB open
		this.OpenDB();

		String sql = "";
		
		//select�� ����
		sql  = "select * from userinfo where userid='" + vo.getUserid()+"' and userpw=md5('"+vo.getUserpw()+"')";
		//select�� ����
		
		//Query ����
		this.RunQuery(sql);
		
		//rs.next()�޼ҵ�� ��ȸ
		if(this.GetNextResult() == true)
		{
			
			//System.out.println("logindto check1");
			vo.setName(this.GetValue("name"));		//�̸�
			vo.setE_id(this.GetValue("e_id"));		//�̸���
			vo.setGender(this.GetValue("gender"));	//����
			vo.setUno(this.GetValue("uno"));		//������ȣ
			vo.setBir(this.GetValue("bir"));		//�������
			vo.setUserid(this.GetValue("userid"));	//�������̵�
			vo.setUserpw(this.GetValue("userpw"));	//������й�ȣ
			//Query ����
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
