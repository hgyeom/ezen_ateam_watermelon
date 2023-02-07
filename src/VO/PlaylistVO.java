/*=============================================================================
	占쌜쇽옙占쏙옙 : 占썼무占쏙옙
	占쌜쇽옙占쏙옙 : 2021.09.23
		1. VO 占쌜쇽옙
		   2021.09.29
		1. usermusicinfo table ( mno,menu) 異붽�
		2021.09.30  (�끂�룞�쁺)
=============================================================================*/

package VO;


public class PlaylistVO 
{
	//playlist table
	private int pno;
	private int uno;
	private String p_name;
	private String p_date;
	
	public int	  getPno() 							{ return pno;            	}
	public void   setPno(int pno) 					{ this.pno = pno;        	}
	
	public int 	  getUno() 							{ return uno;            	}
	public void   setUno(int uno) 					{ this.uno = uno;        	}
	
	public String getP_name() 						{ return p_name;         	}
	public void   setP_name(String p_name) 			{ this.p_name = p_name;  	}
	  
	public String getP_date() 						{ return p_date;         	}
	public void   setP_date(String p_date)			{ this.p_date = p_date;  	}
	//-----------------------
	
	//musicinfo table
	private String album;
	private String redate;
	private String title;
	private String singer;
	private String genre;
	private String bpm;
	private String ptime;
	private String ls_ptime;
	private String img_url;
	private String dir_url;
	private int total_music;
	
	public String getAlbum() 						{ return album;			 	}
	public void setAlbum(String album) 				{ this.album = album;	 	}
	
	public String getRedate() 						{ return redate; 		 	}
	public void setRedate(String redate) 			{ this.redate = redate;	 	}
	
	public String getTitle()						{ return title;			 	}
	public void setTitle(String title) 				{ this.title = title;	 	}
	
	public String getSinger() 						{ return singer;		 	}
	public void setSinger(String singer) 			{ this.singer = singer;	 	}
	
	public String getGenre() 						{ return genre;				}
	public void setGenre(String genre) 				{ this.genre = genre;		}
	
	public String getBpm() 							{ return bpm;				}
	public void setBpm(String bpm) 					{ this.bpm = bpm;			}
	
	public String getPtime() 						{ return ptime;				}
	public void setPtime(String ptime) 				{ this.ptime = ptime;		}
	
	public String getLs_ptime() 					{ return ls_ptime;		  	}
	public void setLs_ptime(String ls_ptime) 		{ this.ls_ptime = ls_ptime;	}
	
	public String getImg_url() 						{ return img_url;			}
	public void setImg_url(String img_url) 			{ this.img_url = img_url; 	}
	
	
	public int getTotal_music() 					{ return total_music;		}
	public void setTotal_music(int total_music) 	{ this.total_music = total_music;}

	//usermusicinfo table
	private int menu;
	private int mno;
	
	public int getMenu() 							{ return menu;              }
	public void setMenu(int menu) 					{ this.menu = menu;         }
	public int getMno() 							{ return mno;               }
	public void setMno(int mno) 					{ this.mno = mno;           }
	
	
	
//	public String getDir_url() {
//		return dir_url;
//	}
//	public void setDir_url(String dir_url) {
//		this.dir_url = dir_url;
//	}
	
}
