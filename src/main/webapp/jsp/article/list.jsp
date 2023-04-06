<%@page import="java.time.LocalDateTime"%>
<%@page import="com.koreaIT.java.am.util.Util"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<Map<String, Object>> articleListMap = (List<Map<String, Object>>) request.getAttribute("articleListMap");
	int pageNum = (int) request.getAttribute("page");
	int totalPage = (int) request.getAttribute("totalPage");
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
	
	<table border="1">
		<colgroup>
			<col width="50"/>
			<col width="200"/>
			<col width="100"/>
		</colgroup>
		<tr>
			<th>번호</th>
			<th>날짜</th>
			<th>제목</th>
		</tr>
		<% 
		for(Map<String, Object> articleMap : articleListMap) {
		%>
			<tr>
				<th><%= articleMap.get("id") %></th>
				<th><%= Util.datetimeFormat((LocalDateTime) articleMap.get("regDate")) %></th>
				<th><a href="detail?id=<%= articleMap.get("id") %>"><%= articleMap.get("title") %></a></th>
			</tr>
		<% 
		} 
		%>
	</table>
	
	<style type="text/css">
		.paging > a.red {
		color : red;
		font-weight: bold;
		}
	</style>
	
	<div class="paging">
		<% for(int i = 1 ; i <= totalPage ; i++) { %>
			<a class="<%=pageNum == i ? "red" : ""%>" href="list?page=<%=i %>"><%=i %></a>	
		<% 
		} 
		%>
	</div>
</body>
</html>