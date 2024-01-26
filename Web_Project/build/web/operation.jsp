<%@page import="java.sql.*" %>
<% 
   response.sendRedirect("Home.jsp");
    try{
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/web-application","root",""); 
    if(request.getParameter("teacher") != null){
    String teacherId = request.getParameter("tid");
    String teacherName = request.getParameter("tname");
    String specification = request.getParameter("specification");
    

    PreparedStatement ps =con.prepareStatement("INSERT INTO `teacher` (`TeacherId`, `teacherName`, `specification`) VALUES (?, ?, ?)");
    ps.setString(1, teacherId);
    ps.setString(2, teacherName);
    ps.setString(3, specification);
    ps.executeUpdate();
    
 
    
    }else if (request.getParameter("student") != null)
    {
    String studentId = request.getParameter("sid");
    String studentName = request.getParameter("sname");
    String studentEmail = request.getParameter("semail");
    
    PreparedStatement ps =con.prepareStatement("INSERT INTO `student` (`sid`, `sname`, `email`)  VALUES (?, ?, ?)"); 
    ps.setString(1, studentId);
    ps.setString(2, studentName);
    ps.setString(3, studentEmail );
    ps.executeUpdate();
     %>
     <script>alert("data stored");</script>
    <%
    }
    else if (request.getParameter("book") != null)
    {
    String bookId = request.getParameter("bookid");
    String bookTitle = request.getParameter("booktitle");
    String bookAuthor = request.getParameter("author");
    String bookPrice = request.getParameter("price");
    
    PreparedStatement ps =con.prepareStatement("INSERT INTO `book` (`bookid`, `booktitle`, `author`, `price`) VALUES (?,?, ?, ?)"); 
    ps.setString(1, bookId);
    ps.setString(2,  bookTitle );
    ps.setString(3,  bookAuthor);
    ps.setString(4, bookPrice );
    ps.executeUpdate();
 
    }
   
    }catch(Exception e){
    e.printStackTrace();
    }
 

    
%>