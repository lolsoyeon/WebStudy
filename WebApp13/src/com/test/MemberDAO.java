/*===============================
 	MemberDAO.java
 	- 데이터 베이스 액션 처리 전용 클래스
 	(TBL_MEMBER 테이블 전용 DAO)
 ===============================*/


package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.util.DBConn;

public class MemberDAO
{
	// 주요 속성 구성
	private Connection conn;
	
	// 데이터 베이스 연결 담당 메소드
	public Connection connection()
	{
		conn = DBConn.getConnection();
		return conn;
	}
	
	// 데이터 입력(insert) 담당메소드
	public int add(MemberDTO dto) throws SQLException
	{
		// 데이를 입력 executeUpdate를 수행하고 행의갯수를 담을 변수
		int result = 0;
		
		//쿼리문 준비
		String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL)"+
		" VALUES(MEMBERSEQ.nextval, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		// 빈 깡통인 dto 에 set 해준다.
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getTel());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	// 회원 리스트 출력 담당 메소드
	public ArrayList<MemberDTO> list() throws SQLException
	{
		// 자료구조 깡통 생성
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		// 쿼리문 준비
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			// 제일 먼저 해야할 것은?? DTO 객체 생성
			MemberDTO dto = new MemberDTO();
			
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setTel(rs.getString("TEL"));
			
			result.add(dto);
			
		}
		rs.close();
		pstmt.close();
		
		return result;
		
		
	}
	// 인원수 확인 담당 메소드
	public int count() throws SQLException
	{
		int result = 0;
		
		// 쿼리문
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBER";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		// rs
		while(rs.next())
		{
			result += rs.getInt("COUNT");
		}
		
		rs.close();
		pstmt.close();
		
		return result;
		
	}
	
	// 데이터베이스 연결 종료 담당 메소드
	public void close()
	{
		DBConn.close();
	}
	// 메소드 추가--------------------------------------------------------
	
	
	// 회원 데이터 검색 담당 메소드(sid를 가지고 회원 데이터 조회)
	//public ArrayList<MemberDTO> searchMember() throws SQLException
	//{
		
		/*
		//깡통 
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		// 쿼리문 준비
		String sql = "";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		
		
		while(rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			pstmt.setString(0, dto.getSid());

			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setTel(rs.getString("TEL"));
			
		}
		rs.close();
		pstmt.close();
		
		
		return result;
		*/
	
	// 회원 데이터 검색 담당 메소드(sid를 가지고 회원 데이터 조회) T
		public MemberDTO searchMember(String sid) throws SQLException
		{
			MemberDTO result = new MemberDTO();
			
			String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER WHERE SID = ?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sid);
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				result.setSid(rs.getString("SID"));
				result.setName(rs.getString("NAME"));
				result.setTel(rs.getString("TEL") );
			
			}
			
			rs.close();
			pstmt.close();
			
			
			return result;
		}
		
	// 회원 데이터 수정(update) 담당 메소드 
		/*
	public int modify(MemberDTO dto) throws SQLException
	{
		int result = 0;
		
		dto = new MemberDTO();
		
		// 쿼리문 준비
		String sql = "UPDATE TBL_MEMBER SET NAME= ?, TEL= ? WHERE SID= ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		result = pstmt.executeUpdate();
		
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getTel());
		pstmt.setString(3, dto.getSid());
		
		
		pstmt.close();
		
		return result;
		
	*/
	public int modify(MemberDTO merber) throws SQLException
	{
		int result = 0;
		
		// 쿼리문 준비
		String sql = "UPDATE TBL_MEMBER SET NAME= ?, TEL= ? WHERE SID= ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, merber.getName());
		pstmt.setString(2, merber.getTel());
		pstmt.setString(3, merber.getSid());
		
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	// 회원 데이터 삭제(delete) 담당 메소드 DO
	public int remove(String sid) throws SQLException
	{
		int result = 0;
		
		// 쿼리문 준비
		String sql = "DELETE FROM TBL_MEMBER WHERE SID = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sid);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
		
		
	}
	
	// 자식 테이블의 참조 데이터 레코드수를 확인하는 메소드
	/*
	public int refCount(MemberDTO dto) throws SQLException
	{
		int result = 0;
		
		// 쿼리문 준비 제대로하기
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBERSCORE";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs =  pstmt.executeQuery();
		
		while(rs.next())
		{
			// dto를 매개변수로 넣을것이 아니다..
			MemberDTO dto = new MemberDTO();
			
			dto.setSid(rs.getString("SID"));
			
			
		}
		
		pstmt.close();
		
		return result;
		
		
		
	}
	*/
	
	// 자식 테이블의 참조 데이터 레코드수를 확인하는 메소드
	public int refCount(String sid) throws SQLException
	{
		int result = 0;
		
		String sql="SELECT COUNT(*) AS COUNT FROM TBL_MEMBERSCORE WHERE SID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		// executeQuery 하기 전에 sid? 부분 set 해준다
		pstmt.setString(1, sid);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result = rs.getInt("COUNT");
			
		}
	
		rs.close();
		pstmt.close();
		
		return result;
		
	}

	
}


	
	
	
	
	

