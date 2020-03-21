<%-- 
    Document   : reg
    Created on : Nov 25, 2018, 6:09:35 AM
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
            String sname=request.getParameter("studentname");
            String ssec=request.getParameter("section");
            String sclass=request.getParameter("class");
            String sdept=request.getParameter("department");
            String username=request.getParameter("studentId");
            String password=request.getParameter("password");
            
            
            
             Class.forName("com.mysql.jdbc.Driver").newInstance();
             java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/collegemanagement?allowPublicKeyRetrieval=true&useSSL=false","root","root");
             
            
            CallableStatement calstat=con.prepareCall("{call register(?,?,?,?,?,?)}");
            calstat.setString(1,username);
            calstat.setString(2,sname);
            calstat.setString(3,ssec);
            calstat.setString(4,sclass);
            calstat.setString(5,sdept);
            calstat.setString(6,password);
            
            ResultSet rs=calstat.executeQuery();
            con.close();
            calstat.close();
            response.sendRedirect("index.html");
   
            
        %>   
    </body>
</html>

