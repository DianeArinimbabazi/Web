<%@page import="java.sql.*" %>
<%
    if(request.getParameter("submit")!= null){
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String role = request.getParameter("role");
    try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/web-application","root","");
    Statement st= conn.createStatement();
    String ql="Select * from signup where username='"+username+"'";
    ResultSet rs = st.executeQuery(ql);
    if (rs.next()){
    rs.getString("username");
 %>
 <script>
    alert("username alread exists!!!");
 </script>
 <%
    }else{
    PreparedStatement ps =conn.prepareStatement("INSERT INTO `signup` (`id`, `username`, `password`, `role`) VALUES (NULL, ?, ?, ?)");
    ps.setString(1, username);
    ps.setString(2, password);
    ps.setString(3, role);
    ps.executeUpdate();
    response.sendRedirect("Login.jsp");
   }
%>
<script>
    alert("registration successfull!!");
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
  <title>Signup</title>
  <style>

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


form {
  background-color: #fff;
  padding: 30px;
  border-radius: 8px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.7);
  max-width: 400px;
  width: 100%;
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

  </style>
</head>
<body>
  
  <form id="signupForm" onsubmit="return validateForm()">
      <h2 style="text-align: center">Signup</h2>
    <label for="username">Username:</label><br>
    <input type="text" id="username" name="username" ><br>
    <label for="password">Password:</label><br>
    <input type="password" id="password" name="password" ><br>
    <label for="role">Role:</label><br>
    <select id="role" name="role">
      <option value="user">User</option>
      <option value="admin">Admin</option>
    </select><br><br>
    <input type="submit" name="submit" value="Signup">
    <p style="text-align: left; margin-top: 20px;">Already have an account? <a href="Login.jsp">Login</a></p>
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
