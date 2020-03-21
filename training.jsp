<%-- 
    Document   : training
    Created on : Nov 17, 2018, 12:16:26 AM
    Author     : rohith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css">
           body { background-color:#ccccff;background-position-y:120px;background-position-x:90%; background-repeat: no-repeat;background-size:500px 200px;}
         
         </style>
        <title>Attendance and Scholarship</title>
         <%@page import ="java.sql.*"%>
         <%@page import ="javax.sql.*"%>
        
    </head>
    
       <body>
    <center><form method ="post" action="training2.jsp">
     <center><h2 style='background-color: darkslateblue;color: white;'>ATTENDANCE AND SCHOLERSHIP DETAILS</h2></center>
        <%
            
          String username= request.getParameter("uname");
          String attendance = request.getParameter("attendance");
         
Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngo?useSSL=false","root","root");
      
        String q = "UPDATE TRAINING SET attendance=?"+" where username=?";
        PreparedStatement p = con.prepareStatement(q);
          p.setString(1,attendance);
          p.setString(2,username);
          p.executeUpdate();
        
       String Query="select * from training";
       PreparedStatement psm=con.prepareStatement(Query);
       ResultSet rs=psm.executeQuery();
       %>
        <table border="1" width="1000" cellpadding="10" cellspacing="1">
           <tr>
               <td>Enter the uid & attendance</td>
               <td><input type="text" name="uname" placeholder="username"/></td>
               <td><input type="text" name="attendance" placeholder="attendance"/></td>
           </tr>
       </table>
       <table  border="3" width="1000" cellpadding="10" cellspacing="1" >
       <%
       out.println("<tr><th>USERID</th><th>TOTAL ATTENDANCE</th><th>AMOUNT</th></tr>");
       while(rs.next())
       {
           %>
           <td><%out.println(rs.getString("username"));%></td>
           <td><%out.println(rs.getString("attendance"));%></td>
           <td><%out.println(rs.getString("amount"));%></td></tr>
       <%
       }
       out.println("</table>");
       %> <td><br> <input type="submit" value="Submit attendance"/></td>
          <td><a href = "admin.html" ><input type="Button" value="Back to home page"</a></td>
            </table></form></center>
    
    </body>
</html>
