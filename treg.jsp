<%-- 
    Document   : treg
    Created on : Nov 25, 2018, 10:26:21 AM
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
            String tname=request.getParameter("teachername");
            String dob=request.getParameter("dob");
            String temail=request.getParameter("email");
            String address=request.getParameter("address");
            String pno=request.getParameter("phone");
            String gender=request.getParameter("gender");
            String tid=request.getParameter("id");
            String pwd1=request.getParameter("pwd1");
           
             Class.forName("com.mysql.jdbc.Driver").newInstance();
             java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/collegemanagement?allowPublicKeyRetrieval=true&useSSL=false","root","root");
             
            
            CallableStatement calstat=con.prepareCall("{call tregister(?,?,?,?,?,?,?,?)}");
            calstat.setString(1,tname);
            calstat.setString(2,dob);
            calstat.setString(3,temail);
            calstat.setString(4,address);
            calstat.setString(5,pno);
            calstat.setString(6,gender);
            calstat.setString(7,tid);
            calstat.setString(8,pwd1);
            
            ResultSet rs=calstat.executeQuery();
            con.close();
            calstat.close();
            response.sendRedirect("tlogin.html");
   
            
        %>   
    </body>
</html>

