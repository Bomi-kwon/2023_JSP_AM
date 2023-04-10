<%@page import="com.koreaIT.java.am.Service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
	<a href="../home/main"><i class="fa-solid fa-house"></i></a>

	<h1>회원가입</h1>
	
	<script type="text/javascript">
		function check(form) {
			
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
			else if (form.loginPWCheck.value.trim().length == 0) {
				alert('비밀번호 확인을 입력하세요');
				form.loginPWCheck.focus();
				return;
			}
			else if(form.name.value.trim().length == 0) {
				alert('이름을 입력하세요.');
				form.name.focus();
				return;
			}
			else if(form.loginPW.value != form.loginPWCheck.value) {
				alert('비밀번호가 일치하지 않습니다.');
				form.loginPW.value = null;
				form.loginPWCheck.value = null;
				form.loginPW.focus();
				return;
			}
			else {
				form.submit();
			}
		}
		function IsLoginIdDup() {
			alert('버튼 눌림');
			let loginID = document.getElementById("loginID");
			
			//자바랑 자바스크립트랑 섞어쓰는것만 알면됨..ㅠㅠ
			if (MemberService.isLoginIdDup(loginID.value)==true) {
				alert('이미 사용중인 아이디입니다.');
				return false;
			}
			else {
				alert('사용 가능한 아이디입니다.');
				return true;
			}
		}
	</script>
	
	<form id="form" action="doJoin" onsubmit="check(this); return false;">
	
		<table>
			<tr>
				<th align="right">아이디</th>
				<td><input type="text" name="loginID" id="loginID" placeholder="아이디를 입력해주세요" autocomplete="on"/>
				<button type="button" onclick="return IsLoginIdDup();">중복확인</button></td>
			</tr>		
			<tr>
				<th align="right">비밀번호</th>
				<td><input type="password" name="loginPW" placeholder="비밀번호를 입력해주세요"/></td>
			</tr>
			<tr>
				<th align="right">비밀번호 확인</th>
				<td><input type="password" name="loginPWCheck" placeholder="비밀번호 확인을 입력해주세요"/></td>
			</tr>
			<tr>
				<th align="right">이름</th>
				<td><input type="text" name="name" placeholder="이름을 입력해주세요"/></td>
			</tr>
		</table>
		
		<button>가입</button>
	</form>
</body>
</html>