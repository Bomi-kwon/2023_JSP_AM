<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	Map<String, Object> articleMap = (Map) request.getAttribute("articleMap");
	String inputId = request.getParameter("id"); 
	int id = Integer.parseInt(inputId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세보기</title>
</head>
<body>
	<h1><%= (int) articleMap.get("id") %>번 게시물</h1>
	<div>번호 : <%= (int) articleMap.get("id") %></div>
	<div>날짜 : <%= (LocalDateTime) articleMap.get("regDate") %></div>
	<div>제목 : <%= (String) articleMap.get("title") %></div>
	<div>내용 : <%= (String) articleMap.get("body") %></div>
	<div><a href="list">목록</a></div>
</body>
</html>