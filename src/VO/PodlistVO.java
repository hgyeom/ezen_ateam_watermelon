package VO;

public class PodlistVO 
{
	String mno;				//�����̸�
	String singer;			//��Ƽ��Ʈ��
	String album;			//�ٹ���
	String title;			//�뷡��
	String bpm;				//BPM
	String ptime;			//�ð�
	String url;				//�ٹ� url
	String rno;				//추천 음악번호
	int    total;			//��Ż �� ���´�
	
	
	
	
	
	public String getRno() 						{return rno;			}
	public void setRno(String rno) 				{this.rno = rno;		}
	
	public String getMno() 						{ return mno;           }
	public void   setMno(String mno) 			{ this.mno = mno;       }
	
	public String getSinger() 					{ return singer;        }
	public void   setSinger(String singer) 		{ this.singer = singer; }
	
	public String getAlbum() 					{ return album;         }
	public void   setAlbum(String album) 		{ this.album = album;   }
	
	public String getTitle() 					{ return title;         }
	public void   setTitle(String title) 		{ this.title = title;   }
	
	public String getBpm() 						{return bpm;			}
	public void setBpm(String bpm) 				{this.bpm = bpm;		}
	
	public String getPtime() 					{return ptime;			}
	public void setPtime(String ptime) 			{this.ptime = ptime;	}
	
	public String getUrl() 						{return url;			}
	public void setUrl(String url) 				{this.url = url;		}
	
	public int getTotal() 						{return total;			}
	public void setTotal(int total) 			{this.total = total;	}
	
	
}
