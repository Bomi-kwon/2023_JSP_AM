<%@page import="com.koreaIT.java.am.util.Util"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	Map<String, Object> articleMap = (Map) request.getAttribute("articleMap");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세보기</title>
</head>
<body>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
	<a href="../home/main"><i class="fa-solid fa-house"></i></a>

	<h1><%= (int) articleMap.get("id") %>번 게시물</h1>
	<div>번호 : <%= (int) articleMap.get("id") %></div>
	<div>날짜 : <%= Util.datetimeFormat((LocalDateTime) articleMap.get("regDate")) %></div>
	<div>제목 : <%= (String) articleMap.get("title") %></div>
	<div>내용 : <%= (String) articleMap.get("body") %></div>
	<div>
		<a href="modify?id=<%= articleMap.get("id") %>">수정</a>
		<a href="delete?id=<%= articleMap.get("id") %>" onclick="if(confirm('정말 삭제하시겠습니까?')==false) {return false;}">삭제</a>
		<a href="list">목록</a>
	</div>
	<div></div>
</body>
</html>