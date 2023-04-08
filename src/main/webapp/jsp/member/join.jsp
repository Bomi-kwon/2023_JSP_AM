<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form action="doJoin">
		<div>
			아이디 : <input type="text" name="loginID" placeholder="아이디를 입력해주세요"/>
		</div>
		<div>
			비밀번호 : <input type="text" name="loginPW" placeholder="비밀번호를 입력해주세요"/>
		</div>
		<div>
			이름 : <input type="text" name="name" placeholder="이름을 입력해주세요"/>
		</div>
		
		<button>가입</button>
	</form>
</body>
</html>