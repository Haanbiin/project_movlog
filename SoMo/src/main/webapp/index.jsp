<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>


<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>SoMo | 시작화면</title>
	<link rel="stylesheet" href="css/style.css">
</head>

<body>
    <div class="container">
        <div class="intro">
            <h1 class="logo">SoMo 📽</h1>
            <p class="slogan">당신의 영화 취향, 여기서 시작하세요</p>
            <p class="slogan">별점과 리뷰로 더 똑똑한 추천을 받아보세요</p>
            <!-- 테스트용 슬로건은 나중에 지워도 됩니다 -->
        </div>

        <div class="login-box">
            <!-- 로그인 폼 -->
            <form action="${pageContext.request.contextPath}/login"
                  method="post">
                <input type="text"
                       name="loginId"
                       placeholder="이메일 또는 전화번호"
                       required />
                <input type="password"
                       name="password"
                       placeholder="비밀번호"
                       required />
                <br>
                <button type="submit"
                        class="login-btn">
                    로그인
                </button>
            </form>

            <!-- 비밀번호 찾기 -->
            <div class="forgot">
                <a href="${pageContext.request.contextPath}/findPassword">
                    비밀번호를 잊으셨나요?
                </a>
            </div>
            <hr />

            <!-- 회원가입 -->
            <button class="signup-btn"
                    onclick="location.href='${pageContext.request.contextPath}/signup'">
                새 계정 만들기
            </button>
        </div>
    </div>
</body>

</html>

