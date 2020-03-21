<%-- 
    Document   : hostel
    Created on : Nov 25, 2018, 10:51:27 PM
    Author     : rohith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
 <%@page import="java.sql.*"%>
        <%@page import="javax.sql.*"%>
        <%
            String username=request.getParameter("username");
            String hname=request.getParameter("hostelname");
            String roomno=request.getParameter("roomno");
           
             Class.forName("com.mysql.jdbc.Driver").newInstance();
             java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/collegemanagement?allowPublicKeyRetrieval=true&useSSL=false","root","root");
             
             CallableStatement calstat=con.prepareCall("{call hostel(?,?,?)}");
            calstat.setString(1,username);
            calstat.setString(2,hname);
            calstat.setString(3,roomno);
            
            
            
            ResultSet rs=calstat.executeQuery();
            con.close();
            calstat.close();
            response.sendRedirect("rohit.html");
   
            
        %>   
    </body>
</html>
