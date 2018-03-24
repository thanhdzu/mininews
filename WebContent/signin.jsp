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
		    	<div class="navbar-brand"><a href="/news">Trang tin tức</a></div>
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
	      		</ul> 
      		</div> 	
    	</div>
    </nav>
    
    <div class="container">
    	<div class="row signin center-block">
	    	<form action="signin" method="post">
				  <div class="form-group">
				    <label for="exampleInputEmail1">Email</label>
				    <input name="iduser" type="email" class="form-control" id="exampleInputEmail1" placeholder="Email" required>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1">Mật khẩu</label>
				    <input name="userpassword" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
				  </div>
				  <button type="submit" class="btn btn-default">Đăng nhập</button>
			</form>
	    </div>
	    <hr>
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