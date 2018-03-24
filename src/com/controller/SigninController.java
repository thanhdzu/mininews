package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.NewsDao;
import com.model.User;


@WebServlet("/signin")
public class SigninController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SigninController() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NewsDao dao = new NewsDao();
		String iduser = request.getParameter("iduser");
		String userpassword = request.getParameter("userpassword");
		
		User user = dao.getUser(iduser);
		
		if(user.getIduser() != null){
			if(user.getUserpassword().equals(userpassword)){
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				String currentusername = user.getUsername() + " " + user.getUsersurname();
				session.setAttribute("currentusername", currentusername);
				response.sendRedirect("mainpage");
			}
		} else {
			response.sendRedirect("mainpage");
		}
	}
	
}
