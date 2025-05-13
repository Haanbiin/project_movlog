<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>



<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>SoMo - 시작화면(비로그인)</title>
	<link rel="stylesheet" href="css/style.css">
</head>

<body>
	<div class="container">
    	<div class="intro">
        	<h1 class="logo">SoMo 📽
	        <p class="slogan">당신의 영화 취향, 여기서 시작하세요</p>
	        <p class="slogan">별점과 리뷰로 더 똑똑한 추천을 받아보세요</p>
	        <p class="slogan">테스트테스트테스트</p>
	        <p class="slogan">테스트테스트테스트</p>
	        <p class="slogan">테스트테스트테스트</p>
	        <p class="slogan">테스트테스트테스트</p>
    	</div>

    	<div class="login-box">
	        <form action="login" method="post">
	            <input type="text" name="email" placeholder="이메일" />
	            <input type="password" name="password" placeholder="비밀번호" />
	            <br>
	            <button type="submit" class="login-btn">로그인</button>
	        </form>
	        <a href="views/register.jsp" class="forgot">비밀번호를 잊으셨나요?</a>
	        <hr />
	       <button class="signup-btn" onclick="location.href='register.jsp'">새 계정 만들기</button>
    	</div>
	</div>
</body>

</html>

