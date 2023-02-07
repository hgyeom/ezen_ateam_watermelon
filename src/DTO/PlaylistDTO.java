/*==============================================================
   작성자 : 김무겸
   최초작성일 : 2021.09.23
      1. DTO 생성
      2021.09.24
      1. DTO 수정. COUNT, MAKE, MENU 추가
      2021.09.28,29
      1. DTO 수정. MUSIC 추가
      2021.09.30
      1. Add 추가
===============================================================*/
package DTO;

import VO.*;
import java.util.ArrayList;

public class PlaylistDTO extends CommonDTO
{
   int no   = 0;
   private ArrayList<PlaylistVO> playlist;
   private ArrayList<PlaylistVO> Musicplaylist;
   
   //플레이리스트 갯수를 세는 메소드
   public int CountPlaylist(int uno)
   {
      try
      {   
         //Drive load
         this.LoadDriver();
         
         //DB open
         this.OpenDB();

         String sql = "";
         //"count"문 실행
         sql  = "select count(pno) as cpno ";
         sql += "from playlist ";
         sql += "where uno = ";
         sql += uno;
         //"count"문 종료
         
         //System.out.println("insert PlaylistDTO MakePlaylist 확인 : " + sql);
         
         //Query 실행	
         this.RunQuery(sql);
         
         if(this.GetNextResult() == true)
         {
            no   = this.GetInt("cpno");
//            System.out.println("PlaylistDTO.CountPlaylist : playlist 확인 : " + no);
         }
         //DB close
         this.CloseDB();
         
      }catch(Exception e)
      {
         e.printStackTrace();
      }
      return no;
   }
   
 //플레이리스트의 음악 갯수를 세는 메소드
   public int TotalPlaylist(int uno, int pno)
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
         sql += " and pno = " + pno;
         //"count"문 종료
         
         //System.out.println("insert PlaylistDTO MakePlaylist 확인 : " + sql);
         
         //Query 실행
         this.RunQuery(sql);
         
