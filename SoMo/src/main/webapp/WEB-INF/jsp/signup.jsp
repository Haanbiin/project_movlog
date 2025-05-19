<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입 | SoMo </title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common.css">
</head>

<body>
    <div class="logo">SoMo 📽</div>
    <div class="container">
        <div class="signup-box">
            <h1>새 계정 만들기</h1>
            <p>빠르고 쉽게 가입할 수 있습니다.</p>
            <form action="<%=request.getContextPath()%>/signup" method="post">
                <input type="text"
                       name="name"
                       placeholder="이름"
                       required>

                <input type="email"
                       name="email"
                       placeholder="이메일"
                       required>

                <input type="tel"
                       name="phone"
                       placeholder="전화번호"
                       required>

                <input type="date"
                       name="birthday"
                       required>

                <div class="gender-options">
                    <label>
                        <input type="radio"
                               name="gender"
                               value="F"
                               required> 여성
                    </label>
                    <label>
                        <input type="radio"
                               name="gender"
                               value="M"> 남성
                    </label>
                </div>

                <input type="password"
                       name="password"
                       placeholder="비밀번호"
                       required>

                <button type="submit" class="signup-btn">가입하기</button>
            </form>
            <div class="bottom-links">
                <a href="<%=request.getContextPath()%>/WEB-INF/jsp/login.jsp">이미 계정이 있으신가요?</a>
            </div>
        </div>
    </div>
</body>
</html>