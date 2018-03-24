package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.model.Category;
import com.model.News;
import com.model.User;
import com.dao.ConnectDB;

public class NewsDao implements NewsInterface {

	private static Connection myConnection;
	ConnectDB conn = new ConnectDB();
	
	@Override
	public Category getCategory(int idcategory) {
		myConnection = conn.getConnection();

		Category category = new Category();
		try {
			PreparedStatement pStatement = myConnection
					.prepareStatement("select idcategory,namecategory from category where idcategory=?");
			pStatement.setInt(1, idcategory);
			ResultSet result = pStatement.executeQuery();
			result.next();
			category.setIdcategory(result.getInt("idcategory"));
			category.setNamecategory(result.getString("namecategory"));
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return category;
	}

	@Override
	public News getNews(int idnews) {
		myConnection = conn.getConnection();
		News news = new News();
		try {
			PreparedStatement pStatement = myConnection.prepareStatement(
					"select idnews,idcat,title,annotation,text,author,date,image,namecategory,username,usersurname from news,category,user where idnews=? and idcat=idcategory and author=iduser");
			pStatement.setInt(1, idnews);
			ResultSet result = pStatement.executeQuery();
			result.next();
			news.setIdnews(result.getInt("idnews"));
			news.setIdcat(result.getInt("idcat"));
			news.setTitle(result.getString("title"));
			news.setAnnotation(result.getString("annotation"));
			news.setText(result.getString("text"));
			news.setAuthor(result.getString("author"));
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
			String date = dateFormat.format(result.getDate("date"));
			news.setDate(date);
			news.setImage(result.getString("image"));
			news.setNamecategory(result.getString("namecategory"));
			news.setUsername(result.getString("username"));
			news.setUsersurname(result.getString("usersurname"));
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return news;
	}

	@Override
	public User getUser(String email) {
		myConnection = conn.getConnection();
		User user = new User();
		try {
			PreparedStatement pStatement = myConnection.prepareStatement("select * from user where iduser=?");
			pStatement.setString(1, email);
			ResultSet result = pStatement.executeQuery();
			result.next();
			user.setIduser(result.getString("iduser"));
			user.setUsername(result.getString("username"));
			user.setUsersurname(result.getString("usersurname"));
			user.setUserpassword(result.getString("userpassword"));
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public ArrayList<Category> getAllCategories() {
		myConnection = conn.getConnection();
		ArrayList<Category> categories = new ArrayList<Category>();
		try {
			Statement statement = myConnection.createStatement();
			ResultSet result = statement.executeQuery("select * from category");
			while (result.next()) {
				Category category = new Category();
				category.setIdcategory(result.getInt("idcategory"));
				category.setNamecategory(result.getString("namecategory"));
				categories.add(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return categories;
	}

	@Override
	public ArrayList<News> getAllNewsByCat(int idCat) {
		myConnection = conn.getConnection();
		ArrayList<News> allNewsByCat = new ArrayList<News>();

		try {
			PreparedStatement statement = myConnection.prepareStatement(
					"select idnews,idcat,title,annotation,text,author,date,image,namecategory,username,usersurname from news,category,user where idcat=? and idcat=idcategory and author=iduser order by time_to_sec(date) desc");
			statement.setInt(1, idCat);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				News news = new News();
				news.setIdnews(result.getInt("idnews"));
				news.setIdcat(result.getInt("idcat"));
				news.setTitle(result.getString("title"));
				news.setAnnotation(result.getString("annotation"));
				news.setText(result.getString("text"));
				news.setAuthor(result.getString("author"));
				SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
				String date = dateFormat.format(result.getDate("date"));
				news.setDate(date);
				news.setImage(result.getString("image"));
				news.setNamecategory(result.getString("namecategory"));
				news.setUsername(result.getString("username"));
				news.setUsersurname(result.getString("usersurname"));
				allNewsByCat.add(news);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return allNewsByCat;
	}

	@Override
	public ArrayList<News> getFirstNewsByCat(int idCat) {
		myConnection = conn.getConnection();
		ArrayList<News> firstNewsByCat = new ArrayList<News>();

		int amount = 4;
		try {
			PreparedStatement statement = myConnection.prepareStatement(
					"select idnews,idcat,title,annotation,text,author,date,image,namecategory,username,usersurname from news,category,user where idcat=? and idcat=idcategory and author=iduser order by time_to_sec(date) desc limit ?");
			statement.setInt(1, idCat);
			statement.setInt(2, amount);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				News news = new News();
				news.setIdnews(result.getInt("idnews"));
				news.setIdcat(result.getInt("idcat"));
				news.setTitle(result.getString("title"));
				news.setAnnotation(result.getString("annotation"));
				news.setText(result.getString("text"));
				news.setAuthor(result.getString("author"));
				SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
				String date = dateFormat.format(result.getDate("date"));
				news.setDate(date);
				news.setImage(result.getString("image"));
				news.setNamecategory(result.getString("namecategory"));
				news.setUsername(result.getString("username"));
				news.setUsersurname(result.getString("usersurname"));
				firstNewsByCat.add(news);
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return firstNewsByCat;
	}

	@Override
	public ArrayList<User> getAllUsers() {
		myConnection = conn.getConnection();
		ArrayList<User> users = new ArrayList<User>();
		try {
			Statement statement = myConnection.createStatement();
			ResultSet result = statement.executeQuery("select * from user");
			while (result.next()) {
				User user = new User();
				user.setIduser(result.getString("iduser"));
				user.setUsername(result.getString("username"));
				user.setUsername(result.getString("usersurname"));
				user.setUserpassword(result.getString("userpassword"));
				users.add(user);
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}

	@Override
	public void setNews(News news) {
		myConnection = conn.getConnection();
		try {
			PreparedStatement statement = myConnection.prepareStatement(
					"insert into news (idcat,title,annotation,text,author,image) values (?,?,?,?,?,?)");
			statement.setInt(1, news.getIdcat());
			statement.setString(2, news.getTitle());
			statement.setString(3, news.getAnnotation());
			statement.setString(4, news.getText());
			statement.setString(5, news.getAuthor());
			String image = news.getImage();
			if (image == null || image.isEmpty()) {
				image = "img/default.png";
			}
			statement.setString(6, image);
			statement.executeUpdate();
			myConnection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void deleteNews(int idnews) {
		myConnection = conn.getConnection();
		try {
			PreparedStatement statement = myConnection.prepareStatement("delete from news where idnews=?");
			statement.setInt(1, idnews);
			statement.executeUpdate();
			myConnection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void editNews(News news) {
		myConnection = conn.getConnection();
		String image = news.getImage();
		if (image == null || image.isEmpty()) {
			image = "";
		} else {
			image = ",image='" + image + "' ";
		}

		try {
			PreparedStatement statement = myConnection.prepareStatement(
					"update news set idcat=?,title=?,annotation=?,text=?" + image + " where idnews=?");
			statement.setInt(1, news.getIdcat());
			statement.setString(2, news.getTitle());
			statement.setString(3, news.getAnnotation());
			statement.setString(4, news.getText());
			statement.setInt(5, news.getIdnews());
			statement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
