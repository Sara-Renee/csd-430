<%-- Sara White - CSD-430 - Assignment 7.2 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="database.SaraMoviesBean" %>

<jsp:useBean id="movieDatabase" class="database.SaraMoviesBean" scope="page" />

<%
    request.setCharacterEncoding("UTF-8");

    String successMessage = null;
    String errorMessage = null;

    // process the user-submitted form and add the new movie record
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            String title = request.getParameter("title");
            String director = request.getParameter("director");
            String releaseYearText = request.getParameter("releaseYear");
            String genre = request.getParameter("genre");
            String runtimeText = request.getParameter("runtime");
            String studio = request.getParameter("studio");

            if (title == null || title.trim().isEmpty()
                    || director == null || director.trim().isEmpty()
                    || releaseYearText == null || releaseYearText.trim().isEmpty()
                    || genre == null || genre.trim().isEmpty()
                    || runtimeText == null || runtimeText.trim().isEmpty()
                    || studio == null || studio.trim().isEmpty()) {

                throw new IllegalArgumentException("Every field is required.");
            }

            int releaseYear = Integer.parseInt(releaseYearText);
            int runtime = Integer.parseInt(runtimeText);

            if (releaseYear < 1888 || releaseYear > 2100) {
                throw new IllegalArgumentException("Enter a valid release year.");
            }

            if (runtime <= 0) {
                throw new IllegalArgumentException("Runtime must be greater than zero.");
            }

            int newMovieID = movieDatabase.createRecord(
                title.trim(),
                director.trim(),
                releaseYear,
                genre.trim(),
                runtime,
                studio.trim()
            );

            successMessage = "Movie record " + newMovieID + " was added successfully!";

        } catch (NumberFormatException exception) {
            errorMessage = "Release year and runtime must contain whole numbers.";
        } catch (IllegalArgumentException exception) {
            errorMessage = exception.getMessage();
        } catch (Exception exception) {
            errorMessage = "The movie record could not be added: " + exception.getMessage();
        }
    }

    // Retrieve all records after processing the form so the new row is included
    List<SaraMoviesBean> movies = new ArrayList<SaraMoviesBean>();

    try {
        movies = movieDatabase.readAllRecords();
    } catch (Exception exception) {
        errorMessage = "The movie records could not be displayed: " + exception.getMessage();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CSD-430 Assignment 7.2 - Add A Movie</title>
    <link rel="stylesheet" href="stylesheet.css">
</head>
<body>
    <main>
        <nav class="page-nav">
            <a href="index.jsp">Update a Movie</a>
            <a href="add_movie.jsp" aria-current="page">Add a Movie</a>
            <a href="delete_movie.jsp">Delete a Movie</a>
        </nav>

        <header>
            <h1>Movies I Can't Live Without</h1>
            <p>
                Here you can add a new record to the movie database. The Movie ID will be generated automatically after you submit the form.
            </p>
        </header>

        <section class="form-section">
            <h2>Add a Movie</h2>
            <p>Please fill out each field for the new movie record.</p>

            <% if (successMessage != null) { %>
                <p class="message success"><%= successMessage %></p>
            <% } %>

            <% if (errorMessage != null) { %>
                <p class="message error"><%= errorMessage %></p>
            <% } %>

            <form method="post" action="add_movie.jsp">
                <div class="form-grid">
                    <label for="title">Movie Title</label>
                    <input type="text" id="title" name="title" maxlength="100" required>

                    <label for="director">Director</label>
                    <input type="text" id="director" name="director" maxlength="100" required>

                    <label for="releaseYear">Release Year</label>
                    <input type="number" id="releaseYear" name="releaseYear"
                        min="1888" max="2100" required>

                    <label for="genre">Genre</label>
                    <input type="text" id="genre" name="genre" maxlength="100"
                        placeholder="Example: Comedy, Fantasy" required>

                    <label for="runtime">Runtime in Minutes</label>
                    <input type="number" id="runtime" name="runtime" min="1" required>

                    <label for="studio">Studio</label>
                    <input type="text" id="studio" name="studio" maxlength="100" required>
                </div>

                <input type="submit" value="Add Movie">
            </form>
        </section>

        <section class="records-section">
            <h2>Complete Movie Collection</h2>
        

            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>Movie ID</th>
                            <th>Title</th>
                            <th>Director</th>
                            <th>Release Year</th>
                            <th>Genre</th>
                            <th>Runtime</th>
                            <th>Studio</th>
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

                        <% if (movies.isEmpty()) { %>
                            <tr>
                                <td colspan="7">No movie records are currently available.</td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </section>
        <div class="action-row">
            <a class="button-link secondary" href="index.jsp">
                Return Home
            </a>
        </div>
    </main>
</body>
</html>
