package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import com.dao.*;
import com.model.*;

;

@WebServlet("/newspage")
public class NewsPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NewsPageController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String idnewsString = request.getParameter("idnews");
		String action = request.getParameter("action");

		if (idnewsString == null) {
			response.sendRedirect("/news");
		} else {

			if ("edit".equals(action)) {
				EditNews(request, response);
			} else if ("delete".equals(action)) {
				DeleteNews(request, response);
			} else if ("signin".equals(action)) {
				response.sendRedirect("signin.jsp");
			} else {
				ShowNews(request, response);
			}

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NewsDao dao = new NewsDao();
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (isMultipart) {
			News news = null;
			news = getNewsFormPost(request);
			dao.editNews(news);
			response.sendRedirect("/news");
		} else {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}
	}

	protected void EditNews(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		NewsDao dao = new NewsDao();
		int idnews = Integer.parseInt(req.getParameter("idnews"));
		News news = dao.getNews(idnews);

		ArrayList<Category> allCat = dao.getAllCategories();

		if (user == null || !(news.getAuthor().equals(user.getIduser()))) {
			resp.sendRedirect("signin.jsp");
		} else {
			req.setAttribute("news", news);
			req.setAttribute("allCat", allCat);
			RequestDispatcher dispatcher = req.getRequestDispatcher("editpage.jsp");
			dispatcher.forward(req, resp);
		}
	}

	protected void DeleteNews(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		NewsDao dao = new NewsDao();
		int idnews = Integer.parseInt(req.getParameter("idnews"));
		News news = dao.getNews(idnews);

		if (user == null || !(news.getAuthor().equals(user.getIduser()))) {
			resp.sendRedirect("signin.jsp");
		} else {
			dao.deleteNews(idnews);
			resp.sendRedirect("/news");
		}
	}

	protected void ShowNews(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		NewsDao dao = new NewsDao();

		int idnews = Integer.parseInt(req.getParameter("idnews"));

		News news = dao.getNews(idnews);
		req.setAttribute("news", news);

		req.getRequestDispatcher("/news.jsp").forward(req, resp);
	}

	protected News getNewsFormPost(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		News news = new News();

		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(1024 * 1024 * 2);

		File tempDir = (File) request.getServletContext().getAttribute("javax.servlet.context.tempdir");
		factory.setRepository(tempDir);

		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(1024 * 1024 * 5);

		try {
			List<FileItem> items = upload.parseRequest(request);
			for (FileItem item : items) {
				if (item.isFormField()) {
					switch (item.getFieldName()) {
					case "title":
						news.setTitle(item.getString("utf-8"));
						break;
					case "annotation":
						news.setAnnotation(item.getString("utf-8"));
						break;
					case "text":
						news.setText(item.getString("utf-8"));
						break;
					case "idcat":
						news.setIdcat(Integer.parseInt(item.getString("utf-8")));
						break;
					case "idnews":
						news.setIdnews(Integer.parseInt(item.getString("utf-8")));
						break;
					default:
						break;
					}
					HttpSession session = request.getSession();
					User user = (User) session.getAttribute("user");
					news.setAuthor(user.getIduser());
				} else {
					if (item.getSize() != 0) {
						File uploadedFile = null;
						String nameFile;
						do {
							nameFile = "img/" + new File(item.getName()).getName();
							String path = request.getServletContext().getRealPath("/" + nameFile);
							uploadedFile = new File(path);
						} while (uploadedFile.exists());
						uploadedFile.createNewFile();
						item.write(uploadedFile);
						news.setImage(nameFile);
					}
				}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return news;
	}

}
