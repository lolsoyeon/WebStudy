/*=======================
 DBConn.java 
 - 예외 처리 방식 throws
 =======================*/

package com.util;

import java.sql.DriverManager;
import java.sql.Connection;

public class DBConn
{

	// 변수 선언
	public static Connection dbConn;

	public static Connection getConnection()
	{
		if (dbConn == null)
		{
			try
			{
				String url = "jdbc:oracle:thin:@211.238.142.58:1521:xe";
				String user = "scott";
				String pwd = "tiger";

				Class.forName("oracle.jdbc.driver.OracleDriver");

				dbConn = (Connection) DriverManager.getConnection(url, user, pwd);

			} 
			catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		return dbConn;
	}

	public static Connection getConnection(String url, String user, String pwd)
	{
		if (dbConn == null)
		{
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");

				dbConn = (Connection) DriverManager.getConnection(url, user, pwd);

			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		return dbConn;
	}

	public static void close()
	{
		if (dbConn != null)
		{
			try
			{
				if (!dbConn.isClosed())
				{
					dbConn.close();
				}

			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		dbConn = null;
	}

}
