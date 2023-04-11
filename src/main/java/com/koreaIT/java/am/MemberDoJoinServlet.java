package com.koreaIT.java.am;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.koreaIT.java.am.config.Config;
import com.koreaIT.java.am.util.DBUtil;
import com.koreaIT.java.am.util.SecSql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/member/doJoin")
public class MemberDoJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html; charset=UTF-8");
		
		Connection conn = null;

		try {
			Class.forName(Config.getDBDriverName());

			conn = DriverManager.getConnection(Config.getDBUrl(), Config.getDBUser(), Config.getDBPassWd());
			
			String loginID = request.getParameter("loginID");
			String loginPW = request.getParameter("loginPW");
			String name = request.getParameter("name");
			
			SecSql sql = new SecSql();
			
			sql.append("SELECT COUNT(loginID) > 0");
			sql.append("FROM `member`");
			sql.append("WHERE loginID = ?", loginID);
			
			boolean isLoginIdDup = DBUtil.selectRowBooleanValue(conn, sql);
			
			if(isLoginIdDup == true) {
				response.getWriter().append(String.format("<script>alert('%s는 이미 사용중인 아이디입니다.');location.replace('join');</script>",loginID));
				return;
			}
			
			sql = SecSql.from("INSERT INTO `member`");
			sql.append("SET regDate = NOW()");
			sql.append(", updateDate = NOW()");
			sql.append(", loginID = ?", loginID);
			sql.append(", loginPW = ?", loginPW);
			sql.append(", `name` = ?", name);
			
			DBUtil.insert(conn, sql);
			
			response.getWriter().append(String.format("<script>alert('%s 회원님 회원가입을 축하합니다.');location.replace('../home/main');</script>",name));
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException e) {
			System.out.println("에러: " + e);
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
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}