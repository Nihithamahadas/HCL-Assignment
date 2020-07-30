<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
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
Statement statement1 = null;
Statement statement2 = null;
Statement statement3 = null;
Statement statement4 = null;
ResultSet resultSet = null;
ResultSet resultSet2 = null;
ResultSet resultSet3 = null;
ResultSet resultSet4 = null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction Debit History</title>
</head>
<body bgcolor="aqua">
<table border="3" width=500 height=250px align="center" style="margin-top: 90px;">
<tr style="text-align: center;">
<td>transactionid</td>
<td>accountnumber</td>
<td>debitamount</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+dataBase,userid,password);
statement4=connection.createStatement();
String sql3 ="select totalamount from nihitha.userac";
resultSet4 = statement4.executeQuery(sql3);
resultSet4.next();
double datat=resultSet4.getDouble(1);
if(datat > 1000)
{
statement1=connection.createStatement();
String sql ="insert into nihitha.transactions(accountnumber,debitamount) values(999999,1000)";
statement1.executeUpdate(sql);
statement3=connection.createStatement();
String sql2 ="update nihitha.userac set totalamount=(totalamount-1000)";
statement3.executeUpdate(sql2);
out.println("Money debited 1000 rs/-");
}
statement2=connection.createStatement();
String sql1 ="select * from nihitha.transactions ORDER BY transactionid DESC LIMIT 5";
resultSet2= statement2.executeQuery(sql1);
while(resultSet2.next()){
%>
<tr style="text-align: center;">
<td><%=resultSet2.getInt("transactionid") %></td>
<td><%=resultSet2.getInt("accountnumber") %></td>
<td><%=resultSet2.getDouble("debitamount") %></td>
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