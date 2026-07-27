<%-- Sara White - CSD-430 - Assignment 9.2 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="database.SaraMoviesBean" %>

<%-- Create an instance of the JavaBean to communicate with the database --%>
<jsp:useBean id="movieDatabase" class="database.SaraMoviesBean" scope="page" />

<%
    request.setCharacterEncoding("UTF-8");

    String successMessage = null;
    String errorMessage = null;

    // Process the submitted form and delete the selected movie record
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            String movieIDText = request.getParameter("movieID");

            if (movieIDText == null || movieIDText.trim().isEmpty()) {
                throw new IllegalArgumentException(
                    "Please select a Movie ID."
                );
            }

            int movieID = Integer.parseInt(movieIDText);
            int rowsDeleted = movieDatabase.deleteRecord(movieID);

            if (rowsDeleted == 1) {
                successMessage =
                    "Movie record " + movieID + " was deleted successfully!";
            } else {
                errorMessage =
                    "The selected movie record could not be found.";
            }

        } catch (NumberFormatException exception) {
            errorMessage = "Movie ID must contain a whole number.";
        } catch (IllegalArgumentException exception) {
            errorMessage = exception.getMessage();
        } catch (Exception exception) {
            errorMessage =
                "The movie record could not be deleted: "
                + exception.getMessage();
        }
    }

    // Retrieve all remaining records after deletion has been processed
    List<SaraMoviesBean> movies = new ArrayList<SaraMoviesBean>();

    try {
        movies = movieDatabase.readAllRecords();
    } catch (Exception exception) {
        errorMessage =
            "The movie records could not be displayed: "
            + exception.getMessage();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CSD-430 Assignment 9.2 - Delete a Movie</title>
    <link rel="stylesheet" href="stylesheet.css">
</head>

<body>
    <main>
        <nav class="page-nav">
            <a href="index.jsp">Update a Movie</a>
            <a href="add_movie.jsp">Add a Movie</a>
            <a href="delete_movie.jsp" aria-current="page">Delete a Movie</a>
        </nav>

        <header>
            <h1>Movies I Can't Live Without</h1>
            <p>
                Here you can delete a record from the movie database by
                selecting its Movie ID from the dropdown menu.
            </p>
        </header>

        <section class="form-section">
            <h2>Delete a Movie</h2>
            <p>
                Select a Movie ID and click the "Delete Movie" button.
            </p>

            <% if (successMessage != null) { %>
                <p class="message success"><%= successMessage %></p>
            <% } %>

            <% if (errorMessage != null) { %>
                <p class="message error"><%= errorMessage %></p>
            <% } %>

            <% if (!movies.isEmpty()) { %>
                <form method="post" action="delete_movie.jsp">
                    <div class="form-grid">
                        <label for="movieID">Movie ID</label>

                        <select id="movieID" name="movieID" required>
                            <% for (SaraMoviesBean movie : movies) { %>
                                <option value="<%= movie.getMovieID() %>">
                                    <%= movie.getMovieID() %> -
                                    <%= movie.getTitle() %>
                                </option>
                            <% } %>
                        </select>
                    </div>

                    <input type="submit" value="Delete Movie">
                </form>
            <% } else { %>
                <p class="message">
                    There are no movie records left to delete.
                </p>
            <% } %>
        </section>

        <section class="records-section">
            <h2>Complete Movie Collection</h2>
            <p> The table below shows all movie records currently stored in the database. </p>

            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>
                                Movie ID<br>
                                <small>INT / Primary Key</small>
                            </th>
                            <th>
                                Title<br>
                                <small>VARCHAR(100)</small>
                            </th>
                            <th>
                                Director<br>
                                <small>VARCHAR(100)</small>
                            </th>
                            <th>
                                Release Year<br>
                                <small>INT</small>
                            </th>
                            <th>
                                Genre<br>
                                <small>VARCHAR(100)</small>
                            </th>
                            <th>
                                Runtime<br>
                                <small>INT / Minutes</small>
                            </th>
                            <th>
                                Studio<br>
                                <small>VARCHAR(100)</small>
                            </th>
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