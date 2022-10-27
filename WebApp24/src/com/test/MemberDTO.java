package com.test;

public class MemberDTO
{
	// 주요 속성 구성
	//-- name, tel
	/*
	private String userName1,userName2,userName3,userName4,userName5;
	private String userTel1,userTel2,userTel3,userTel4,userTel5;
	

	// getter / setter 구성
	public String getUserName1()
	{
		return userName1;
	}


	public void setUserName1(String userName1)
	{
		this.userName1 = userName1;
	}


	public String getUserName2()
	{
		return userName2;
	}


	public void setUserName2(String userName2)
	{
		this.userName2 = userName2;
	}


	public String getUserName3()
	{
		return userName3;
	}


	public void setUserName3(String userName3)
	{
		this.userName3 = userName3;
	}


	public String getUserName4()
	{
		return userName4;
	}


	public void setUserName4(String userName4)
	{
		this.userName4 = userName4;
	}


	public String getUserName5()
	{
		return userName5;
	}


	public void setUserName5(String userName5)
	{
		this.userName5 = userName5;
	}


	public String getUserTel1()
	{
		return userTel1;
	}


	public void setUserTel1(String userTel1)
	{
		this.userTel1 = userTel1;
	}


	public String getUserTel2()
	{
		return userTel2;
	}


	public void setUserTel2(String userTel2)
	{
		this.userTel2 = userTel2;
	}


	public String getUserTel3()
	{
		return userTel3;
	}


	public void setUserTel3(String userTel3)
	{
		this.userTel3 = userTel3;
	}


	public String getUserTel4()
	{
		return userTel4;
	}


	public void setUserTel4(String userTel4)
	{
		this.userTel4 = userTel4;
	}


	public String getUserTel5()
	{
		return userTel5;
	}


	public void setUserTel5(String userTel5)
	{
		this.userTel5 = userTel5;
	}


	// default 생성자 형태의 사용자 정의 생성자
	public MemberDTO()
	{
		
	}
	
	*/
	// getter / setter 구성
		private String name;
		private String tel;
		private String addr;
		
		
		public MemberDTO()
		{
			
		}
		
		
		public MemberDTO(String name, String tel, String addr)
		{
			this.name = name;
			this.tel = tel;
			this.addr = addr;
		}
		
		
		
		public String getName()
		{
			return name;
		}
		public void setName(String name)
		{
			this.name = name;
		}
		public String getTel()
		{
			return tel;
		}
		public void setTel(String tel)
		{
			this.tel = tel;
		}
		public String getAddr()
		{
			return addr;
		}
		public void setAddr(String addr)
		{
			this.addr = addr;
		}
	
	
	
	
}
