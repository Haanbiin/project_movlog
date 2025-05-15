<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
	<meta charset="UTF-8">
	<title>회원 가입</title>
	<link rel="stylesheet" href="../css/common.css">

</head>



<body>
	
<!-- 1. 로고를 컨테이너 위로 -->
<div class="logo">SoMo 📽</div>

<div class="container">
    <div class="signup-box">

        <h1>새 계정 만들기</h1>
        <p>빠르고 쉽게 가입할 수 있습니다.</p>

        <form action="register" method="post">

            <input type="text" name="name" placeholder="이름" required>

            <!-- 생일 -->
            <div class="form-group">
                <label>생일</label>
                <div class="select-group">
                    <select name="birthYear" required>
                        <% for (int i = 2025; i >= 1900; i--) { %>
                            <option value="<%=i%>"><%=i%></option>
                        <% } %>
                    </select>
                    <select name="birthMonth" required>
                        <% for (int i = 1; i <= 12; i++) { %>
                            <option value="<%=i%>"><%=i%>월</option>
                        <% } %>
                    </select>
                    <select name="birthDay" required>
                        <% for (int i = 1; i <= 31; i++) { %>
                            <option value="<%=i%>"><%=i%>일</option>
                        <% } %>
                    </select>
                </div>
            </div>

            <!-- 성별 -->
            <div class="form-group">
                <label>성별</label>
                <div class="gender-options">
                    <label>
                        <input type="radio" name="gender" value="female" required> 여성
                    </label>
                    <label>
                        <input type="radio" name="gender" value="male"> 남성
                    </label>
                </div>
            </div>

            <input type="email" name="email" placeholder="이메일" required>
            <input type="password" name="password" placeholder="새 비밀번호" required>

            <div class="help-text">
                가입하기 버튼을 클릭하면 SoMo의 약관, 개인정보처리방침 및 쿠키 정책에 동의하게 됩니다.
                SoMo로부터 알림을 받을 수 있으며 알림은 언제든지 해제할 수 있습니다.
            </div>

            <button type="submit" class="signup-btn">가입하기</button>
        </form>

        <a href="login.jsp" class="bottom-link">이미 계정이 있으신가요?</a>
    </div>
</div>

</body>


</html>