<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
	<a href="../home/main"><i class="fa-solid fa-house"></i></a>

	<h1>로그인</h1>
	
	<script type="text/javascript">
		function logincheck(form) {
			
			if (form.loginID.value.trim().length == 0) {
				alert('아이디를 입력하세요');
				form.loginID.focus();
				return;
			}
			else if (form.loginPW.value.trim().length == 0) {
				alert('비밀번호를 입력하세요');
				form.loginPW.focus();
				return;
			}
			else {
				form.submit();
			}
		}
	</script>
	
	<form action="doLogin" onsubmit="logincheck(this); return false;">
	
		<table>
			<tr>
				<th align="right">아이디</th>
				<td><input type="text" name="loginID" id="loginID" placeholder="아이디를 입력해주세요" autocomplete="on"/>
			</tr>		
			<tr>
				<th align="right">비밀번호</th>
				<td><input type="password" name="loginPW" placeholder="비밀번호를 입력해주세요"/></td>
			</tr>
		</table>
		
		<button>로그인</button>
	</form>
</body>
</html>