package com.koreaIT.java.am;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/home/main")
public class MainPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		int loginedMemberId = -1;
		
		//get으로 가져오면 타입은 object임. 저게 null이 아니라는건 누군가 로그인을 한 상태인것
		if(session.getAttribute("loginedMemberId") != null) {
			loginedMemberId = (int) session.getAttribute("loginedMemberId");
		}
		
		request.setAttribute("loginedMemberId", loginedMemberId);
		
		request.getRequestDispatcher("/jsp/home/main.jsp").forward(request, response);
	}
}