/*-=============================================================================================================================
�옉�꽦�옄 : �몢�꽦�닔
�옉�꽦�씪 : 2021-09-30
		1. 理쒖큹�옉�꽦    				    2021.09.30
		2. 踰꾧렇 �닔�젙 					2021.10.01
			
		
		
=============================================================================================================================*/

package DTO;

import java.util.ArrayList;

import VO.*;


import java.util.*;

public class SearchDTO extends CommonDTO
{

	private int totalCount;
	private int totalCount2;
	private ArrayList<PodlistVO> boardList;
	private ArrayList<PodlistVO> titleList;
	
	//�쟾泥� �뜲�씠�꽣 媛��닔瑜� �뼸�뒗�떎.
	public int getTotalCount()
	{
		return totalCount;
	}
	
	public int getTotalCount2()
	{
		return totalCount2;
	}

	public int Searchsinger(String key)
	{
		
		boardList = new ArrayList<PodlistVO>();
		
		
		
		
		//Drive load
		this.LoadDriver();
		
		//DB open
		this.OpenDB();
		/*
		 * select title from musicinfo where title like '%�븘�씠�쑀%';
		 * */
		
		
		
		
		
		String sql = "";
		//�넗�깉媛믪쓣 �뼸�뼱���빞�븳�떎.
		sql = "select count(distinct(singer)) as total from musicinfo where singer like '%"+key+"%'";
		this.RunQuery(sql);
		this.GetNextResult();
		totalCount = this.GetInt("total");
		this.CloseQuery();
		
		sql = "select distinct(singer) from musicinfo where singer like '%"+key+"%' order by rand()";
		
	
		this.RunQuery(sql);
		while(this.GetNextResult() == true)
		{
			PodlistVO vo = new PodlistVO();
			vo.setSinger(this.GetValue("singer"));
			vo.setAlbum(this.GetValue("album"));
			vo.setBpm(this.GetValue("bpm"));
			vo.setTitle(this.GetValue("title"));
			vo.setMno(this.GetValue("mno"));
			//System.out.println(this.GetValue("singer"));
			/*
			System.out.println(this.GetValue("album"));
			System.out.println(this.GetValue("bpm"));
			System.out.println(this.GetValue("title"));
			System.out.println(this.GetValue("mno"));
		
			System.out.println(this.GetValue("img_url"));
	*/
			boardList.add(vo);
			
		}
		this.CloseDB();
		//System.out.println(boardList.size());
		return boardList.size();
	}
	
	public int Searchtitle(String key)
	{
		
		titleList = new ArrayList<PodlistVO>();
		//Drive load
		this.LoadDriver();
		
		//DB open
		this.OpenDB();
		/*
		 * select title from musicinfo where title like '%�븘�씠�쑀%';
		 * */
		String sql ="";
		sql = "select count(distinct title,mno,img_url,singer) as total from musicinfo where title like '%"+key+"%' order by rand();";
		this.RunQuery(sql);
		this.GetNextResult();
		totalCount2 = this.GetInt("total");
		
		this.CloseQuery();
		
		sql  = "select title,mno,img_url,singer,album,ptime from musicinfo ";
		sql += "where title like '%"+key+"%' order by rand();";
		
	
		this.RunQuery(sql);
		while(this.GetNextResult() == true)
		{	
			PodlistVO vo1 = new PodlistVO();
			vo1.setSinger(this.GetValue("singer"));
			vo1.setAlbum(this.GetValue("album"));
			vo1.setBpm(this.GetValue("bpm"));
			vo1.setTitle(this.GetValue("title"));
			vo1.setMno(this.GetValue("mno"));
			vo1.setUrl(this.GetValue("img_url"));
			vo1.setPtime(this.GetValue("ptime"));
			vo1.setMno(this.GetValue("mno"));
			
			titleList.add(vo1);
		}
		this.CloseDB();
		
		
		return titleList.size();
	}
	
	//select * from musicinfo where singer = '�븘�씠�쑀';
	
	
	public int singerSearch(String key)
	{
		
		boardList = new ArrayList<PodlistVO>();
		
		
		
		
		//Drive load
		this.LoadDriver();
		
		//DB open
		this.OpenDB();

		String sql = "";
		//�넗�깉媛믪쓣 �뼸�뼱���빞�븳�떎.
		sql = "select count(*) as total from musicinfo where singer = '"+key+"'";
		this.RunQuery(sql);
		this.GetNextResult();
		totalCount = this.GetInt("total");
		this.CloseQuery();
		
		sql = "select * from musicinfo where singer = '"+key+"'";
		
	
		this.RunQuery(sql);
		while(this.GetNextResult() == true)
		{
			PodlistVO vo = new PodlistVO();
			vo.setSinger(this.GetValue("singer"));
			vo.setAlbum(this.GetValue("album"));
			vo.setBpm(this.GetValue("bpm"));
			vo.setTitle(this.GetValue("title"));
			vo.setMno(this.GetValue("mno"));
			vo.setPtime(this.GetValue("ptime"));
			//System.out.println(this.GetValue("singer"));
			/*
			System.out.println(this.GetValue("album"));
			System.out.println(this.GetValue("bpm"));
			System.out.println(this.GetValue("title"));
			System.out.println(this.GetValue("mno"));
		
			System.out.println(this.GetValue("img_url"));
	*/
			boardList.add(vo);
			
		}
		this.CloseDB();
		//System.out.println(boardList.size());
		return boardList.size();
	}
	
	public boolean S_Singer_img(PodlistVO vo,String x) 
	{

		//Drive load
		
		this.LoadDriver();
		
		//DB open
		this.OpenDB();

		String sql = "";
		//�넗�깉媛믪쓣 �뼸�뼱���빞�븳�떎.
		sql = "select * from musicinfo where singer = '"+x+"' order by rand();";
		this.RunQuery(sql);
		if(this.GetNextResult() == true)
		{
			
			
			System.out.println("媛�踰⑤쪟"+this.GetValue("img_url"));
			vo.setUrl(this.GetValue("img_url"));
		}
		this.CloseDB();
	
				
		return true;
	}
	
	
	
	public PodlistVO getItem(int index)
	{
		return (PodlistVO)boardList.get(index);
	}
	
	public PodlistVO getItem2(int index)
	{
		return (PodlistVO)titleList.get(index);
	}
	
	
	public static void main(String []args)
	{
		SearchDTO dto = new SearchDTO();
		PodlistVO vo  = new PodlistVO();
		String aa = "아이유";
		
		dto.S_Singer_img(vo,aa);
		System.out.println("main : "+vo.getUrl());
		dto.singerSearch(aa);
		/*
		System.out.println(dto.getTotalCount());
		int total = dto.getTotalCount();
		for(int i = 0 ; i < total; i++)
		{	
			vo = dto.getItem(i);
			System.out.println(vo.getSinger());
			System.out.println(vo.getAlbum());
			System.out.println(vo.getMno());
			System.out.println(vo.getTitle());
			System.out.println(vo.getPtime());
			
			
		}
		*/
		/*
		dto.Searchsinger(aa);

		System.out.println(dto.getTotalCount());
		
		int total = dto.getTotalCount();
		for(int i = 0 ; i < total; i++)
		{	
			vo = dto.getItem(i);
			System.out.println(vo.getSinger());
			
		}
		
		
		dto.Searchtitle(aa);
		System.out.println(dto.getTotalCount2());
		int total2 = dto.getTotalCount2();
		for(int i = 0 ; i < total2; i++)
		{
			vo= dto.getItem2(i);
			System.out.println(vo.getTitle());
					
		}
		*/
	}
}
