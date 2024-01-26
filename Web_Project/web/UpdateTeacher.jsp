<%@page import="java.sql.*" %>
<%
 try{
    
  
    if(request.getParameter("teacher") != null){
     Class.forName("com.mysql.jdbc.Driver");
    Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/web-application","root",""); 
    String tId = request.getParameter("tid");
    String tName= request.getParameter("tname");
    String speci = request.getParameter("specification");
    PreparedStatement  ps=con.prepareStatement("update `teacher`  set TeacherId=?, teacherName=?, specification=? where  TeacherId=?");
    ps.setString(1, tId );
    ps.setString(2, tName);
    ps.setString(3, speci);
    ps.setString(4, tId);
  
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
        <title>JSP Page</title>
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
        <h2>Teachers</h2>
        <form id="teacherForm" action="#" method="post">
                    <%
                         try{
                         
                          PreparedStatement ps;
                          ResultSet rs;
                          Class.forName("com.mysql.jdbc.Driver");
                          Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/web-application","root","");
                          String tid =request.getParameter("id");
                          ps=conn.prepareStatement("select * from teacher where TeacherId=?");
                          ps.setString(1,tid);
                          rs=ps.executeQuery();
                          while(rs.next()){
   
                    %>
         
         <input type="text" placeholder="Teacher Id" name="tid" value="<%=rs.getString("TeacherId")%>">
        <input type="text" placeholder="Teacher Name" name="tname" value="<%=rs.getString("teacherName")%>">
        <input type="text" placeholder="specification" name="specification" value="<%=rs.getString("Specification")%>">
              <%
                        } 
                     }catch(Exception e){
                       out.print(e);
                     }
              %>
        <button type="submit" name="teacher">Update </button>
      </form>
    </body>
</html>
