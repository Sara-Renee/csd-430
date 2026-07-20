<%-- Sara White - CSD-430 - Assignment 8.2 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="database.SaraMoviesBean" %>

<jsp:useBean id="movieDatabase" class="database.SaraMoviesBean" scope="page" />

<%!
    // Encode special characters so they are treated as ordinary text (instead of HTML instructions)
    private String escapeHtml(String value) {
        if (value == null) {
            return "";
        }

        return value
            .replace("&", "&amp;")
            .replace("<", "&lt;")
            .replace(">", "&gt;")
            .replace("\"", "&quot;")
            .replace("'", "&#39;");
    }
%>

<%
    request.setCharacterEncoding("UTF-8");

    SaraMoviesBean selectedMovie = null;
    String errorMessage = null;

    // Read the primary key the user selects and retrieve its current values
    try {
        String movieIDText = request.getParameter("movieID");

        if (movieIDText == null || movieIDText.trim().isEmpty()) {
            throw new IllegalArgumentException("A Movie ID must be selected.");
        }

        int movieID = Integer.parseInt(movieIDText);
        selectedMovie = movieDatabase.readRecord(movieID);

        if (selectedMovie == null) {
            throw new IllegalArgumentException(
                "No movie record exists for Movie ID " + movieID + "."
            );
        }

    } catch (NumberFormatException exception) {
        errorMessage = "The selected Movie ID was not a valid whole number.";
    } catch (IllegalArgumentException exception) {
        errorMessage = exception.getMessage();
    } catch (Exception exception) {
        errorMessage = "The movie record could not be loaded: "
            + exception.getMessage();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Movie Record</title>
    <link rel="stylesheet" href="stylesheet.css">
</head>
<body>
    <main>
        <nav class="page-nav">
            <a href="index.jsp">Update a Movie</a>
            <a href="add_movie.jsp">Add a Movie</a>
        </nav>

        <header>
            <h1>Edit Movie Record</h1>
            <p>
                The Movie ID is the primary key and cannot be changed. All other fields may be edited. Once you have updated the movie information, submit your changes by clicking "Update Movie".
            </p>
        </header>

        <% if (errorMessage != null) { %>
            <section class="form-section compact-section">
                <h2>Record Unavailable</h2>
                <p class="message error"><%= errorMessage %></p>
                <a class="button-link" href="index.jsp">Return to Movie Selection</a>
            </section>
        <% } %>

        <% if (selectedMovie != null) { %>
            <section class="form-section">
                <h2>Movie ID <%= selectedMovie.getMovieID() %></h2>

                <form method="post" action="update_result.jsp">
                    <input type="hidden" name="movieID"
                        value="<%= selectedMovie.getMovieID() %>">

                    <div class="form-grid">
                        <span class="field-label">Movie ID</span>
                        <span class="readonly-value">
                            <%= selectedMovie.getMovieID() %>
                            <small>Primary key — not editable</small>
                        </span>

                        <label for="title">Movie Title</label>
                        <input type="text" id="title" name="title" maxlength="100"
                            value="<%= escapeHtml(selectedMovie.getTitle()) %>" required>

                        <label for="director">Director</label>
                        <input type="text" id="director" name="director" maxlength="100"
                            value="<%= escapeHtml(selectedMovie.getDirector()) %>" required>

                        <label for="releaseYear">Release Year</label>
                        <input type="number" id="releaseYear" name="releaseYear"
                            min="1888" max="2100"
                            value="<%= selectedMovie.getReleaseYear() %>" required>

                        <label for="genre">Genre</label>
                        <input type="text" id="genre" name="genre" maxlength="100"
                            value="<%= escapeHtml(selectedMovie.getGenre()) %>" required>

                        <label for="runtime">Runtime in Minutes</label>
                        <input type="number" id="runtime" name="runtime" min="1"
                            value="<%= selectedMovie.getRuntime() %>" required>

                        <label for="studio">Studio</label>
                        <input type="text" id="studio" name="studio" maxlength="100"
                            value="<%= escapeHtml(selectedMovie.getStudio()) %>" required>
                    </div>

                    <input type="submit" value="Update Movie">
                </form>
            </section>
        <% } %>
    </main>
</body>
</html>
