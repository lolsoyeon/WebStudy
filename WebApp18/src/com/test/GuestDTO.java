/*
 	GuestDTO
 */


package com.test;


public class GuestDTO
{
	// 주요 속성 구성
	//-- userName subject content
	
	private String userName;		//-- 작성자
	private String subject;			//-- 게시물 제목
	private String content;			//-- 게시물 내용

	
	// Connection conn; 일반적으로 이러면 getter / setter를 만들필요없다.
	// 하지만 자바 빈 규약에 따르면 모든 프로퍼티는 getter / setter를 가져야한다.
	
	
	// nKor → getNKor() 되므로 가급적이면 앞 문자 2개는 소문자 구성
	
	// ※ 여기에서 사용하는 변수명(속성명)의 앞 두글자는
	//	  소문자로 작성 할 것
	//	  numScore → getNumScore() /setNumScore()
	//	  nScore   → getNScore() /setNScore()
	//	  와 같이 getter/ setter 가 속성명을 불러오는 과정에서
	//	  인식이 어긋나는 경우가 발생할 수 있기 때문에...
	
	//※ 여기에서 사용하는 변수명(속성명)은
	// 	 HTML Document(Guest.jsp)의 from 태그에서 name 속성으로 지정할 것.
	//   그래야 속성 데이터 수신 및 속성에 대한 매핑을
	//   자동으로 편하게 처리 할 수 있기 때문에...
	
	
	// getter/ setter 구성
	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public String getSubject()
	{
		return subject;
	}

	public void setSubject(String subject)
	{
		this.subject = subject;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}
	
}
