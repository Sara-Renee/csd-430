<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP Test</title>
</head>
<body>
    <h1>Hello world!</h1>

    <p>This page is my first attempt at JSP.</p>

    <%
        String visitor = request.getParameter("visitor");
    %>

    <p><strong>What's your name?</strong></p>

    <form method="get">
        <input type="text" name="visitor" size="30">
        <input type="submit" value="Submit name">
    </form>

    <h3>Thanks for stopping by, <%= (visitor == null) ? "" : visitor %>!</h3>

</body>
</html>


<%--  References
Coding Sprint. (2024, May 8). How to use JSP instead of HTML in java?. Medium. https://medium.com/@codingsprint/how-to-use-jsp-instead-of-html-in-java-1fc2c2c418ab

Oracle. (n.d.). Introduction to JavaServer Pages. https://docs.oracle.com/cd/A97336_01/buslog.102/a83726/genlovw1.htm#1006773

--%>