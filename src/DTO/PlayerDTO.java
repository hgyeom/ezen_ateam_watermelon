/*==============================================================
	�ۼ��� : �尡��
	�ۼ��� : 2021.09.27
	���    : ������÷��̾� DTO ����
		1. DTO �ۼ�
===============================================================*/
package DTO;

import java.sql.*;
import java.util.ArrayList;

import DTO.*;
import VO.*;


public class PlayerDTO extends CommonDTO
{
	private ArrayList<PlayerVO> player;
	
	//�÷��̸���Ʈ���� ���
	
	public int myPlayer(String uno)
	{	
		player = new ArrayList<PlayerVO>();
		
		try
		{	
			PlayerVO vo = new PlayerVO();
			
			//Drive load
			this.LoadDriver();
			
			//DB open
			this.OpenDB();

			String sql = "";
			//"count��"����
			sql  = "select menu, pno, p_name, mno, title, singer, img_url, dir_url ";
			sql += "from playlist ";
			sql += "where '"+uno+"' ";
			//"count��"����
			
			//Query ����
			this.RunQuery(sql);
			
			if(this.GetNextResult() == true)
			{
				vo.setMenu(this.GetValue("menu"));			
				vo.setPno(this.GetValue("pno"));			
				vo.setP_name(this.GetValue("p_name"));			
				vo.setMno(this.GetValue("mno"));				
				vo.setTitle(this.GetValue("title"));			
				vo.setSinger(this.GetValue("singer"));			
				vo.setImg_url(this.GetValue("img_url"));			
				vo.setDir_url(this.GetValue("dir_url"));				
				
				//arylist�� vo�� �߰�
				player.add(vo);
			}
			//DB close
			this.CloseDB();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return player.size();
	}
	
	public PlayerVO getItem(int index)
	{
		return (PlayerVO)player.get(index);
	}
	
	public PlayerVO getMusic(String mno)
	{
		PlayerVO vo = null;
		try
		{	
			vo = new PlayerVO();
			
			//Drive load
			this.LoadDriver();
			
			//DB open
			this.OpenDB();

			String sql = "";
			//"count��"����
			sql  = "select mno, title, singer, img_url, dir_url, album, ptime, genre, redate ";
			sql += "from musicinfo ";
			sql += "where mno = '"+mno+"' ";
			//"count��"����
			
			//Query ����
			this.RunQuery(sql);
			
			if(this.GetNextResult() == true)
			{
				vo.setMno(this.GetValue("mno"));						//���ǹ�ȣ
				vo.setTitle(this.GetValue("title"));					//Ÿ��Ʋ(����)
				vo.setSinger(this.GetValue("singer"));					//������
				vo.setImg_url(this.GetValue("img_url"));				//�ٹ��̹���
				vo.setDir_url(this.GetValue("dir_url"));				//���
				vo.setAlbum(this.GetValue("album"));
				vo.setPtime(this.GetValue("ptime"));
				vo.setGenre(this.GetValue("genre"));
				vo.setRedate(this.GetValue("redate"));
				System.out.println("확인용"+this.GetValue("mno"));
				
			}
			//DB close
			this.CloseDB();
			
		}catch(Exception e)
		{
			e.printStackTrace();
			vo = null;
		}
		return vo;		
	}
	
	
	//��ĳ��Ʈ���� ���
	
	//������ ���� ���
}

