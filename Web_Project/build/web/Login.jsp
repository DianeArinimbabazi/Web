<%@page import="java.sql.*" %>
<%
   if (request.getParameter("submit")!= null){
   String username= request.getParameter("username");
   String password = request.getParameter("password");
     try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/web-application","root","");
    Statement st= conn.createStatement();
    String ql="Select * from signup where username='"+username+"' and  password='"+password+"'";
    ResultSet rs = st.executeQuery(ql);
    while(rs.next()){
     rs.getString("username"); 
      rs.getString("password"); 

 %>
     <script>
         alert("login successfull !!!");
     </script>
<% 
    }
%>
     <script>
         alert("wrong username or password !!!");
     </script>
<%
    }catch(Exception e){
    out.print(e);
    }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login</title>
  <style>
      /* styles.css */

/* Body styling */
body {
  font-family: Arial, sans-serif;
  background-color: #f7f7f7;
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

/* Form styling */
form {
  background-color: #fff;
  padding: 30px;
  border-radius: 8px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.7);
  max-width: 400px;
  width: 100%;
}

h2 {
  text-align: center;
  color: #333;
  margin-bottom: 20px;
  text-transform: uppercase;
  letter-spacing: 2px;
  font-size: 24px;
}

label {
  display: block;
  margin-bottom: 6px;
  font-weight: bold;
}

input[type="text"],
input[type="password"],
select {
  width: calc(100% - 20px);
  padding: 10px;
  margin-bottom: 15px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

input[type="submit"] {
  width: calc(100% - 20px);
  padding: 10px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
  background-color: #0056b3;
}

p {
  text-align: center;
  margin-top: 20px;
}

a {
  color: #007bff;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

  </style>
</head>
<body>
  
    <form id="loginForm" action="Home.jsp" onsubmit="return validateForm()">
    <h2>Login</h2>
    <label for="username">Username:</label><br>
    <input type="text" id="username" name="username" required><br>
    <label for="password">Password:</label><br>
    <input type="password" id="password" name="password" required><br><br>
    <input type="submit" name="submit" value="Login">
    
    <p style="text-align: left; margin-top: 20px;">Don't have an account? <a href="Signup.jsp">Signup</a></p>

  </form>

  
  <script>
    function validateForm() {
      var username = document.getElementById('username').value;
      var password = document.getElementById('password').value;

      if (username === '' || password === '') {
        alert('Please fill in all fields.');
        return false;
      }

      // Additional validation can be added here

      return true;
    }
  </script>
</body>
</html>
