<%-- 
    Document   : slogin
    Created on : Nov 25, 2018, 9:44:52 PM
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
    <style>
        body{
 margin: 0;
 padding: 0;
 background: url(1037992.jpeg);
background-attachment:fixed;
background-position:center;
 background-family: sans-serif;

}




li a {
   
        display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover {
    background-color: #111;
}
.asdf{
     width: 320px;
height: 480px;
color:#fff;
top:50%;
left:10%;
position:absolute;
transform:translate(-50%,-50%);
box-sizing:border-box;
padding:60px ;
}
.asdf a{
font-weight: bold;
font-size:60px;
color:#778899;
    margin:8px;
}
    </style>
</head>
<body>
    <%@ page import="java.sql.*"%>
        <%@ page import="javax.sql.*"%>
        <%
            String uid = request.getParameter("uname");
            String pwd = request.getParameter("pwd");
            try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegemanagement?allowPublicKeyRetrieval=true&useSSL=false", "root", "root");
            Statement st=conn.createStatement();
            ResultSet rs=st.executeQuery("select * from student where username='"+uid+"'");
            
            if(rs.next())
            {
                
                if(rs.getString(6).equals(pwd))
                {
                    String uname=rs.getString(1);
                    
                    
                     String MyCookieName =rs.getString(1);
                     String MyCookieValue=rs.getString(6);
                     Cookie cookie = new Cookie(MyCookieName, MyCookieValue);
                     response.addCookie(cookie);
                     cookie.setMaxAge(60);
                     response.sendRedirect("home.html");
            }
                else{
                    %>
                   
                    <h1>Incorrect password.</h1>
                  
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
</body>
        </html>
  
