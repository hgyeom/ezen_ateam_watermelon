/*=============================================================================================================================
작성자 : 노동혁
작성일 : 2021-09-13
		1. 최초작성    				2021.09.13
		
=============================================================================================================================*/
package VO;

public class JoinVO {

	private String name;							//이름
	private String gender;							//성별
	private String userid;							//아이디
	private String userpw;							//비밀번호
	private String bir;								//생년월일
	private String cre_date;						//가입일시
	private String e_id;							//이메일
	private String uno;								//유저번호

	
	public String getName() 						{ return name;              }
	public void  setName(String name) 				{ this.name = name;         }


	public String getGender() 						{ return gender;            }
	public void  setGender(String gender) 			{ this.gender = gender;     }

	public String getUserid() 						{ return userid;            }
	public void  setUserid(String userid) 			{ this.userid = userid;     }


	public String getUserpw() 						{ return userpw;            }
	public void  setUserpw(String userpw) 			{ this.userpw = userpw;     }


	public String getBir() 							{ return bir;               }
	public void  setBir(String bir) 				{ this.bir = bir;           }


	public String getCre_date() 					{ return cre_date;          }
	public void  setCre_date(String cre_date) 		{ this.cre_date = cre_date; }


	public String getE_id() 						{ return e_id;              }
	public void  setE_id(String e_id) 				{ this.e_id = e_id;         }


	public String getUno() 							{ return uno;               }
	public void   setUno(String uno) 				{ this.uno = uno;           }


}
