/*======================
 	BoardDAO.java
 ======================*/

package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BoardDAO
{
	// 주요 속성 구성
	Connection conn;
	
	
	// 생성자 활용
	public BoardDAO(Connection conn)
	{
		this.conn = conn;
	}
	
	
	
	// 주요 기능 정의
	
	
	// 게시물 번호의 최댓값 얻어내기
	public int getMaxNum()
	{
		int result = 0;
		
		String sql = "";
		PreparedStatement pstmt = null;     			
		ResultSet rs = null;
		
		try
		{
			sql = "SELECT NVL(MAX(NUM),0) AS MAXNUM FROM TBL_BOARD";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next())
			{
				result = rs.getInt("MAXNUM");
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		
		return result;
		
	}//end getMaxNum()
}
