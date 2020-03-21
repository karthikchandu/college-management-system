<%-- 
    Document   : thosteldetails
    Created on : Nov 28, 2018, 12:23:13 PM
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
        <title>Hostel Page</title>
    </head>
    <body>
   
        <h1 style="color:whitesmoke;background-color:darkslateblue;">Welcome to home page</h1>
        <h2>Hostel Students details</h2>
         <%
Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegemanagement?useSSL=false","root","root");
    
       String Query="select * from hostel";
      
       PreparedStatement psm=con.prepareStatement(Query);
       ResultSet rs=psm.executeQuery();
       %>
       <table>
       <%
       out.println("<tr><th>Username</th><th>hostelname</th><th>Roomno</th></tr>");
       while(rs.next())
       {
           out.println("<tr><td>"+rs.getString("username")+"</td><td>"+rs.getString("hostelname")+"</td><td>"+rs.getString("roomno")+
                   "</tr>");
       }
      %>
       </table>
    </body>
</html>

