/*====================================================
 		ScoreDAO.java
 		- 데이터베이스 액션 처리 전용 객체 활용
======================================================*/

package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class ScoreDAO
{
	private Connection conn;
	
	// 데이터베이스 연결 메소드
	public ScoreDAO() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	// 데이터 입력 메소드
	public int add(ScoreDTO dto) throws SQLException
	{
		int result = 0;
		
		String sql = "INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)"
				+" VALUES (SCORESEQ.NEXTVAL, ?, ?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, dto.getName());
		pstmt.setInt(2, dto.getKor());
		pstmt.setInt(3, dto.getEng());
		pstmt.setInt(4, dto.getMat());
		
		result = pstmt.executeUpdate();
		pstmt.close();
		
		return result;				
	}
	
	
	// 데이터 출력 메소드
	public ArrayList<ScoreDTO> list() throws SQLException
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		String sql = "SELECT SID, NAME, KOR, ENG, MAT"
				+ ", (KOR+ENG+MAT) AS TOT"
				+ ",  TRUNC(((KOR+ENG+MAT)/3),1) AS AVG"
				+ " FROM TBL_SCORE ORDER BY SID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			// dto 객체 생성
			ScoreDTO dto = new ScoreDTO();
			
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getInt("KOR"));
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT"));
			dto.setTot(rs.getInt("TOT"));
			dto.setAvg(rs.getDouble("AVG"));
			
			result.add(dto);			
		}
		
		rs.close();
		pstmt.close();
		
		return result;
		
		
		
	}
	
	
	// 데이터 수 메소드
	public int count() throws SQLException
	{
		int result = 0;
				
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_SCORE";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = rs.getInt("COUNT");
		}
		 
		rs.close();
		pstmt.close();
		
		return result;		
		
	}
	
	
	
	// 데이터베이스 종료 메소드
	public void close() throws SQLException
	{
		DBConn.close();
	}
	

}