/*=============================================================================================================================
�ۼ��� : �μ���
�ۼ��� : 2021-09-13
		1. �����ۼ�    				2021.09.13
		
=============================================================================================================================*/
package VO;

public class LoginVO {

	private String userid;						//���̵�
	private String userpw;						//��й�ȣ
	private String name;						//�̸�
	private String bir;							//�������
	private String gender;						//����
	private String e_id;						//����
	private String uno;							//������ȣ
	
	
	

	public String getUserid() 					{ return userid;        }
	public void   setUserid(String userid) 		{ this.userid = userid; }


	public String getUserpw() 					{ return userpw;        }
	public void   setUserpw(String userpw) 		{ this.userpw = userpw; }


	public String getName() 					{ return name;          }
	public void   setName(String name) 			{ this.name = name;     }
	
		
	public String getBir() 						{ return bir;           }
	public void   setBir(String bir) 			{ this.bir = bir;       }
	
		
	public String getGender() 					{ return gender;        }
	public void   setGender(String gender) 		{ this.gender = gender; }
	
		
	public String getE_id()				 		{ return e_id;          }
	public void   setE_id(String e_id)	 		{ this.e_id = e_id;     }
	
	
	public String getUno() 						{ return uno;           }
	public void   setUno(String uno) 			{ this.uno = uno;       }
	

}
