<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	int id = (int) request.getAttribute("id");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
</head>
<body>
	<h1>게시물 수정</h1>
	
	<form action="doModify">
		<div>
			<input type="hidden" name="id" value="<%= id %>"/>
		</div>
		<div>
			제목 : <input type="text" name="title" placeholder="제목을 입력해주세요"/>
		</div>
		<div>
			내용 : <textarea name="body" cols="30" rows="10" placeholder="내용을 입력해주세요"></textarea>
		</div>
		<button>수정</button>
	</form>
	
	<div><a href="list">목록</a></div>
</body>
</html>