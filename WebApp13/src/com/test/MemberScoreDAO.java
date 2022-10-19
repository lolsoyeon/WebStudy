/*==============================
 	MemberScoreDAO
 	- 데이터베이스 액션 처리 전용 객체 활용
 	(TBL_MEMBERSCORE 테이블 전용 DAO)
 ==============================*/


package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class MemberScoreDAO
{
	// 주요 속성 구성
	private Connection conn;
	
	
	// 데이터베이스 연결담당 메드
	public Connection connection()
	{
		conn = DBConn.getConnection();
		return conn;
	}
	
	// 데이터 입력(Insert) 담당 메소드(성적 데이터 입력)
	public int add(MemberScoreDTO score) throws SQLException
	{
		int result = 0;
		
		// 쿼리문 준비
		String sql = "INSERT INTO TBL_MEMBERSCORE(SID, KOR, ENG, MAT)"
					+" VALUES(?, ?, ?, ?)";
		
		// 작업객체 생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		
		// 중요한 복습부분
		pstmt.setString(1, score.getSid());
		pstmt.setInt(2, score.getKor() );
		pstmt.setInt(3, score.getEng());
		pstmt.setInt(4, score.getMat());
		
		result = pstmt.executeUpdate();
	
		pstmt.close();
		
		
		return result;
		
	}
	
	// 성적 리스트 출력 담당 메소드
//	public MemberScoreDTO들 list()
	public ArrayList<MemberScoreDTO> list() throws SQLException
	{
		ArrayList<MemberScoreDTO> result = new ArrayList<MemberScoreDTO>();
		
		// MemberDTO dto = new MemberDTO();
		
		// 쿼리문 준비
		String sql = "SELECT SID, NAME, KOR, ENG, MAT"
				+ ", (KOR+ENG+MAT) AS TOT"
				+ ", ((KOR+ENG+MAT)/3) AS  AVG"
				+ ", RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK"
				+ " FROM VIEW_MEMBERSCORE ORDER BY SID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		MemberScoreDTO score = null;
		
		while(rs.next())
			
		{
			score = new MemberScoreDTO();
			
			score.setSid(rs.getString("SID"));
			score.setName(rs.getString("NAME"));
			score.setKor(rs.getInt("KOR"));
			score.setEng(rs.getInt("ENG"));
			score.setMat(rs.getInt("MAT"));
			score.setTot(rs.getInt("TOT"));
			score.setAvg(rs.getDouble("AVG"));
			score.setRank(rs.getInt("RANK"));
			
			result.add(score);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
		
	}
	// 전체 인원수 조회 쿼리문
	public int count() throws SQLException
	{
		int result = 0;
		
		// 쿼리문 준비
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_SCORE";
		// 결과 집합 반환 그 것을 해줄 객체 생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = rs.getInt("COUNT");
		}
		// return result 바로 직전에 객체 반환
		rs.close();
		pstmt.close();
		
		return result; 
	}
		
	
	// 데이터베이스 연결 종료 담당 메소드
	public void close()
	{
		DBConn.close();
	}
	
	
	// 메소드 추가---------------------------------------------
	
	// 번호 검색 담당 메소드
	// -- 현재...번호(sid)는 식별자의 역할을 수행하고 있으며
	//	  번호를 통한 검색 결과를 한 명의 회원 일 수 밖에 없기 때문에
	//    반환 자료형은 ArratList 와 같은 자료 구조의 형태가 아니라
	// 	  MemberScoreDTO 형태로 구성하면 된다. 
	
	/* DO
	public MemberScoreDTO search(String sid) throws SQLException
	{
		
		MemberScoreDTO dto = new MemberScoreDTO();
		
		// 쿼리문 준비
		String sql = "SELECT SID, NAME, KOR, ENG, MAT FROM VIEW_MEMBERSCORE WHERE SID= ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, sid);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getInt("KOR"));
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT"));
		}
		
		rs.close();
		pstmt.close();
		
		return dto;
		
	}
	*/
	// 번호 검색 담당 메소드
	public MemberScoreDTO search(String sid) throws SQLException
	{
		
		MemberScoreDTO result = new MemberScoreDTO();
		
		// 쿼리문 준비
		String sql = "SELECT SID, NAME, KOR, ENG, MAT FROM VIEW_MEMBERSCORE WHERE SID= ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, sid);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result.setSid(rs.getString("SID"));
			result.setName(rs.getString("NAME"));
			result.setKor(rs.getInt("KOR"));
			result.setEng(rs.getInt("ENG"));
			result.setMat(rs.getInt("MAT"));
		}
		
		rs.close();
		pstmt.close();
		
		return result;
		
		
		
	}
	
}
