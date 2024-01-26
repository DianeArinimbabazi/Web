<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Home Page</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    header {
      background-color: #333;
      color: #fff;
      padding: 20px;
    }

    nav ul {
      list-style: none;
      padding: 0;
      margin: 0;
    }

    nav ul li {
      display: inline;
      margin-right: 20px;
    }

    nav ul li a {
      color: #fff;
      text-decoration: none;
    }

    nav ul li a:hover {
      text-decoration: underline;
    }

    main {
      padding: 20px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    table th, table td {
      border: 1px solid #ccc;
      padding: 8px;
      text-align: left;
    }
        form {
      max-width: 300px;
      margin-bottom: 20px;
    }

    form input,
    form select,
    form button {
      width: 100%;
      padding: 10px;
      margin-bottom: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    form button {
      background-color: #007bff;
      color: #fff;
      border: none;
      cursor: pointer;
    }

    form button:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
  <header>
    <h1>Welcome to Your Application</h1>
    <nav>
      <ul>
        <li><a href="#" onclick="showTable('teachers')">Teachers</a></li>
        <li><a href="#" onclick="showTable('students')">Students</a></li>
        <li><a href="#" onclick="showTable('books')">Books</a></li>
      </ul>
    </nav>
  </header>

  <main>
    <section id="teachers" style="display: none;">
     <h2>Teachers</h2>
     <form id="teacherForm" action="operation.jsp">
         <input type="text" placeholder="Teacher Id" name="tid">
        <input type="text" placeholder="Teacher Name" name="tname">
        <input type="text" placeholder="specification" name="specification">
        <button type="submit" name="teacher">Register</button>
      </form>
      <table>
        <thead>
          <tr>
            <th>Teachers Id</th>
            <th>Teachers Name</th>
            <th>Specification</th>
            <th  colspan="2">Actions</th>
          </tr>
       
       
        <%
     if(request.getParameter("teacher") != null){
            }
    %>
    <script>alert("data stored");</script>
    <%
     try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/web-application","root","");
    Statement st= conn.createStatement();
    String ql="Select * from teacher ";
    ResultSet rs = st.executeQuery(ql);
    while(rs.next()){
    String teacherId = rs.getString("TeacherId");
           %>
          <tr>             
        <td><%= rs.getString("TeacherId")%></td>
        <td><%=rs.getString("teacherName") %></td>
        <td><%=rs.getString("specification") %></td>
        <td><a style="color:green; text-decoration: none;" href="UpdateTeacher.jsp?id=<%= teacherId%>">Edit</a></td>
        <td><a style="color:red; text-decoration: none;" href="deleteTeacher.jsp?id=<%= teacherId%>">Delete</a></td>
         </tr>
              <% 
             }
       }catch(Exception e){
            out.print(e);
             }

            %>
 
       </thead>
      </table>
    </section>

    <section id="students" style="display: none;">
      <!-- Table for Customers -->
      <h2>Students</h2>
      <form id="studentForm"  action="operation.jsp" method="post">
        <input type="text" placeholder="Student Id" name="sid">
        <input type="text" placeholder="Student Name" name="sname">
        <input type="email" placeholder="Email" name="semail">
        <button type="submit" name="student">Add Student</button>
      </form>
      <table>
        <thead>
          <tr>
            <th>Student ID</th>
            <th>Student Name</th>
            <th>Email</th>
            <th colspan="2">Actions</th>
          </tr>
         <% 
           try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/web-application","root","");
    Statement st= conn.createStatement();
    String ql="Select * from Student ";
    ResultSet rs = st.executeQuery(ql);
    while(rs.next()){
    String sid = rs.getString("sid");
           %>
          <tr>             
        <td><%= rs.getString("sid")%></td>
        <td><%=rs.getString("sname") %></td>
        <td><%=rs.getString("email") %></td>
        <td><a style="color:green; text-decoration: none;" href="UpdateStudent.jsp?id=<%= sid%>">Edit</a></td>
        <td><a style="color:red; text-decoration: none;" href="deleteStudent.jsp?id=<%= sid%>">Delete</a></td>
         </tr>
              <% 
             }
       }catch(Exception e){
            out.print(e);
             }

            %>
 
          
          
          
        </thead>
       
        
      </table>
    </section>

    <section id="books" style="display: none;">
      <!-- Table for Orders -->
      <h2>Books</h2>
     <form id="BookForms" action="operation.jsp" method="post">
         <input type="text" placeholder="Book ID" name="bookid">
         <input type="text" placeholder="book title" name="booktitle">
            <input type="text" placeholder="price" name="price">
         <input type="text" placeholder="Author" name="author">
          <input type="text" placeholder="price" name="price">
         <button type="submit" name="book">Add Book</button>
      </form>
      <table>
        <thead>
          <tr>
            <th>Book ID</th>
            <th>Book Title </th>
            <th>Authors </th>
            <th>Price</th>
            <th colspan="2">Actions</th>
          </tr>
          
          
              <% 
           try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/web-application","root","");
    Statement st= conn.createStatement();
    String ql="Select * from book ";
    ResultSet rs = st.executeQuery(ql);
    while(rs.next()){
    String bookid = rs.getString("bookid");
           %>
          <tr>             
        <td><%= rs.getString("bookid")%></td>
        <td><%=rs.getString("booktitle") %></td>
        <td><%=rs.getString("author") %></td>
        <td><%=rs.getString("price") %></td>
        <td><a style="color:green; text-decoration: none;" href="UpdateBook.jsp?id=<%= bookid%>">Edit</a></td>
        <td><a style="color:red; text-decoration: none;" href="deleteBook.jsp?id=<%= bookid%>">Delete</a></td>
         </tr>
              <% 
             }
       }catch(Exception e){
            out.print(e);
             }

            %>
 
          
        </thead>
       
      </table>
    </section>
  </main>

  <script>
    function showTable(tableId) {
      // Hide all sections/tables
      const sections = document.querySelectorAll('section');
      sections.forEach(section => {
        section.style.display = 'none';
      });

      // Show the selected table based on tableId
      const selectedTable = document.getElementById(tableId);
      if (selectedTable) {
        selectedTable.style.display = 'block';
      }
    }
  </script>
</body>
</html>
