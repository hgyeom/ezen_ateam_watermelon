/*===================================================================
페이지 작성자 : 김무겸
최초 작성일 : 2021.10.02
			1. 최근 재생목록을 만들기 위한 dto작성
			2021.10.02
			1. 최근 재생목록을 이용해 추천을 알려주기 위한 작성
			2021.10.04
			
 ===================================================================*/
package DTO;

import java.util.ArrayList;

import VO.*;

public class LatelyDTO extends CommonDTO
{
	
	private int Count;
	private int totalCount;
	private int totalCount2;
	private ArrayList<PodlistVO> LatelysongList;
	
	/*================================================================
	 * inert into를 할지 update 를 할지 먼저 정하기 위한 토탈 카운트를 구한다.
	 * 만약 카운트가 존재 즉 1이라고 하면 인설트가 아닌 업데트를 해줘야한다.
	 * 만약 토탈카운트가 50개 이상이라고 하면 업데이트를 하면서 지워주는 쿼리를 짜야한다. (이건 추후) 
	 * pno 는 402 번 고정 
	 * menu 는 1번 고정으로 시작
	 ================================================================*/
	public int getCount()
	{
		return Count;
	}
	
	public int getTotalCount()
	{
		return totalCount;
	}
	
	public int getTotalCount2()
	{
		return totalCount2;
	}
	//중복검사
	public boolean Lately(String uno,String mno)
	{
		this.LoadDriver();
		
		//DB open
		this.OpenDB();

		String sql = "";
		//토탈값을 얻어와야한다.
		sql = "select count(*) as total from usermusicinfo where mno = "+mno+" and pno = 402 and menu =1 and uno = "+uno;
		this.RunQuery(sql);
		this.GetNextResult();
		Count = this.GetInt("total");
		this.CloseDB();
		return true;
	}
	
	
	//전체 갯수
	public boolean Lately(String uno)
	{
		this.OpenDB();
		String sql = "";
		sql = "select count(*) as total from usermusicinfo where pno = 402 and menu =1 and uno = "+uno;
		this.RunQuery(sql);
		this.GetNextResult();
		totalCount = this.GetInt("total");
		this.CloseDB();
		if(totalCount == 0)
		{
			return false;
		}
		return true;
	}
	
	//최근재생목록 넣어주기
	public boolean inLately(String uno,String mno)
	{
		this.LoadDriver();
		if(mno == null)
		{
			return false;
		}
		//DB open
		this.OpenDB();

		String sql = "";
		//토탈값을 얻어와야한다.
		sql = "insert into usermusicinfo (uno,mno,pno,menu) value ("+uno+","+mno+",402,1)";
		this.RunSQL(sql);
		
		this.CloseDB();;
		
		return true;
	}
	
	//최근 재생목록 업데이트
	public boolean upLately(String uno,String mno)
	{
		this.LoadDriver();
		
		//DB open
		this.OpenDB();
		if(mno == null)
		{
			return false;
		}
		String sql = "";
		//토탈값을 얻어와야한다.
		sql  = "UPDATE usermusicinfo  SET e_date = now() ";
		sql += "WHERE uno = "+uno+" ";
		sql	+=  "and mno = "+mno+" and pno = 402 and menu = 1";
		this.RunSQL(sql);
		
		this.CloseDB();
		
		return true;
	}
	
