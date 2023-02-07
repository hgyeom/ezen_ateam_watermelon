/*=============================================================================================================================
작성자 : 노동혁
작성일 : 2021-09-30
		1.  DTO 작성. Search, AddLikelist, DeleteLikelis, Getlikelist 구현     				2021.09.30
		
=============================================================================================================================*/
package DTO;

import java.util.ArrayList;

import VO.*;

public class likelistDTO extends CommonDTO
{
	private ArrayList<PlaylistVO> likelist;
	String mno_list= "";
	
	//하트에대한 값 조회 
	public boolean Search(String uno, String mno)
	{
		boolean flag = false;
		String[] strArr;
		//System.out.println(uno);
		//System.out.println("mno:"+mno);
		try
		{

			String[] strArr1 =mno.split(",");
				
			//DB 오픈
			this.OpenDB();
			//System.out.println("mno:"+strArr1[0]);
			String sql = "";
			
			//select문 시작
			//System.out.println("길이 확인"+strArr1.length);
			sql  = "select uno from usermusicinfo where uno="+uno+" ";
			if(!mno.equals(""))
			{
				sql += " and mno in (" + mno + ") ";
			}
			/*
			if(strArr1.length == 1)
			{
				sql += "and mno="+strArr1[0]+" ";
			}else
			{
				for (int i = 0; i<strArr1.length;i++ )
				{
					sql += "and mno="+strArr1[i]+" ";
				}
			}
			*/	
			
			sql += "and menu= 2";
			//select문 시작
			
			System.out.println("likelistDTO_Search():"+sql);
			
			//Query 실행
			this.RunQuery(sql);
			
			//rs.next()로 값 존재 조회
			if(this.GetNextResult() == true)
			{
				// 있을경우 flag를 false로 전환	
				flag = false;
				
			}else
			{
				// 없을경우 flag를 true로 전환
				flag = true;
			}
			//Query 종료
			this.CloseQuery();
			
			//DB 닫기
			this.CloseDB();
		}catch(Exception e)
		{
			e.printStackTrace();
			System.out.print("Search() :error");
		}
		//flag  리턴 
		return flag;
	}

/*===============================================================================================*/	
	
	//좋아요 표시한곡에 추가	
	public boolean AddLikelist(String uno,String mno)
	{
		String[] strArr;
		try
		{	
			String[] strArr1 =mno.split(",");
			
			//DB open
			this.OpenDB();
			
	
			String sql ="";

			//"insert 종료 
			/*
			 * sql = "insert into usermusicinfo "; sql += "(uno, mno, pno, menu) "; sql +=
			 * "select ";
			 */
			if(strArr1.length == 1)
			{
				sql  = "insert into usermusicinfo ";
	            sql += "(uno, mno, pno, menu) ";
	            sql += "select ";
				sql += uno+","+strArr1[0]+",401,2 ";
				sql += "from dual where not exists ";
				sql += "( select * from usermusicinfo where ";
				sql += "uno = "+ uno + " and mno = "+strArr1[0]+" and pno = 401 and menu = 2 )";
			}else
			{
				for (int i =0; i<strArr1.length; i++)
				{	
					sql  = "insert into usermusicinfo ";
		            sql += "(uno, mno, pno, menu) ";
		            sql += "select ";
					sql += uno+","+strArr1[i]+",401,2 ";
					sql += "from dual where not exists ";
					sql += "( select * from usermusicinfo where ";
					sql += "uno = "+ uno + " and mno = "+strArr1[i]+" and pno = 401 and menu = 2 )";
					
					//Query 실행
					this.RunSQL(sql);
					System.out.print("likelistDTO_AddLikelist():"+sql);
					
				}
			}	
			
			//Query 실행
			this.RunSQL(sql);
			System.out.print("likelistDTO_AddLikelist():"+sql);
			
			//DB closeQusery
			this.CloseQuery();
			
			//DB Close
			this.CloseDB();
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
			//false리턴
			return false;
		}
		//true리턴
		return true;
	}

/*===============================================================================================*/
	
