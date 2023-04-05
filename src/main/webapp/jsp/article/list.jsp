<%@page import="java.time.LocalDateTime"%>
<%@page import="com.koreaIT.java.am.util.Util"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<Map<String, Object>> articleListMap = (List<Map<String, Object>>) request.getAttribute("articleListMap");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 리스트</title>
</head>
<body>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
	<a href="../home/main"><i class="fa-solid fa-house"></i></a>

	<h1>게시물 리스트</h1>
	<ul>
		<% 
		for(Map<String, Object> articleMap : articleListMap) {
		%>
			<li><a href="detail?id=<%= articleMap.get("id") %>"><%= articleMap.get("id") %>, <%= Util.datetimeFormat((LocalDateTime) articleMap.get("regDate")) %>, <%= articleMap.get("title") %></a></li>
		<% 
		} 
		%>
	</ul>
	
</body>
</html>