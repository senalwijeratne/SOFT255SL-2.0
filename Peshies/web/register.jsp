<%-- 
    Document   : register
    Created on : Apr 20, 2017, 9:57:47 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
      <div class="container">
          <form class="form-signin" action="Register" method="POST">
            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
            <h2 class="form-signin-heading">Welcome</h2>
            <label for="inputPassword" class="sr-only">email</label>
            <input type="email" id="inputPassword" class="form-control" placeholder="email"  name="email" required>
            <label for="inputPassword" class="sr-only">Password</label>
            <input type="password" id="inputPassword" class="form-control" placeholder="Password"  name="Password" required>
            <div class="checkbox">
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            
          </form>
        </div> <!-- /container -->
    
</html>
