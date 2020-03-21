<%-- 
    Document   : training2
    Created on : Nov 18, 2018, 8:39:48 PM
    Author     : rohith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@ page import="java.sql.*" import="javax.sql.*"%>
        <style type="text/css">
           body { background-color:#ccccff;}
        </style>
    </head>
    <body>
     
    <center><h2 style='background-color: darkslateblue;color: white;'>ATTENDANCE AND SCHOLERSHIP DETAILS</h2></center>
       <!-- <table><th>DATE</th><td><input type="date" name="day"/></td></table>-->
        <center><form method ="post" action="training.jsp">
               <%
                   String username= request.getParameter("uname");
                   String attendance = request.getParameter("attendance");
                   
Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngo?useSSL=false","root","vracksss");
        
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
            </table>
        </form></center>
          <!--table { border: solid darkslateblue; padding:20px;border-width: 5px;spacing:10px; }-->
       
    </body>
</html>