         if(this.GetNextResult() == true)
         {
            pno = this.GetInt("tno");
//            System.out.println("PlaylistDTO.TotalPlaylist : music 확인 : " + pno);
         }
         //DB close
         this.CloseDB();
         
      }catch(Exception e)
      {
         e.printStackTrace();
      }
      return pno;   
   }
   
   
 //플레이리스트를 만드는 메소드
   public boolean MakePlaylist(int uno)
   {
      PlaylistDTO dto = new PlaylistDTO();
      
      if(no <= 4)                                                          //플레이리스트 개수 제한
      {
         try
         {   
            //Drive load
            this.LoadDriver();
            
            //DB open
            this.OpenDB();
            
            String sql = "";
            
            //"insert"문 실행
            sql  = "insert into playlist ";
            sql += "(uno) ";
            sql += "values ";
            sql += "('" + uno + "') ";
            //"insert"문 종료
            
            //System.out.println("insert PlaylistDTO MakePlaylist 확인 : " + sql);
            
            //Query 실행
            this.RunSQL(sql);

//            System.out.println("PlaylistDTO.MakePlaylist : playlist 확인");
            //DB close
            this.CloseQuery();
            this.CloseDB();
            
         }catch(Exception e)
         {
            e.printStackTrace();
            return false;
         }
         return true;
      }
//      System.out.println("PlaylistDTO.MakePlaylist : playlist 실행");
      return false;
   }
   
   //플레이리스트에 음악을 저장하는 메소드
   public boolean AddPlaylistMusic(int uno, int mno, int pno) 
   {
      try
      {   
         PlaylistDTO dto = new PlaylistDTO();
         dto.TotalPlaylist(uno,pno);
         if(no < 30)
         {
            //Drive load
            this.LoadDriver();
            
            //DB open
            this.OpenDB();
            
      
            String sql = "";
   
            //"insert"문 실행
            sql  = "insert into usermusicinfo ";
            sql += "(uno, mno, pno, menu) ";
            sql += "select ";
            sql += uno + "," + mno + "," + pno + ",3 ";
            sql += "from dual where not exists ";
            sql += "( select * from usermusicinfo where ";
            sql += "uno = "+ uno + " and mno = "+ mno + " and pno = " + pno + " and menu = 3 )";
            //"insert"문 종료
            
            System.out.println("PlaylistDTO.Addplaylist sql확인 : " + sql);
            
            //Query 실행
            this.RunSQL(sql);
            
            //DB close
            this.CloseQuery();
            this.CloseDB();
            
         };
      }catch(Exception e)
      {
         e.printStackTrace();
         return false;
      }
      return true;
   }
   
 //플레이리스트 이름을 변경하는 메소드
   public boolean RenamePlaylist(int pno, int uno, String pl_name)
   {
      try
      {   
         //Drive load
         this.LoadDriver();
         
         //DB open
         this.OpenDB();
         
   
         String sql = "";

         //"update"문 시작
         sql  = "update playlist ";
         sql += "set p_name ='" + pl_name + "'";
         sql += "where pno =" + pno + " and uno = " +uno;
         //"update"문 종료
         
         //System.out.println("PlaylistDTO.RenamePlaylist sql확인 : " + sql);
         
         //SQL 실행
         this.RunSQL(sql);
         
         //DB close
         this.CloseQuery();
         this.CloseDB();
         
      }catch(Exception e)
      {
         e.printStackTrace();
         return false;
      }
      return true;
   }
   
 //플레이리스트 목록을 불러오는 메소드
   public int PlaylistMenu(int uno)
   {
      
      playlist = new ArrayList<PlaylistVO>(); //
      
      int total = no;
      
      try 
      {            
         
         //Drive load
         this.LoadDriver();
         
         //DB open
         this.OpenDB();
         
         String sql = "";

         //"select"문 시작
         sql  = "select p_name,pno, ";                            
         sql += " (select img_url from musicinfo where mno = x.mno) as img_url, ";
         sql += "    (select singer from musicinfo where mno = x.mno) as singer,";
         sql += "    (select album from musicinfo where mno = x.mno) as album ";
         sql += "from ";
         sql += "( ";
         sql += "    select p_name,pno, ";
         sql += "        (select mno from usermusicinfo where pno = playlist.pno order by e_date asc limit 0,1)   as mno ";
         sql += "    from playlist";
         sql += "    where uno ="+ uno;
         sql += ") x ";
         sql += "order by pno asc";
         //"select"문 종료
//         System.out.println("====================");
//         System.out.println("PlaylistMenu step 1");
//         System.out.println("====================");
         
         //System.out.println("PlaylistDTO.PlaylistMenu sql확인 : " + sql);
         
         //Query 실행
         this.RunQuery(sql);
         
         while(this.GetNextResult() == true)
         {
            PlaylistVO vo = new PlaylistVO();
            vo.setP_name(this.GetValue("p_name"));
            vo.setPno(this.GetInt("pno"));
            vo.setImg_url(this.GetValue("img_url"));
            vo.setSinger(this.GetValue("singer"));
            vo.setAlbum(this.GetValue("album"));
            vo.setUno(uno);
            //System.out.println("PlaylistDTO.PlaylistMenu : " + vo.getP_name());
            
            playlist.add(vo);
         }
         
//         System.out.println("====================");
//         System.out.println("PlaylistMenu step 2");
//         System.out.println("====================");
         
         //DB close
         this.CloseQuery();
         this.CloseDB();
         
         
      }catch(Exception e)
      {
         e.printStackTrace();
      }
      return playlist.size();
   }
   
   
   //플레이리스트 음악 목록을 불러오는 메소드
   public int PlaylistMusic(int uno, int pno)
   {
      
      Musicplaylist = new ArrayList<PlaylistVO>();
      
      try
      {   
         //Drive load
         this.LoadDriver();
         
         //DB open
         this.OpenDB();
         
         String sql = "";
         //"select"문 시작
         sql  = "select * ";                               
         sql += "from usermusicinfo ";
         sql += "inner join musicinfo on ";                     	//inner join 占쎄텢占쎌뒠占쎈릭占쎈연 占쎈연占쎌쑎揶쏆뮇�벥 占쎈�믭옙�뵠�뇡遺용퓠占쎄퐣 �빊遺욱뀱
         sql += "usermusicinfo.mno = musicinfo.mno ";            	//mno占쎌벥 揶쏅�れ뵠 揶쏆늿占썲칰占�
         sql += "inner join playlist on";                     		//playlist占쎈퓠占쎄퐣占쎈즲 �빊遺욱뀱
         sql += "(usermusicinfo.pno = playlist.pno) ";           	//pno占쎌벥 揶쏅�れ뵠 揶쏆늿占썲칰占�
         sql += "and (usermusicinfo.uno = playlist.uno) ";          //uno占쎌벥 揶쏅�れ뵠 揶쏆늿占썲칰占�.
         sql += "where usermusicinfo.uno = " + uno ;                //uno揶쏉옙 揶쏉옙占쎌죬占쏙옙占쎄퐣 �빊�뮆�젾
         sql += " and usermusicinfo.pno = " + pno;                  //pno揶쏉옙 揶쏉옙占쎌죬占쏙옙占쎄퐣 �빊�뮆�젾
         //"select"문 종료
      
         
         //Query 실행
         this.RunQuery(sql);
         
         while(this.GetNextResult() == true)
         {
            PlaylistVO list_vo = new PlaylistVO();
            list_vo.setMno(this.GetInt("mno"));
            list_vo.setAlbum(this.GetValue("album"));
            list_vo.setGenre(this.GetValue("genre"));
            list_vo.setRedate(this.GetValue("redate"));
            list_vo.setSinger(this.GetValue("singer"));
            list_vo.setTitle(this.GetValue("title"));
            list_vo.setPtime(this.GetValue("ptime"));
            list_vo.setImg_url(this.GetValue("img_url"));
            Musicplaylist.add(list_vo);
         }
         
         //DB close
         this.CloseQuery();
         this.CloseDB();
         
      }catch(Exception e)
      {
         e.printStackTrace();
      }
      return Musicplaylist.size();
   }
   
 //플레이리스트를 삭제하는 메소드
   public boolean DeletePlaylist(int uno, int pno)
   {
      try
      {   
         //Drive load
         this.LoadDriver();
         
         //DB open
         this.OpenDB();
         
   
         String sql = "";

         //"delete"문 시작
         sql  = "delete from playlist ";
         sql += "where pno =" + pno + " and uno = " + uno;
         //"delete"문 종료
//         System.out.println("==================================================");
//         System.out.println("delete 실행");
//         System.out.println("==================================================");
         //System.out.println("PlaylistDTO.RenamePlaylist sql확인 : " + sql);
         
         //SQL실행
         this.RunSQL(sql);
         
         //DB close
         this.CloseQuery();
         this.CloseDB();
         
      }catch(Exception e)
      {
         e.printStackTrace();
         return false;
      }
      return true;
   }
   
   
   
   public PlaylistVO getItem(int index)
   {
      return (PlaylistVO)playlist.get(index);
   }
   
   public PlaylistVO getMusic(int index)
   {
      return (PlaylistVO)Musicplaylist.get(index);
   }
   
   
   
   
   public static void main(String []args)
   {
      PlaylistDTO dto = new PlaylistDTO();
      PlaylistVO vo = new PlaylistVO();
      int total = dto.CountPlaylist(3);
      
      //dto.MakePlaylist(3);               //makeplaylist 占쎌읈占쎈퓠 countplaylist �떎�뻾 占쎈툡占쎌뒄
      
      dto.PlaylistMenu(3);               //占쎈탣占쎌쟿占쎌뵠�뵳�딅뮞占쎈뱜 筌띾슢諭띰옙�뮉 筌롫뗄�꺖占쎈굡
//      System.out.println("占쎈꽅占쎄퉱 占쎌넇占쎌뵥 : " + total);
//      System.out.println("====================");
//      dto.PlaylistMusic(3,1);
//      System.out.println();
//      dto.TotalPlaylist(3, 1);
      dto.AddPlaylistMusic(3, 5713422, 1);
      for(int i = 0; i < total; i++)
      {
//         dto.getMusic(i);
         //占쎈탣占쎌쟿占쎌뵠�뵳�딅뮞占쎈뱜 筌뤴뫖以� �빊�뮆�젾 占쎌넇占쎌뵥占쎌뒠
//         vo = dto.getItem(i);
//         System.out.println("PlaylistDTO.PlaylistMenu pno : " + vo.getPno());
         
      }
   }
}