	//좋아요 표시한곡에서 삭제
	public boolean DeleteLikelist(String uno, String mno)
	{
		String[] strArr;
		try 
		{
			String[] strArr1 =mno.split(",");
			
			//DB open
			this.OpenDB();
			
			String sql = "";
			//delete문 시작
			sql  = "delete from usermusicinfo "; 
			sql += "where uno="+uno+" and ";
			if(strArr1.length == 1)
			{
				sql += "mno="+strArr1[0]+" and ";
			}else
			{
				for (int i = 0; i<strArr1.length;i++ )
				{
					sql += "mno ="+strArr1[i]+" and ";
				}
			}
			sql += "pno= 401 and "; 
			sql += "menu= 2 ";
			//delete문 종료
			
		
			//RunSQL
			this.RunSQL(sql);
			System.out.print("likelistDTO_DeleteLikelist():"+sql);
		
			//DB Close
			this.CloseDB();
			
		}catch(Exception e)
		{
			e.printStackTrace();
			//false리턴
			return false;
		}
		//true리턴
		return true;
	}

/*===============================================================================================*/
	
	//좋아요표시한곡 목록 불러오기
	public int Getlikelist(int uno)
	{	
		likelist = new ArrayList<PlaylistVO>();
		try 
	    {            
	         
	         //Drive load
	         this.LoadDriver();
	         
	         //DB open
	         this.OpenDB();
	         
	         String sql = "";

	         //"select"문 시작
	         sql  = "select *  ";
	         sql += "from usermusicinfo ";
	         sql += "inner join musicinfo on ";
	         sql += "usermusicinfo.mno = musicinfo.mno ";
	         sql += "where menu = 2 ";
	         sql += "and uno = "+ uno;
	         
	         //Query 실행
	         this.RunQuery(sql);
	         
	         while(this.GetNextResult() == true)
	         {
	            PlaylistVO vo = new PlaylistVO();
	            vo.setTitle(this.GetValue("title"));
	            vo.setImg_url(this.GetValue("img_url"));
	            vo.setSinger(this.GetValue("singer"));
	            vo.setAlbum(this.GetValue("album"));
	            vo.setPtime(this.GetValue("ptime"));
	            vo.setMno(this.GetInt("mno"));
	            vo.setUno(uno);
	            //System.out.println("PlaylistDTO.PlaylistMenu : " + vo.getP_name());
	            
	            likelist.add(vo);
	         }
	         
//	         System.out.println("====================");
//	         System.out.println("PlaylistMenu step 2");
//	         System.out.println("====================");
	         
	         //DB close
	         this.CloseQuery();
	         this.CloseDB();
	         
	         
	      }catch(Exception e)
	      {
	         e.printStackTrace();
	      }
	      return likelist.size();
	}
	
	
	
	public PlaylistVO getItem(int index)
	{
		return (PlaylistVO)likelist.get(index);
	}
	
	
	public int TotalLike(int uno)
	   {
	      try
	      {   
	         //Drive load
	         this.LoadDriver();
	         
	         //DB open
	         this.OpenDB();

	         String sql = "";
	         //"count"문 실행
	         sql  = "select count(pno) as tno ";
	         sql += "from usermusicinfo ";
	         sql += "where uno = " + uno;
	         sql += " and menu = 2";
	         //"count"문 종료
	         
	         //System.out.println("insert PlaylistDTO MakePlaylist 확인 : " + sql);
	         
	         //Query 실행
	         this.RunQuery(sql);
	         
	         if(this.GetNextResult() == true)
	         {
	            uno = this.GetInt("tno");
//	            System.out.println("PlaylistDTO.TotalPlaylist : music 媛��닔 : " + pno);
	         }
	         //DB close
	         this.CloseDB();
	         
	      }catch(Exception e)
	      {
	         e.printStackTrace();
	      }
	      return uno;   
	   }
	
/*===============================================================================================*/
	
	public static void main(String[] args) 
	{
		likelistDTO like_dto = new likelistDTO();
		PlaylistVO like_vo = new PlaylistVO();
		System.out.println(like_dto.Getlikelist(3));
	}
	
}

