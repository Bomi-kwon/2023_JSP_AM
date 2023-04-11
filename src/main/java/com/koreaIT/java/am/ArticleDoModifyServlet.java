package com.koreaIT.java.am;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Map;

import com.koreaIT.java.am.config.Config;
import com.koreaIT.java.am.util.DBUtil;
import com.koreaIT.java.am.util.SecSql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/article/doModify")
public class ArticleDoModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html; charset=UTF-8");
		
		Connection conn = null;

		try {
			Class.forName(Config.getDBDriverName());

			conn = DriverManager.getConnection(Config.getDBUrl(), Config.getDBUser(), Config.getDBPassWd());
			
			HttpSession session = request.getSession();
			
			if(session.getAttribute("loginedMemberId") == null) {
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().append(String.format("<script>alert('로그인 후 이용해주세요.');location.replace('../member/login');</script>"));
				return;
			}
			
			int id = Integer.parseInt(request.getParameter("id"));
			String title = request.getParameter("title");
			String body = request.getParameter("body");
			
			SecSql sql = SecSql.from("SELECT * FROM article");
			sql.append("WHERE id =?", id);
			
			Map<String, Object> articleMap = DBUtil.selectRow(conn, sql);
			
			if(articleMap.isEmpty()) {
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().append(String.format("<script>alert('%d번 게시물은 존재하지 않습니다.');location.replace('list');</script>", id));
				return;
			}
			
			if((int) session.getAttribute("loginedMemberId") != (int) articleMap.get("memberId")) {
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().append(String.format("<script>alert('해당 게시물에 대한 수정 권한이 없습니다.');location.replace('detail?id=%d');</script>", id));
				return;
			}
			
			sql = SecSql.from("UPDATE article");
			sql.append("SET updateDate = NOW()");
			sql.append(", title = ?", title);
			sql.append(", `body` = ?", body);
			sql.append("WHERE id =?", id);
			
			DBUtil.update(conn, sql);
			
			response.getWriter().append(String.format("<script>alert('%d번 글이 수정되었습니다.');location.replace('detail?id=%d');</script>",id,id));
			
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