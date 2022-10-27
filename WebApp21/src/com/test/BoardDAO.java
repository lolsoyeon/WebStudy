/*======================
 	BoardDAO.java
 ======================*/

package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class BoardDAO
{
	// 주요 속성 구성
	Connection conn;
	
	
	// 생성자 활용
	// 생성자 활용 아닌경우 꼭외우기~!
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
	
	// 게시물 작성 → 데이터 입력 혼자서 백지로해보기
	public int insertDate(BoardDTO dto)
	{
		int result = 0;
		
		String sql = "";
		PreparedStatement pstmt = null;
		
		try
		{
			// 소연아~
			// 매개변수로 넘겨받은 dto 가 있는데... 이 구문은 왜 쓴거야???
			//dto = new BoardDTO();
			
			// HITCOUNT 는 기본값 0 또는 default 또는 입력항목 생략 가능
			// CREATED 는 기본값 SYSDATE 또는 default 또는 입력항목 생략도 가능
			sql = "INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT"
					+ ", CONTENT, IPADDR, HITCOUNT, CREATED)"
//					+ " VALUES(?, ?, ?, ?, ?, ?, ?)";
					+ " VALUES(?, ?, ?, ?, ?, ?, ?, 0, SYSDATE)";
//					+ " VALUES(?, ?, ?, ?, ?, ?, ?, default, default)";
			
			pstmt = conn.prepareStatement(sql);
			
			
			
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPwd());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getSubject());
			pstmt.setString(6, dto.getContent());
			pstmt.setString(7, dto.getIpAddr());
			// pstmt.setInt(8, dto.getHitCount());  
			// pstmt.setString(9, dto.getCreated());
			// 아예 인서트 sql 문에서 HITCOUNT 와 CREATED 를 제거 해도된다.
			// 이유는 table 생성할 때 default(기본 자동 생성) 로 정해놔서
			
			// 테스트
			//System.out.println("name : " + dto.getName());
			//System.out.println("sql : " + sql);
			
			
			result = pstmt.executeUpdate();
				
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}//end insertDate(boardDTO dto)
	
	
	// DB 레코드의 갯수를 가져오는 메소드 정의 select
	// → 검색 기능을 추가하게 되면 수정하게 될 메소드  수정고민해보기
	/*
	public int getDataCount()
	{
		int result = 0 ;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			sql = "SELECT COUNT(*) AS COUNT FROM TBL_BOARD";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); 
			
			if (rs.next())
				result = rs.getInt("COUNT");
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return result;
		
	}//end getDetaCount()
	*/
	public int getDataCount(String searchKey, String searchValue)
	{
		// searchKey   → subject / name / content
		// searchValue →"%취미%"/ "%길동%"/ "%오락%"
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		
		try
		{
			// 선 가공 
			searchValue = "%" + searchValue + "%";
			
			sql = "SELECT COUNT(*) AS COUNT"
				+ " FROM TBL_BOARD"
				+ " WHERE "+ searchKey +" LIKE ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchValue);
			
			rs = pstmt.executeQuery();
			
			if (rs.next())
				result = rs.getInt("COUNT");
			
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
		
	}//end getDataCount(String searchKey, String searchValue)
	
	
	
	
	// 특정 영역의(시작번호 ~ 끝번호) 게시물의 목록을 얻어오는 메소드
	// → 검색 기능을 추가하게 되면 수정하게 될 메소드  수정고민해보기
	/*
	public ArrayList<BoardDTO> getList(int num)
	{
		int result = 0;
		
		// BoardDTO board = new BoardDTO();
		ArrayList<BoardDTO> board = new ArrayList<BoardDTO>();
		
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			sql = "SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED FROM (SELECT ROWNUM RNUM, DATA.* FROM ( SELECT NUM, NAME, SUBJECT, HITCOUNT"
					+ ", TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED"
					+ " FROM TBL_BOARD ORDER BY NUM DESC ) DATA )"
					+ " WHERE RNUM >=1 AND RNUM <=10";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.ge);
			
			rs = pstmt.executeQuery();
			
			while (rs.next())
			{
				BoardDTO dto = new BoardDTO();
				
				
				
			}
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return board;
		
	}
	*/
	
	
	// 특정 영역의(시작번호 ~ 끝번호) 게시물의 목록을 얻어오는 메소드
	// 복습할 부분 혼자서 백지로 해보기
	/*
	public List<BoardDTO> getList(int start, int end)
	{
		List<BoardDTO> result = new ArrayList<BoardDTO>();
		
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			sql = "SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED FROM"
					+ " ("
					+ "SELECT ROWNUM RNUM, DATA.*"
					+ " FROM"
					+ " ( SELECT NUM, NAME, SUBJECT, HITCOUNT"
					+ ", TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED"
					+ " FROM TBL_BOARD ORDER BY NUM DESC"
					+ " ) DATA"
					+ " )"
					+ " WHERE RNUM >= ? AND RNUM <= ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while (rs.next())
			{
				//BoardDTO 객체 생성 1등으로함
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getInt("NUM"));
				dto.setName(rs.getString("NAME"));
				dto.setSubject(rs.getString("SUBJECT"));
				dto.setHitCount(rs.getInt("HITCOUNT"));
				dto.setCreated(rs.getString("CREATED"));
			
				result.add(dto);
			}
			rs.close();
			pstmt.close();
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return result;
		
	}//end getList(int start, int end)
	
	*/
	public List<BoardDTO> getList(int start, int end, String searchKey, String searchValue)
	{															
		List<BoardDTO> result = new ArrayList<BoardDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			 searchValue = "%" + searchValue +"%";
			 
			 sql = "SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED FROM"
						+ " ("
						+ "SELECT ROWNUM RNUM, DATA.*"
						+ " FROM"
						+ " ( SELECT NUM, NAME, SUBJECT, HITCOUNT"
						+ ", TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED"
						+ " FROM TBL_BOARD"
						+ " WHERE" + searchKey + "Like ?"
						+ " ORDER BY NUM DESC"
						+ " ) DATA"
						+ " )"
						+ " WHERE RNUM >= ? AND RNUM <= ?";
			 
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
		
	}
	
	// 특정 게시물 조회에 따른 조회 횟수 증가 메소드 정의
	public int updateHitCount(int num)
	{
		int result = 0;
		String sql = "";
		PreparedStatement pstmt = null;
		
		try
		{
			sql = "UPDATE TBL_BOARD"
				+ " SET HITCOUNT = HITCOUNT + 1"
				+ " WHERE NUM = ?";
			
			pstmt = conn.prepareStatement(sql);
			// 복습부분
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();

			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return result;
	}//end updateHitCount(int num)
	
	
	
	// 복습할 부분 혼자서 백지로 해보기
	// 특정 게시물의 내용을 읽어오는 메소드 정의(Article)
//	public List<BoardDTO> getReadData(int num) BoardDTO들이 아니다!
	public BoardDTO getReadData(int num)
	{
//		List<BoardDTO> = new ArrayList<BoardDTO>();
		
		BoardDTO result = null;
		
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			sql  = "SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT"
					+ ", TO_CHAR(CREATED,'YYYY-MM-DD') AS CREATED"
					+ " FROM TBL_BOARD"
					+ " WHERE NUM= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			while (rs.next())	// if (rs.next())
			{
				
				// 반복문에서 첫번째로 해야할 것은 BoardDTO 객체 생성이다.
				result = new BoardDTO();
				result.setNum(rs.getInt("NUM"));
				result.setName(rs.getString("NAME"));
				result.setPwd(rs.getString("PWD"));
				result.setEmail(rs.getString("EMAIL"));
				result.setSubject(rs.getString("SUBJECT"));
				result.setContent(rs.getString("CONTENT"));
				result.setIpAddr(rs.getString("IPADDR"));
				result.setHitCount(rs.getInt("HITCOUNT"));
				result.setCreated(rs.getString("CREATED"));
			}

			rs.close();
			pstmt.close();
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
		
	}//end getReadData(int num)
	
	
	// 특정 게시물을 삭제하는 기능의 메소드 정의
	public int deleteData(int num)
	{
		int result = 0;
		
		String sql = "";
		PreparedStatement pstmt = null;
		
		try
		{
			sql = "DELETE FROM TBL_BOARD WHERE NUM = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();

			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return result;
	}// end deleteData(int num)
	
	
	// 특정 게시물을 수정하는 기능의 메소드
	
//	public int updateData(int num)
	public int updateData(BoardDTO dto)
	{
		int result = 0;
		String sql = "";
		PreparedStatement pstmt = null;
		
		try
		{
			sql = "UPDATE TBL_BOARD"
				+ " SET NAME= ?, PWD= ?, EMAIL= ?, SUBJECT= ?, CONTENT= ?"
				+ " WHERE NUM= ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setInt(6, dto.getNum());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
		
	}//end updateData(BoardDTO dto)
	

	
	
	
	// 게시물 다음 번호 읽어오는 메소드 정의
/*
//	public BoardDTO getNextNum(int num)
	public int getNextNum(int num)
	{
		int result = 0;
		
//		BoardDTO result = null;
		
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			sql = "SELECT NVL(MIN(NUM),-1) AS NEXTNUM"
				+ " FROM TBL_BOARD"
				+ " WHERE NUM > ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, result.getNum());
			
			rs = pstmt.executeQuery();
			while (rs.next())
			{
				// BoardDTO 객체 생성
				result = new BoardDTO();
				
				result.setNum(rs.getInt("NEXTNUM"));
				
			}
			rs.close();
			pstmt.close();
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	*/
	
	// 게시물 다음 번호 읽어오는 메소드 정의
	public int getNextNum(int num)
	{
		int result = 0;
		
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			sql = "SELECT NVL(MIN(NUM),-1) AS NEXTNUM"
				+ " FROM TBL_BOARD"
				+ " WHERE NUM > ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			while (rs.next())
			{
				result = rs.getInt("NEXTNUM");
				
			}
			rs.close();
			pstmt.close();
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}//end getNextNum
	
	
	// 게시물 이전 번호 읽어오는 메소드 정의
	public int getBeforeNum(int num)
	{
		int result = 0;
		
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			sql = "SELECT NVL(MAX(NUM),-1) AS BEFORENUM"
					+ " FROM TBL_BOARD"
					+ " WHERE NUM < ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			while (rs.next())
				result = rs.getInt("BEFORENUM");
				
			rs.close();
			pstmt.close();
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}//end getBeforeNum(int num)
	
	
}
