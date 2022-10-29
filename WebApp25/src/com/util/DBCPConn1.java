
/*
 DBCPConn1.java 
  - DBCPConn 연습용~!
 */



package com.util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCPConn1
{
	// 주요 변수 선언
	public static Connection conn;
	
	// 메소드
	public static Connection getConnection()
	{
		if (conn == null)
		{
			try
			{
				Context ctx = new InitialContext();
				
				Context evt = (Context)ctx.lookup("java:/comp/env");
				
				DataSource ds = (DataSource)evt.lookup("java/myOracle");
				
				conn = ds.getConnection();
				
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		return conn;
	}
	
	public static void close()
	{
		if (conn != null)
		{
			try
			{
				if (!conn.isClosed())
				{
					conn.close();
				}
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
	}
	
}
