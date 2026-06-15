<%-- Sara White - CSD-430 - Assignment 2.2 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CSD-430 Assignment 2.2</title>
    <link rel="stylesheet" href="site.css">
</head>
<body>

<h1>Movies I Love</h1>


<%--Array containing movie data: title, director, release year, genre--%>
<%
String[][] movies = {
    {"Amadeus", "Milos Forman", "1984", "Drama"},
    {"Death Becomes Her", "Robert Zemeckis", "1992", "Comedy/Fantasy"},
    {"The Adventures of Baron Munchausen", "Terry Gilliam", "1988", "Adventure/Fantasy"},
    {"Terminator 2: Judgment Day", "James Cameron", "1991", "Science Fiction/Drama"},
    {"Raising Arizona", "Joel Coen", "1987", "Comedy/Surreal"}
};
%>


<table>
<caption>Below is a table of some of my favorite movies. The table includes the title, director, release year and genre for each film.</caption>
<tr>
    <th>Title</th>
    <th>Director</th>
    <th>Release Year</th>
    <th>Genre</th>
</tr>

<%--Java scriptlet to iterate over table data--%>
<%
for(int i = 0; i < movies.length; i++) {
%>

<tr>
    <td><%= movies[i][0] %></td>
    <td><%= movies[i][1] %></td>
    <td><%= movies[i][2] %></td>
    <td><%= movies[i][3] %></td>
</tr>

<%
}
%>

</table>

</body>
</html>