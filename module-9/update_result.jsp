<%-- Sara White - CSD-430 - Assignment 8.2 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="database.SaraMoviesBean" %>

<jsp:useBean id="movieDatabase" class="database.SaraMoviesBean" scope="page" />

<%
    request.setCharacterEncoding("UTF-8");

    SaraMoviesBean updatedMovie = null;
    String successMessage = null;
    String errorMessage = null;

    // Validate the values submitted by the user and update the database record
    // then retrieve the saved/updated record for the results table
    if (!"POST".equalsIgnoreCase(request.getMethod())) {
        errorMessage = "No movie update was submitted.";
    } else {
        try {
            String movieIDText = request.getParameter("movieID");
            String title = request.getParameter("title");
            String director = request.getParameter("director");
            String releaseYearText = request.getParameter("releaseYear");
            String genre = request.getParameter("genre");
            String runtimeText = request.getParameter("runtime");
            String studio = request.getParameter("studio");

            if (movieIDText == null || movieIDText.trim().isEmpty()
                    || title == null || title.trim().isEmpty()
                    || director == null || director.trim().isEmpty()
                    || releaseYearText == null || releaseYearText.trim().isEmpty()
                    || genre == null || genre.trim().isEmpty()
                    || runtimeText == null || runtimeText.trim().isEmpty()
                    || studio == null || studio.trim().isEmpty()) {

                throw new IllegalArgumentException("Every field is required.");
            }

            int movieID = Integer.parseInt(movieIDText);
            int releaseYear = Integer.parseInt(releaseYearText);
            int runtime = Integer.parseInt(runtimeText);

            if (releaseYear < 1888 || releaseYear > 2100) {
                throw new IllegalArgumentException("Enter a valid release year.");
            }

            if (runtime <= 0) {
                throw new IllegalArgumentException(
                    "Runtime must be greater than zero."
                );
            }

            int rowsUpdated = movieDatabase.updateRecord(
                movieID,
                title.trim(),
                director.trim(),
                releaseYear,
                genre.trim(),
                runtime,
                studio.trim()
            );

            if (rowsUpdated != 1) {
                throw new IllegalArgumentException(
                    "The selected movie record was not found."
                );
            }

            updatedMovie = movieDatabase.readRecord(movieID);

            if (updatedMovie == null) {
                throw new IllegalArgumentException(
                    "The updated record could not be retrieved."
                );
            }

            successMessage = "Movie record " + movieID
                + " was updated successfully.";

        } catch (NumberFormatException exception) {
            errorMessage =
                "Movie ID, release year, and runtime must contain whole numbers.";
        } catch (IllegalArgumentException exception) {
            errorMessage = exception.getMessage();
        } catch (Exception exception) {
            errorMessage = "The movie record could not be updated: "
                + exception.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Updated Movie Record</title>
    <link rel="stylesheet" href="stylesheet.css">
</head>
<body>
    <main>
        <nav class="page-nav">
            <a href="index.jsp" aria-current="page">Update a Movie</a>
            <a href="add_movie.jsp">Add a Movie</a>
            <a href="delete_movie.jsp">Delete a Movie</a>
        </nav>

        <header>
            <h1>Updated Movie Record</h1>
            <p>
                The table below displays the updated movie information.
            </p>
        </header>

        <section class="records-section">
            <% if (successMessage != null) { %>
                <p class="message success"><%= successMessage %></p>
            <% } %>

            <% if (errorMessage != null) { %>
                <p class="message error"><%= errorMessage %></p>
                <a class="button-link" href="index.jsp">
                    Return to Movie Selection
                </a>
            <% } %>

            <% if (updatedMovie != null) { %>
                <div class="table-wrapper">
                    <table>
                        <thead>
                            <tr>
                                <th>Movie ID<br><small>INT / Primary Key</small></th>
                                <th>Title<br><small>VARCHAR(100)</small></th>
                                <th>Director<br><small>VARCHAR(100)</small></th>
                                <th>Release Year<br><small>INT</small></th>
                                <th>Genre<br><small>VARCHAR(100)</small></th>
                                <th>Runtime<br><small>INT</small></th>
                                <th>Studio<br><small>VARCHAR(100)</small></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><%= updatedMovie.getMovieID() %></td>
                                <td><%= updatedMovie.getTitle() %></td>
                                <td><%= updatedMovie.getDirector() %></td>
                                <td><%= updatedMovie.getReleaseYear() %></td>
                                <td><%= updatedMovie.getGenre() %></td>
                                <td><%= updatedMovie.getRuntime() %> minutes</td>
                                <td><%= updatedMovie.getStudio() %></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="action-row">
                    <a class="button-link" href="index.jsp">
                        Update Another Movie
                    </a>
                    <a class="button-link secondary" href="add_movie.jsp">
                        Add a New Movie
                    </a>
                </div>
            <% } %>
        </section>
        <div class="action-row">
            <a class="button-link secondary" href="index.jsp">
                Return Home
            </a>
        </div>
    </main>
</body>
</html>
