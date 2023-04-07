<%@page import="java.time.LocalDateTime"%>
<%@page import="com.koreaIT.java.am.util.Util"%>
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
<title>게시물 수정</title>
</head>
<body>
	<h1>게시물 수정</h1>
	
	<form action="doModify" method="POST">
		<input type="hidden" name="id" value="<%= (int) articleMap.get("id") %>"/>
		<h1><%= (int) articleMap.get("id") %>번 게시물 수정</h1>
		<div>번호 : <%= (int) articleMap.get("id") %></div>
		<div>날짜 : <%= Util.datetimeFormat((LocalDateTime) articleMap.get("regDate")) %></div>
		<div>제목 : <input type="text" name="title" value="<%= (String) articleMap.get("title") %>"/></div>
		<div>내용 : <textarea name="body" id="" cols="30" rows="10"><%= (String) articleMap.get("body") %></textarea></div>
		<button>수정</button>
	</form>
	
	<div>
		<a href="detail?id=<%= (int) articleMap.get("id") %>">돌아가기</a>
		<a href="list">목록</a>
	</div>
</body>
</html>