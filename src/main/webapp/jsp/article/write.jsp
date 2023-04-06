<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String title = (String) request.getAttribute("title");
String body = (String) request.getAttribute("body");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
</head>
<body>
	<h1>게시물 작성</h1>
	
	<form action="doWrite" method="POST">
		<div>
			제목 : <input type="text" name="title" placeholder="제목을 입력해주세요"/>
		</div>
		<div>
			내용 : <textarea name="body" cols="30" rows="10" placeholder="내용을 입력해주세요"></textarea>
		</div>
		
		<button>작성하기</button>
	</form>
	
	<div><a href="list">목록</a></div>
</body>
</html>