<%-- Sara White - CSD-430 - Assignment 7.2 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="database.SaraMoviesBean" %>

<%-- Create an instance of the JavaBean to communicate with the database. --%>
<jsp:useBean id="movieDatabase" class="database.SaraMoviesBean" scope="page" />

<%
    List<SaraMoviesBean> movies = new ArrayList<SaraMoviesBean>();
    String errorMessage = null;

    // load the existing records from the Module 5 and 6 database project.
    try {
        movies = movieDatabase.readAllRecords();
    } catch (Exception exception) {
        errorMessage = "The movie records could not be displayed: "
            + exception.getMessage();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CSD-430 Assignment 7.2</title>
    <link rel="stylesheet" href="stylesheet.css">
</head>
<body>
    <main>
        <nav class="page-nav">
            <a href="index.jsp" aria-current="page">Movie Records</a>
            <a href="add_movie.jsp">Add a Movie</a>
        </nav>

        <header>
            <h1>Movies I Can't Live Without</h1>
         
        </header>

        <section class="records-section">
            <h2>Current Movie Records</h2>
            <p>
                Each row represents one movie record. The table displays the
                primary key and the six descriptive fields stored for each movie.
            </p>

            <% if (errorMessage != null) { %>
                <p class="message error"><%= errorMessage %></p>
            <% } %>

            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>Movie ID<br><small>INT / Primary Key</small></th>
                            <th>Title<br><small>VARCHAR(100)</small></th>
                            <th>Director<br><small>VARCHAR(100)</small></th>
                            <th>Release Year<br><small>INT</small></th>
                            <th>Genre<br><small>VARCHAR(100)</small></th>
                            <th>Runtime<br><small>INT / Minutes</small></th>
                            <th>Studio<br><small>VARCHAR(100)</small></th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (SaraMoviesBean movie : movies) { %>
                            <tr>
                                <td><%= movie.getMovieID() %></td>
                                <td><%= movie.getTitle() %></td>
                                <td><%= movie.getDirector() %></td>
                                <td><%= movie.getReleaseYear() %></td>
                                <td><%= movie.getGenre() %></td>
                                <td><%= movie.getRuntime() %> minutes</td>
                                <td><%= movie.getStudio() %></td>
                            </tr>
                        <% } %>

                        <% if (movies.isEmpty() && errorMessage == null) { %>
                            <tr>
                                <td colspan="7">No movie records are currently available.</td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>

            <div class="action-row">
                <a class="button-link" href="add_movie.jsp">Add a Movie</a>
            </div>
        </section>
    </main>
</body>
</html>
