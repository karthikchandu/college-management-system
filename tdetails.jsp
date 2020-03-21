<%-- 
    Document   : tdetails
    Created on : Nov 28, 2018, 10:22:54 AM
    Author     : rohith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@page import ="java.sql.*"%>
         <%@page import ="javax.sql.*"%>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <style type="text/css">
           body { background-color:#ccccff;background-position-y:120px;background-position-x:90%; background-repeat: no-repeat;background-size:500px 200px;}
         table{border:1; }
         </style>
        <title>Teacher Page</title>
    </head>
    <body>
   
        <h1 style="color:whitesmoke;background-color:darkslateblue;">Teachers details</h1>
         <%
Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegemanagement?useSSL=false","root","root");
    
       String Query="select * from teacher";
      
       PreparedStatement psm=con.prepareStatement(Query);
       ResultSet rs=psm.executeQuery();
       %>
       <table>
       <%
       out.println("<tr><th>teachername</th><th>dob</th><th>emailId</th><th>address</th><th>phone</th><th>gender</th><th>teacherId</td></tr>");
       while(rs.next())
       {
           out.println("<tr><td>"+rs.getString("teachername")+"</td><td>"+rs.getString("dob")+"</td><td>"+rs.getString("email")+
                   "</td><td>"+rs.getString("address")+"</td><td>"+rs.getString("phone")+"</td><td>"+rs.getString("id")+"</tr>");
       }
      %>
       </table>
    </body>
</html>
