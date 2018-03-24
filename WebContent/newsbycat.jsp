<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>News feed</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link href="css/newsfeed.css" rel="stylesheet">
  </head>
  <body>
    
    <nav class="navbar navbar-inverse">
    	<div class="container-fluid">
    		<div class="navbar-header">
		    	<div class="navbar-brand"><a href="mainpage">Trang tin tức</a></div>
	    	</div>
	    	<div class="container-fluid">
		    	<ul class="nav navbar-nav navbar-right">
		    		<li class="dropdown">
			          <c:if test="${ sessionScope.user == null }">
			          <p><a type="button" class="btn btn-default navbar-btn" role="button" href="mainpage?action=signin">Đăng nhập</a></p>
			          </c:if>
			          <c:if test="${ sessionScope.user != null }">
			          <p><a type="button" class="btn btn-default navbar-btn" role="button" href="mainpage?action=logout">Đăng Xuất</a></p>
			          </c:if>
			        </li>
	        		<li>
	        			<c:if test="${ sessionScope.user == null }">
	        				<p class="navbar-text">Khách</p>
	        			</c:if>
	        			<c:if test="${ sessionScope.user != null }">
	        				<p class="navbar-text">${ sessionScope.currentusername }</p>
	        			</c:if>
        			</li>
			        <li class="dropdown">
			        	<div class="btn-group" role="group" aria-label="...">
			        		<a type="button" class="btn btn-default navbar-btn" role="button" href="category?idcategory=${ category.idcategory }&action=create">Tạo tin mới</a>
						</div>
			        </li>
	      		</ul> 
      		</div> 	
    	</div>
    </nav>
    
    <div class="container">    	
	    <div class="row"><h1 class="text-center"><span class="label label-danger">${ category.namecategory }</span></h1><br></div>
	    <br>
		<ul class="media-list">   
		    <c:forEach var="news" items="${ newsByCat }">
			    <li class="media">
				    <div class="media">
						<div class="media-left">
							<img class="media-object hidden-xs img-rounded" src="${ news.image }" alt="News image" width="200">
					  	</div>
					  	<div class="media-body">
					    	<h4 class="media-heading">${ news.title }</h4>
					    	<p>${ news.annotation }</p>
					  	</div>
					</div>
				</li>
				<br>
				<div class="pull-left">
					<p><a href="newspage?idnews=${ news.idnews }" class="btn btn-default" role="button">Chi tiết</a></p>
				</div>
				<p class="text-muted text-right">${ news.username } ${ news.usersurname } | ${ news.date }</p>
				<div class="clearfix"><hr></div>
			</c:forEach>
		</ul>
    </div>
    
    <footer class="footer">
      <div class="container">
        <p class="text-muted">&copy; Trang tin tức</p>
      </div>
    </footer>
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>