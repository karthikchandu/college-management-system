<%-- 
    Document   : marksdetails
    Created on : Nov 28, 2018, 10:39:19 AM
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
        <title>Marks Page</title>
    </head>
    <body>
   
        <h1 style="color:whitesmoke;background-color:darkslateblue;">Welcome to home page</h1>
        <h2> students marks details</h2>
         <%
Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegemanagement?useSSL=false","root","root");
    
       String Query="select * from marks";
      
       PreparedStatement psm=con.prepareStatement(Query);
       ResultSet rs=psm.executeQuery();
       %>
       <table>
       <%
       out.println("<tr><th>username</th><th>subject1</th><th>subject2</th><th>subject3</th><th>subject4</th><th>total</th></tr>");
       while(rs.next())
       {
           out.println("<tr><td>"+rs.getString("username")+"</td><td>"+rs.getString("subject1")+"</td><td>"+rs.getString("subject2")+
                   "</td><td>"+rs.getString("subject3")+"</td><td>"+rs.getString("subject4")+"</td><td>"+rs.getString("total")+"</tr>");
       }
      %>
       </table>
    </body>
</html>
