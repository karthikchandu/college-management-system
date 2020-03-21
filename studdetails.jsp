<%-- 
    Document   : studdetails
    Created on : Nov 26, 2018, 7:13:25 PM
    Author     : rohith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@page import ="java.sql.*"%>
        <%@page import ="javax.sql.*"%>
        <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
              
        <title>JSP Page</title>
    </head>
    <body>
        <h1>MARKS DETAILS</h1>
        <%
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegemanagement?useSSL=false,"root","root");
        String query="select * from student";
        PreparedStatement psm=con.prepareStatement(query);
        ResultSet rs=psm.executeQuery();
        
        %>
        <%
            out.println("<tr><td>"+rs.getString("sname")+"</td><td>"+rs.getString(columnLabel)
    </body>
</html>
