<%-- Sara White - CSD-430 - Assignment 8.2 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="database.SaraMoviesBean" %>


<%-- create an instance of the javabean to communicate with the database --%>
<jsp:useBean id="movieDatabase" class="database.SaraMoviesBean" scope="page" />

<%
    request.setCharacterEncoding("UTF-8");

    List<SaraMoviesBean> movies = new ArrayList<SaraMoviesBean>();
    String errorMessage = null;

    // Load all current records so the dropdown will list each primary key/movieID
    try {
        movies = movieDatabase.readAllRecords();
    } catch (Exception exception) {
        errorMessage = "Movie IDs could not be loaded: " + exception.getMessage();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CSD-430 Assignment 8</title>
    <link rel="stylesheet" href="stylesheet.css">
</head>
<body>
    <main>
        <nav class="page-nav">
            <a href="index.jsp" aria-current="page">Update a Movie</a>
            <a href="add_movie.jsp">Add a Movie</a>
        </nav>

      
            <h1>Update the Movie Database</h1>
            <p>
                Select a movie ID below. The movie's information will be displayed in fields that you can edit.
            </p>
        </header>

        <section class="form-section compact-section">
            <h2>Select a Record</h2>
            <p>
                The dropdown menu lists every movie record currently stored in the database.
            </p>

            <% if (errorMessage != null) { %>
                <p class="message error"><%= errorMessage %></p>
            <% } %>

            <% if (errorMessage == null && movies.isEmpty()) { %>
                <p class="message error">
                    No movie records are available to update.
                </p>
            <% } %>

            <% if (!movies.isEmpty()) { %>
                <form method="post" action="update_movie.jsp">
                    <div class="form-grid">
                        <label for="movieID">Movie ID</label>
                        <select name="movieID" id="movieID" required>
                            <% for (SaraMoviesBean movie : movies) { %>
                                <option value="<%= movie.getMovieID() %>">
                                    <%= movie.getMovieID() %> — <%= movie.getTitle() %>
                                </option>
                            <% } %>
                        </select>
                    </div>

                    <input type="submit" value="Load Movie Record">
                </form>
            <% } %>
        </section>
    </main>
</body>
</html>
