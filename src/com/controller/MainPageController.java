package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.NewsDao;

import com.model.*;

/**
 * Servlet implementation class MainPageController
 */
@WebServlet("/mainpage")
public class MainPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MainPageController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			String action = request.getParameter("action");
			if (action == null) {
				action = "main";
			}

			switch (action) {
			case "signin":
				SigninPage(request, response);
				break;
			case "logout":
				Logout(request, response);
				break;
			default:
				ShowMainPage(request, response);
				break;
			}
		} catch (Exception ex) {
			throw new ServletException();
		}

	}

	protected void Logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		ShowMainPage(request, response);
	}

	protected void ShowMainPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		NewsDao dao = new NewsDao();

		ArrayList<Category> allCategories = dao.getAllCategories();
		ArrayList<ArrayList<News>> rows = new ArrayList<ArrayList<News>>();
		int colInRow = 4;

		for (Category category : allCategories) {
			ArrayList<News> firstByCat = dao.getFirstNewsByCat(category.getIdcategory());
			ArrayList<News> row = new ArrayList<>();
			for (News news : firstByCat) {
				row.add(news);
				if (row.size() == colInRow) {
					rows.add(row);
					row = new ArrayList<News>();
				}
			}
			if (row.size() < colInRow) {
				rows.add(row);
			}
		}

		request.setAttribute("allCategories", allCategories);
		request.setAttribute("rows", rows);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/mainpage.jsp");

		dispatcher.forward(request, response);

	}

	protected void SigninPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/signin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
