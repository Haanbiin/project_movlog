package com.somo.login.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import com.somo.login.dto.User;
import com.somo.login.sevice.LoginService;
import com.somo.login.sevice.LoginServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignupController
 */
@WebServlet("/signup")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final LoginService service = new LoginServiceImpl();
	private final DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyy-MM-dd");
       
	
	
    public SignupController() {
        super();
        // TODO Auto-generated constructor stub
    }

    // 회원가입 폼 화면
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/signup.jsp")
           .forward(req, resp);
    }
    
    
    // 회원가입 처리
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        User user = new User();
        user.setName(req.getParameter("name"));
        user.setEmail(req.getParameter("email"));
        user.setPhone(req.getParameter("phone"));
        user.setBirthday(LocalDate.parse(req.getParameter("birthday"), fmt));
        user.setGender(req.getParameter("gender"));
        user.setPassword(req.getParameter("password"));
        // 선택 입력
        user.setTags(req.getParameter("tags"));
        user.setBio(req.getParameter("bio"));

        // DB에 저장
        service.register(user);

        // 추가 정보 입력 페이지로 이동
        resp.sendRedirect(req.getContextPath() + "/jsp/signupExtraInfo.jsp");
    }
    
    
}
