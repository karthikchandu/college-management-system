<%-- 
    Document   : department
    Created on : Nov 28, 2018, 8:25:34 AM
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
            String dpid=request.getParameter("did");
            String dpname=request.getParameter("dname");
            
            
            
            
             Class.forName("com.mysql.jdbc.Driver").newInstance();
             java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/collegemanagement?allowPublicKeyRetrieval=true&useSSL=false","root","root");
             
            
            CallableStatement calstat=con.prepareCall("{call department(?,?,?)}");
            calstat.setString(1,username);
            calstat.setString(2,dpid);
            calstat.setString(3,dpname);
            
            ResultSet rs=calstat.executeQuery();
            con.close();
            calstat.close();
            response.sendRedirect("index.html");
   
            
        %>   
    </body>
</html>


