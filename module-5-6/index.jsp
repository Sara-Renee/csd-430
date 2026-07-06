<%-- Sara White - CSD-430 - Assignment 5.3/6.3 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%-- create an instance of the javabean to communicate with the database --%>
<jsp:useBean id="movieMenu" class="database.SaraMoviesBean" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CSD-430 Assignment 5.3/6.3</title>
    <link rel="stylesheet" href="stylesheet.css">
</head>
<body>
<!--Page title/description-->

    <h2>Ten Movies I Can't Live Without</h2>

    <h3>
        This page displays movie records from the database titled 'CSD430'. These are some of my favorite movies.</h3>
       
    <p>
        Select a movie ID (1-10) from the dropdown menu to view information about the selected movie.
    </p>

    <%
        // display the movie ID dropdown menu

        out.print(movieMenu.formGetPK("index.jsp"));

        // retrieve selected move ID submitted from the form
        String selectedMovieID = request.getParameter("movieID");


        // if a movie is selected, display the movie record that corresponds 
        // with the selected movie ID
        if (selectedMovieID != null) {
            out.print("<h3>Movie Selected:</h3>");
            out.print(movieMenu.read(Integer.parseInt(selectedMovieID)));
        }
    %>

</body>
</html>