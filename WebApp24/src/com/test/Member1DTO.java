package com.test;

public class Member1DTO
{
	// 주요 속성 구성
	//-- name, tel, addr
	
	// getter / setter 구성
	private String name;
	private String tel;
	private String addr;
	
	
	public Member1DTO()
	{
		
	}
	
	
	public Member1DTO(String name, String tel, String addr)
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
