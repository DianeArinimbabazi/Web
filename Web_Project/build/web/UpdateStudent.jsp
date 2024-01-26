<%@page import="java.sql.*" %>
<%
 try{
    
  
    if(request.getParameter("student") != null){
     Class.forName("com.mysql.jdbc.Driver");
    Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/web-application","root",""); 
    String sId = request.getParameter("sid");
    String sName= request.getParameter("sname");
    String email = request.getParameter("semail");
    PreparedStatement  ps=con.prepareStatement("update `student`  set sid=?, sname=?, email=?where  sid=?");
    ps.setString(1, sId);
    ps.setString(2, sName);
    ps.setString(3, email);
    ps.setString(4, sId);
  
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
        <h2>Students</h2>
      <form id="studentForm"  action="#" method="post">
            <%
                         try{
                         
                          PreparedStatement ps;
                          ResultSet rs;
                          Class.forName("com.mysql.jdbc.Driver");
                          Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/web-application","root","");
                          String sid =request.getParameter("id");
                          ps=conn.prepareStatement("select * from student where sid=?");
                          ps.setString(1,sid);
                          rs=ps.executeQuery();
                          while(rs.next()){
   
                    %>
          
        <input type="text" placeholder="Student Id" name="sid" value="<%=rs.getString("sid")%>"  >
        <input type="text" placeholder="Student Name" name="sname" value="<%=rs.getString("sname")%>" >
        <input type="email" placeholder="Email" name="semail" value="<%=rs.getString("email")%>" >
                
             <%
                        } 
                     }catch(Exception e){
                       out.print(e);
                     }
              %>
        <button type="submit" name="student">Update Student</button>
      </form>
    </body>
</html>
