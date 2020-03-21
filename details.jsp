<%-- 
    Document   : home
    Created on : Nov 4, 2018, 11:23:58 PM
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
        <title>Home Page</title>
    </head>
    <body>
   
        <h1 style="color:whitesmoke;background-color:darkslateblue;">Welcome to home page</h1>
        <h2>registered students and their details</h2>
         <%
Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegemanagement?useSSL=false","root","root");
    
       String Query="select * from student";
      
       PreparedStatement psm=con.prepareStatement(Query);
       ResultSet rs=psm.executeQuery();
       %>
       <table>
       <%
       out.println("<tr><th>student name</th><th>section</th><th>class</th><th>department</th></tr>");
       while(rs.next())
       {
           out.println("<tr><td>"+rs.getString("sname")+"</td><td>"+rs.getString("ssec")+"</td><td>"+rs.getString("sclass")+
                   "</td><td>"+rs.getString("sdept")+"</tr>");
       }
      %>
       </table>
    </body>
</html>
