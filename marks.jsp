<%-- 
    Document   : marks.jsp
    Created on : Nov 25, 2018, 6:51:13 AM
    Author     : rohith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
    </head>
    <body>
         <%@page import="java.sql.*"%>
        <%@page import="javax.sql.*"%>
        <%
            String username=request.getParameter("username");
            String sub1=request.getParameter("subject1");
            String sub2=request.getParameter("subject2");
            String sub3=request.getParameter("subject3");
            String sub4=request.getParameter("subject4");
            
            
            
            
             Class.forName("com.mysql.jdbc.Driver").newInstance();
             java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/collegemanagement?allowPublicKeyRetrieval=true&useSSL=false","root","root");
             
            String q = "INSERT INTO marks (username,subject1,subject2,subject3,subject4,total) VALUES (?,?,?,?,?,?)";
            PreparedStatement p = con.prepareStatement(q);
            p.setString(1,username);
            p.setString(2,sub1);
            p.setString(3,sub2);
            p.setString(4,sub3);
            p.setString(5,sub4);
            p.setString(6,null);
            p.executeUpdate();
           response.sendRedirect("rohit.html");
            con.close();
   
            
        %>   
    </body>
</html>

