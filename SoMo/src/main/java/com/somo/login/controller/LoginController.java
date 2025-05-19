package com.somo.login.controller;

import java.io.IOException;

import com.somo.login.sevice.LoginService;
import com.somo.login.sevice.LoginServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final LoginService service = new LoginServiceImpl(); 
	
       
  
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

    // 로그인 폼 화면
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/login.jsp")
           .forward(req, resp);
    }
    
    // 로그인 처리
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String loginId  = req.getParameter("loginId");
        String password = req.getParameter("password");

        if (service.login(loginId, password)) {
            // 성공: 세션에 아이디 저장 후 테스트 페이지로 이동
            HttpSession session = req.getSession(true);
            session.setAttribute("loginUser", loginId);
            resp.sendRedirect(req.getContextPath() + "/jsp/success.jsp");
        } else {
            // 실패: 에러 메시지 띄우고 다시 로그인 페이지
            req.setAttribute("errorMsg", "로그인 정보가 올바르지 않습니다.");
            req.getRequestDispatcher("/WEB-INF/jsp/login.jsp")
               .forward(req, resp);
        }
    }
}
