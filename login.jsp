<%-- 
    Document   : login
    Created on : Nov 25, 2018, 6:32:42 AM
    Author     : rohith
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>home</title>
    
    <link rel="Stylesheet" type="text/css" href="home.css">
    <script>
        function myfun() {
            alert("Logout sucessfull");
        }
        function string(){
            String uid = response.getParameter("uname");
        }
    </script>
</head>
<body>
    <%@ page import="java.sql.*"%>
        <%@ page import="javax.sql.*"%>
        <%
            String uid = request.getParameter("uname");
            String pwd = request.getParameter("pwd");
            try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegemanagemant?allowPublicKeyRetrieval=true&useSSL=false", "root", "root");
            Statement st=conn.createStatement();
            ResultSet rs=st.executeQuery("select * from student where username="+uid+"");
            if(rs.next())
            {
                if(rs.getString(6).equals(pwd))
                {
                   response.sendRedirect("home.html");
                    
                    %>
                     <header>
 <h1>TIME TABLE MANAGEMENT</h1>
 </header>
    <div class="img1">
    </div>
    <form>
     <ul>
            <li><a class="btnacc" href="#">Home</a></li>
            <li><a class="btnacc" href="#">Teachers</a></li>
            <li><a class="btnacc" href="timetable.html">Time Table</a></li>
            <li><a class="btnacc" href="#">Special Classes</a></li>

            <li><a class="btnacc" href="myaccount.jsp" onclick="string()">My Account</a></li>
            <li><a class="btnacc" href="login.html" onclick="myfun()"><b>Logout</b></a></li>
        </ul>
    </form>

</body>
<%
            }
}
}
catch(Exception e)
{
%>
<h1>
<%out.println(e);%>
</h1>
<%
}
%>
        </html>

