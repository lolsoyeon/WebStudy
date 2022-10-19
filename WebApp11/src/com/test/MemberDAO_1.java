/*=====================================
   MemberDAO.java
  - 데이터베이스 액션 처리 전용 객체 활용
 =====================================*/


package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

import oracle.net.aso.p;

public class MemberDAO_1
{
	// ○ 주요 속성 구성
	private Connection conn;
	
	
	// ○ 주요 기능 구성(메소드 정의)

	// 데이터베이스 연결 메소드 정의 (생성자)
	public MemberDAO_1()  
	{
		conn = DBConn.getConnection();
	}
	
	
	// 데이터베이스 입력(INSERT) 메소드 정의
	public int add(MemberDTO dto) throws SQLException
	{
		// 궁금한것 여기서는 MemberDTO 객체 생성을 한하고 dto 접근했다...?
		
		
		// 결과를 담기 위한 변수
		int result = 0;
		
		// 쿼리문 준비
		String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL) " 
		+ " VALUES(MEMBERSEQ.NEXTVAL, ?, ?)";
		
		// 작업 객체 생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		
		// 빈 깡통인 작업객체에 값 넣어줘야한다 구리, 주석 등등 
		// pstmt.setString(1, getName("NAME"));
		pstmt.setString(1, dto.getName());		// getName() → return name;
		
		// pstmt.setString(2, getTel("TEL"));
		pstmt.setString(2, dto.getTel());
		
		
		// executeUpdate 는 적용된 행의 갯수 반환~!!!!
		result = pstmt.executeUpdate();
		
		// 작업객체 반환
		pstmt.close();
		
		// 최종 반환될 값
		return result;
		
	}
	
	// 전체 데이터 조회(SELECT) 메소드 정의   조회가 되는것은
	// 리턴되는 건은 MemberDTO 들
	// 하나의 DTO 객체는 한 명의 회원 정보
	public ArrayList<MemberDTO> list() throws SQLException
	{
		// 깡통
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		// 쿼리문 준비
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
		
		// 작업 객체 생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		// 결과 집합 → 반복문 처리
		ResultSet rs = pstmt.executeQuery();
		
		// 반복문 구성(resultSet 으로 부터 하나하나 뭔가를 꺼낸다.)
		while (rs.next())
		{
			// 제일 먼저 해야할 것은??? dto 객체 생성 
			MemberDTO dto = new MemberDTO();
			
			
			// private 접근제어 지시자 때문에 바로 접근이 불가능 하므로
			// set() 메소드를 호출해서 매개변수로 전달해준다.
			// 여기서 getStirng("어떤컬럼"), getInt() 
			// 자바에서는 값을 가져왔는데 받아 줄 곳이 없으면 그냥 지나간다~!!!
			// String sid = rs.getSting("SID"); 이러면 덮어써진다.
			
			
			// dto.sid = rs.getString("SID");		// rs.getString(1);
			dto.setSid(rs.getString("SID"));		// (String sid)
			
			// dto.name = rs.getString("NAME");	// rs.getString(2);
			dto.setName(rs.getString("NAME"));
			
			// dto.tel = rs.getString("TEL");		// rs.getString(3);
			dto.setTel(rs.getString("TEL"));
			
			result.add(dto);
			
		}
		rs.close();
		pstmt.close();
		
		return result;
		
	}
	
	// 전체 인원수 조회(SELECT) 메소드 정의
	public int count() throws SQLException
	{
		int result = 0;
		
		// 쿼리문 준비
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBER";
		
		// PreparedStatement 는작업객체 생성 하면서 쿼리문을 넘겨준다.
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		// 결과 집합
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())	// if (rs.next()) true가 1개~!
		{
			result = rs.getInt("COUNT");
		}
		rs.close();
		pstmt.close();
		
		return result;
	}

	
	
	// DB 연결 종료 메소드 정의
	public void close()
	{
		DBConn.close();
	}
	
	
}
