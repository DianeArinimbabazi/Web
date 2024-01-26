<%@page import="java.sql.*" %>
<%
 try{
    
  
    if(request.getParameter("book") != null){
     Class.forName("com.mysql.jdbc.Driver");
    Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/web-application","root",""); 
    String bookId = request.getParameter("bookid");
    String bookTitle = request.getParameter("booktitle");
    String bookAuthor = request.getParameter("author");
    String bookPrice = request.getParameter("price");
    PreparedStatement  ps=con.prepareStatement("update `book`  set bookid=?, booktitle=?,author=?,price=? where  bookid=?");
    ps.setString(1, bookId);
    ps.setString(2,  bookTitle );
    ps.setString(3,  bookAuthor);
    ps.setString(4, bookPrice );
    ps.setString(5, bookId);
    ps.executeUpdate();
     %>
     <script>alert("Updated");</script>
    <%  %>
    
    <%
    }
    }catch(Exception e){
    e.printStackTrace();
    }
   
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
        <style>
                
     header {
      background-color: #333;
      color: #fff;
      padding: 20px;
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
    <h2>Books</h2>
     <form id="BookForms" action="#" method="post">
               <%
                         try{
                         
                          PreparedStatement ps;
                          ResultSet rs;
                          Class.forName("com.mysql.jdbc.Driver");
                          Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/web-application","root","");
                          String bookid =request.getParameter("id");
                          ps=conn.prepareStatement("select * from book where bookid=?");
                          ps.setString(1,bookid);
                          rs=ps.executeQuery();
                          while(rs.next()){
   
                    %>
                    
         <input type="text" placeholder="Book ID" name="bookid" value="<%=rs.getString("bookid")%>"  >
         <input type="text" placeholder="book title" name="booktitle" value="<%=rs.getString("booktitle")%>"  >
         <input type="text" placeholder="Author" name="author" value="<%=rs.getString("author")%>" >
          <input type="text" placeholder="price" name="price" value="<%=rs.getString("price")%>" >
          
             <%
                        } 
                     }catch(Exception e){
                       out.print(e);
                     }
              %>
         <button type="submit" name="book">Update Book</button>
         
      </form>
         
    </body>
</html>