	//최근 재생목록  순서대로(오래된시간기준) 삭제
	public boolean delLately(String uno,String mno)
	{
		
		this.LoadDriver();
		
		//DB open
		this.OpenDB();

		String sql = "";
		//토탈값을 얻어와야한다.
		sql  = "DELETE from usermusicinfo WHERE pno = 402 and menu = 1 ";
		sql += "and uno = "+uno+" order by e_date limit 1;";
		this.RunSQL(sql);
		
		this.CloseDB();
		
		return true;
	}
	
	
	//노래 정보가져오기
	public int Latelysong(String uno)
	{
		LatelysongList = new ArrayList<PodlistVO>();
		//Drive load
		this.LoadDriver();
		
		//DB open
		this.OpenDB();
		/*
		 * select title from musicinfo where title like '%�븘�씠�쑀%';
		 * */
		String sql ="";
		sql = "select count(*) as total from usermusicinfo where pno = 402 and menu = 1 and uno = "+uno+" ORDER BY e_date DESC;";
		this.RunQuery(sql);
		this.GetNextResult();
		totalCount2 = this.GetInt("total");
		
		this.CloseQuery();
		
		sql  = "select * from usermusicinfo where pno = 402 and menu = 1 and uno = "+uno+" ORDER BY e_date DESC;";
		
	
		this.RunQuery(sql);
		while(this.GetNextResult() == true)
		{	
			PodlistVO vo = new PodlistVO();

			vo.setMno(this.GetValue("mno"));

			
			LatelysongList.add(vo);
		}
		this.CloseDB();
		
		return LatelysongList.size();
	}
	
	public int rselist(String getmno)
	{
		LatelysongList = new ArrayList<PodlistVO>();
		//Drive load
		this.LoadDriver();
		
		//DB open
		this.OpenDB();
		
		
		String sql ="";
		sql = "select count(*) as total from lately where mno = "+getmno;
		this.RunQuery(sql);
		this.GetNextResult();
		totalCount2 = this.GetInt("total");
		
		
		this.CloseQuery();
		
		sql  = "select * from lately where mno = "+getmno;
		
		this.RunQuery(sql);
		while(this.GetNextResult() == true)
		{	
			PodlistVO vo = new PodlistVO();

			vo.setRno(this.GetValue("rno"));

			
			LatelysongList.add(vo);
		}
		this.CloseDB();
		
		return LatelysongList.size();
	}
	
	
	public PodlistVO getItem(int index)
	{
		return (PodlistVO)LatelysongList.get(index);
	}

	public static void main(String[] args) 
	{
		String uno ="19";
		String mno = "30457690";
		LatelyDTO dto   = new LatelyDTO();
		PodlistVO vo    = new PodlistVO();


		
		
		//dto.Lately 필수적으로 들어가야하는놈
		/*
		 * dto.Lately(uno, mno); dto.Lately(uno); dto.rselist(uno);
		 * System.out.println("토탈카운트 값 확인:"+dto.getTotalCount2());
		 */
		dto.Latelysong("28");
		/*
		 * for(int i = 0; i < 30; i++) { vo = dto.getItem(i);
		 * System.out.println(vo.getRno()); PlayerDTO p_dto = new PlayerDTO(); PlayerVO
		 * p_vo = new PlayerVO(); p_vo = p_dto.getMusic(vo.getRno()); //���ǹ�ȣ
		 * System.out.println(p_vo.getAlbum()); System.out.println(p_vo.getSinger());
		 * System.out.println(p_vo.getTitle()); System.out.println(p_vo.getPtime());
		 * 
		 * }
		 */
		
		/*
		System.out.println("토탈카운트 값 확인:"+dto.getTotalCount());
		int totalc= dto.getTotalCount();
		dto.Latelysong(uno);
		
		for(int i = 0; i < totalc; i++)
		{
			vo = dto.getItem(i);
			System.out.println(vo.getMno());
			/*
			PlayerDTO p_dto = new PlayerDTO();
			PlayerVO  p_vo  = new PlayerVO();
			p_vo = p_dto.getMusic(vo.getMno());				//���ǹ�ȣ
			System.out.println(p_vo.getAlbum());
			System.out.println(p_vo.getSinger());
			System.out.println(p_vo.getTitle());
			System.out.println(p_vo.getPtime());
			
		}
		
		*/
		
		/*System.out.println(dto.getCount());
		if (dto.getCount() == 0)
		{
			System.out.println("새로쓰기");
			dto.inLately(uno, mno);
		}else
		{
			System.out.println("업데이트");
			dto.upLately(uno, mno);
		}
		*/
		
	}

}
