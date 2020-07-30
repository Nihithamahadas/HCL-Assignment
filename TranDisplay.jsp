<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("tid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dataBase="nihitha";
String userid = "root";
String password = "nihitha";
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction History</title>
</head>
<body bgcolor="aqua">
    <table border="1" width=400px height=250px align="center" style="margin-top: 90px;">
        <tr style="text-align: center;">
            <td>transactionid</td>
            <td>accountnumber</td>
            <td>debitamount</td>
        </tr>

<%
try{
connection = DriverManager.getConnection(connectionUrl+dataBase,userid,password);
statement=connection.createStatement();
String sql ="select * from nihitha.transactions ORDER BY transactionid DESC LIMIT 5";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr style="text-align: center;">
    <td><%=resultSet.getInt("transactionid") %></td>
    <td><%=resultSet.getInt("accountnumber") %></td>
    <td><%=resultSet.getDouble("debitamount") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>