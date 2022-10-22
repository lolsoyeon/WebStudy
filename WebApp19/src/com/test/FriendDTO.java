
/*
 * FriendDTO
 */

package com.test;

public class FriendDTO
{
	// 주요 속성 구성
	//-- name age gender idelType
	
//	private String name, gender, idleType;
	
	private String name, gender;
	private int age;    // 산술 연산(가공)이 이루어지지않는 경우 String 이 편하다.
	
	
	// check~!!!
	private String[] idelType;
	//-- 이상형은 여러 개의 데이터가 동시에 전달 되므로
	// 	 (즉, 다중선택이 가능하도록 구성하였기 때문에...)
	//   배열형태로 처리할 수 있다.


	public String getName()
	{
		return name;
	}


	public void setName(String name)
	{
		this.name = name;
	}


	public String getGender()
	{
		return gender;
	}


	public void setGender(String gender)
	{
		this.gender = gender;
	}


	public int getAge()
	{
		return age;
	}


	public void setAge(int age)
	{
		this.age = age;
	}


	public String[] getIdelType()
	{
		return idelType;
	}


	public void setIdelType(String[] idelType)
	{
		this.idelType = idelType;
	}
	
	// getter / setter 구성

	
	// 이름 같은지 점검 해야한다.~!~!
	
}
