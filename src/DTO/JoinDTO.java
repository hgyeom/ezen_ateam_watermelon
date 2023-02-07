/*-=============================================================================================================================
�ۼ��� : �뵿��
�ۼ��� : 2021-09-13
		1. �ۼ�    				2021.09.13

=============================================================================================================================*/
package DTO;

import java.sql.*;
import DTO.*;
import VO.*;

public class JoinDTO extends CommonDTO
{	
	
	//ȸ������ �޼ҵ�
	public boolean Join(JoinVO vo)
	{
			try
			{	
				//Drive load
				this.LoadDriver();
				
				//DB open
				this.OpenDB();
				
		
				String sql = "";

				//"insert��"���� 
				//<�������� DB�� �����ϱ�>
				sql  = "insert into userinfo ";
				sql += "(userid,userpw,gender,name,bir,e_id) ";
				sql += "values ";
				sql += "('" +vo.getUserid()+ "',md5('"+vo.getUserpw()+ "'),'" +vo.getGender()+ "','" +vo.getName()+ "','" +vo.getBir()+ "','" +vo.getE_id()+ "') ";
				//"insert��"����
				
				System.out.println("insert JoinDTO Join() ���Ȯ�ο� : " + sql);
				
				//Query ����
				this.RunSQL(sql);
				
				//DB close
				this.CloseDB();
				
			}catch(Exception e)
			{
				e.printStackTrace();
				return false;
			}
			return true;
	}
	/*
	//���̵� �ߺ�üũ 
	public boolean idcheck(String userid)
	{
		//�⺻�� false
		boolean flag = true;
		
		try
		{	
			//Drive load
			this.LoadDriver();
			
			//DB open
			this.OpenDB();
			
			//sql �ߺ��� �Ǵ��� Ȯ��
			String sql = "";
			sql += "select userid from ";
			sql += "userinfo where userid = '" + userid + "'";
			
			//Select ���Ȯ�ο�
			System.out.println("select JoinDTO chek() ���Ȯ�ο�  : " + sql);
			
			////rs.next()���
			if(this.GetNextResult() == true)
			{
				flag = false;
			}
			this.CloseQuery();
			this.CloseDB();
			
		}catch (Exception e) 
		{
			return false;
		}
		return flag;
	}
	*/
	
}

