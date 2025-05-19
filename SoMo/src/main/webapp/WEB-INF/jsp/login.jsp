<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 | SoMo</title>
	<link rel = "stylesheet" href="<%=request.getContextPath()%>/css/common.css">
</head>

<body>
	 <div class="logo">SoMo 📽</div>
	    <div class="container">
	        <div class="login-box">
	            <h1>로그인</h1>
	            <form action="<%=request.getContextPath()%>/login" method="post">
	                <input type="text"
	                       name="loginId"
	                       placeholder="이메일 또는 전화번호"
	                       required>
	                <input type="password"
	                       name="password"
	                       placeholder="비밀번호"
	                       required>
	                <% if (request.getAttribute("errorMsg") != null) { %>
	                    <div class="error"><%=request.getAttribute("errorMsg")%></div>
	                <% } %>
	                <button type="submit" class="login-btn">로그인</button>
	            </form>
	            <div class="bottom-links">
	                <a href="<%=request.getContextPath()%>/WEB-INF/jsp/signup.jsp">새 계정 만들기</a> |
	                <a href="<%=request.getContextPath()%>/WEB-INF/jsp/findPassword.jsp">비밀번호 찾기</a>
	            </div>
	        </div>
	    </div>	

</body>
</html>