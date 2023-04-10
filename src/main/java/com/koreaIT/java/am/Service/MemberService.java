package com.koreaIT.java.am.Service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.koreaIT.java.am.config.Config;
import com.koreaIT.java.am.util.DBUtil;
import com.koreaIT.java.am.util.SecSql;

public class MemberService {
	public static boolean isLoginIdDup(String loginID) {
		
		Connection conn = null;
		
		try {
			Class.forName(Config.getDBDriverName());

			conn = DriverManager.getConnection(Config.getDBUrl(), Config.getDBUser(), Config.getDBPassWd());
			SecSql sql = new SecSql();
			
			sql.append("SELECT COUNT(loginID) > 0");
			sql.append("FROM `member`");
			sql.append("WHERE loginID = ?", loginID);
			
			return DBUtil.selectRowBooleanValue(conn, sql);
		
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
			return false;
		} catch (SQLException e) {
			System.out.println("에러: " + e);
			return false;
		} finally {
			try {
				if (conn != null && !conn.isClosed()) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
