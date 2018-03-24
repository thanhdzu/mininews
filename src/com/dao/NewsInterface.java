package com.dao;

import java.util.ArrayList;

import com.model.Category;
import com.model.News;
import com.model.User;

public interface NewsInterface {
	Category getCategory(int idcategory);

	News getNews(int idnews);

	User getUser(String email);

	ArrayList<Category> getAllCategories();

	ArrayList<News> getAllNewsByCat(int idCategory);

	ArrayList<News> getFirstNewsByCat(int idCategory);

	ArrayList<User> getAllUsers();

	void setNews(News news);

	void deleteNews(int idnews);

	void editNews(News news);
}
