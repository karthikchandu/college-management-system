<%-- 
    Document   : studentdetails
    Created on : Nov 26, 2018, 12:20:44 AM
    Author     : rohith
--%>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

String driver = "com.mysql.jdbc.Driver";
String userid = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<body>

<h1>Retrieve data from database in jsp</h1>
<table border="1">
<tr>
<td>name</td>
<td>section</td>
<td>Class</td>
<td>Department</td>

</tr>
<%
try{
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegemanagemant?useSSL=false", "userid", "password");
statement=connection.createStatement();
String sql ="select * from collegemanagement.student";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("sname") %></td>
<td><%=resultSet.getString("ssec") %></td>
<td><%=resultSet.getString("sclass") %></td>
<td><%=resultSet.getString("sdept") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>
