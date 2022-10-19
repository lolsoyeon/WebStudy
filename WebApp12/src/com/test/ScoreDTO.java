/*=======================================
  ScoreDTO.java
  - 데이터 저장 및 전송 객체 활용
=======================================*/

package com.test;

public class ScoreDTO
{

	private String sid, name;
	
	private int kor,eng,mat,tot;
	
	private double avg;
	
	// getter / setter

	public String getSid()
	{
		return sid;
	}

	public void setSid(String sid)
	{
		this.sid = sid;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public int getKor()
	{
		return kor;
	}

	public void setKor(int kor)
	{
		this.kor = kor;
	}

	public int getEng()
	{
		return eng;
	}

	public void setEng(int eng)
	{
		this.eng = eng;
	}

	public int getMat()
	{
		return mat;
	}

	public void setMat(int mat)
	{
		this.mat = mat;
	}

	public int getTot()
	{
		return tot;
	}

	public void setTot(int tot)
	{
		this.tot = tot;
	}

	public double getAvg()
	{
		return avg;
	}

	public void setAvg(double avg)
	{
		this.avg = avg;
	}
	
	
	
	
}
