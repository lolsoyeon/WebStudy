/*===================
 	WordDTO.java
=================== */

package com.test.ajax;

public class WordDTO
{
	// 주요 속성 구성
	private String word;

	// check~!!!디폴트 생성자 (bean 으로 운영)
	public WordDTO()
	{
		this("");
	}
	
	// 모델이나 DAO 에서 편하게 데이터 적재하려고... 
	// 사용자 정의 생성자 (매개 변수 有)
	public WordDTO(String word)
	{
		this.word = word;
	}
	
	
	// getter/ setter 구성
	public String getWord()
	{
		return word;
	}

	public void setWord(String word)
	{
		this.word = word;
	}
}
