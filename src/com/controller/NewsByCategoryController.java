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

@WebServlet("/category")
public class NewsByCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NewsByCategoryController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String idcategory = request.getParameter("idcategory");
		String action = request.getParameter("action");
		if (idcategory == null) {
			response.sendRedirect("/news");
		} else {

			if ("create".equals(action)) {
				Create(request, response);
			} else if ("signin".equals(action)) {
				response.sendRedirect("/signin.jsp");
			} else {
				NewsByCatPage(request, response);
			}

		}
	}

	public void Create(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			req.getRequestDispatcher("/signin.jsp").forward(req, resp);
		} else {
			req.getRequestDispatcher("/createnews.jsp").forward(req, resp);
		}

	}

	public void NewsByCatPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		NewsDao dao = new NewsDao();
		String idcategory = req.getParameter("idcategory");

		ArrayList<News> newsByCat = dao.getAllNewsByCat(Integer.parseInt(idcategory));
		req.setAttribute("newsByCat", newsByCat);

		Category category = dao.getCategory(Integer.parseInt(idcategory));
		req.setAttribute("category", category);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/newsbycat.jsp");
		dispatcher.forward(req, resp);

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (isMultipart) {
			News news = null;
			news = getNewsFormPost(request);
			NewsDao dao =new NewsDao();
			
			dao.setNews(news);
			response.sendRedirect("/news");
		} else {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}
	}
	
	protected News getNewsFormPost(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		News news = new News();
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(1024*1024*2);
		
		File tempDir = (File)request.getServletContext().getAttribute("javax.servlet.context.tempdir");
		factory.setRepository(tempDir);
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(1024*1024*5);
		
		try {
			List<FileItem> items = upload.parseRequest(request);
			for (FileItem item : items) {
				if(item.isFormField()){
					switch (item.getFieldName()) {
					case "title": news.setTitle(item.getString("utf-8"));						
						break;
					case "annotation": news.setAnnotation(item.getString("utf-8"));						
						break;
					case "text": news.setText(item.getString("utf-8"));						
						break;
					case "idcat": news.setIdcat(Integer.parseInt(item.getString("utf-8")));						
						break;
					case "idnews": news.setIdnews(Integer.parseInt(item.getString("utf-8")));						
						break;	
					default:
						break;
					}
					HttpSession session = request.getSession();
					User user = (User)session.getAttribute("user");
					news.setAuthor(user.getIduser());
				} else {
					if(item.getSize() != 0){
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
