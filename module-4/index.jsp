<%-- Sara White - CSD-430 - Assignment 4.2 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CSD-430 Assignment 4.2</title>
    <link rel="stylesheet" href="stylesheet.css">
</head>
<body>

    <h2>Five Movies I Love (Brought to You by JavaBeans)</h2>

    <!-- JSP useBean tags instantiate MovieBean objects for each movie -->
    <jsp:useBean id="movie1" class="movies.MovieBean" />
    <jsp:useBean id="movie2" class="movies.MovieBean" />
    <jsp:useBean id="movie3" class="movies.MovieBean" />
    <jsp:useBean id="movie4" class="movies.MovieBean" />
    <jsp:useBean id="movie5" class="movies.MovieBean" />

        <!-- JSP tags used to set the values of the MovieBean properties -->
        <jsp:setProperty name="movie1" property="title" value="Amadeus" />
        <jsp:setProperty name="movie1" property="director" value="Milos Forman" />
        <jsp:setProperty name="movie1" property="releaseYear" value="1984" />
        <jsp:setProperty name="movie1" property="genre" value="Drama" />
        <jsp:setProperty name="movie1" property="runTime" value="160" />

        <jsp:setProperty name="movie2" property="title" value="Death Becomes Her" />
        <jsp:setProperty name="movie2" property="director" value="Robert Zemeckis" />
        <jsp:setProperty name="movie2" property="releaseYear" value="1992" />
        <jsp:setProperty name="movie2" property="genre" value="Comedy/Fantasy" />
        <jsp:setProperty name="movie2" property="runTime" value="104" />

        <jsp:setProperty name="movie3" property="title" value="The Adventures of Baron Munchausen" />
        <jsp:setProperty name="movie3" property="director" value="Terry Gilliam" />
        <jsp:setProperty name="movie3" property="releaseYear" value="1988" />
        <jsp:setProperty name="movie3" property="genre" value="Adventure/Fantasy" />
        <jsp:setProperty name="movie3" property="runTime" value="126" />

        <jsp:setProperty name="movie4" property="title" value="Terminator 2: Judgment Day" />
        <jsp:setProperty name="movie4" property="director" value="James Cameron" />
        <jsp:setProperty name="movie4" property="releaseYear" value="1991" />
        <jsp:setProperty name="movie4" property="genre" value="Science Fiction/Drama" />
        <jsp:setProperty name="movie4" property="runTime" value="137" />

        <jsp:setProperty name="movie5" property="title" value="Raising Arizona" />
        <jsp:setProperty name="movie5" property="director" value="Joel Coen" />
        <jsp:setProperty name="movie5" property="releaseYear" value="1987" />
        <jsp:setProperty name="movie5" property="genre" value="Comedy/Surreal" />
        <jsp:setProperty name="movie5" property="runTime" value="94" />

    <table>
        <tr>
            <th>Title</th>
            <th>Director</th>
            <th>Release Year</th>
            <th>Genre</th>
            <th>Runtime</th>
        </tr>
        <tr>
            <!-- JSP tags used to retrieve and display MovieBean property values -->
            <td><jsp:getProperty name="movie1" property="title" /></td>
            <td><jsp:getProperty name="movie1" property="director" /></td>
            <td><jsp:getProperty name="movie1" property="releaseYear" /></td>
            <td><jsp:getProperty name="movie1" property="genre" /></td>
            <td><jsp:getProperty name="movie1" property="runTime" /> minutes</td>
        </tr>
          <tr>
            <td><jsp:getProperty name="movie2" property="title" /></td>
            <td><jsp:getProperty name="movie2" property="director" /></td>
            <td><jsp:getProperty name="movie2" property="releaseYear" /></td>
            <td><jsp:getProperty name="movie2" property="genre" /></td>
            <td><jsp:getProperty name="movie2" property="runTime" /> minutes</td>
        </tr>  <tr>
            <td><jsp:getProperty name="movie3" property="title" /></td>
            <td><jsp:getProperty name="movie3" property="director" /></td>
            <td><jsp:getProperty name="movie3" property="releaseYear" /></td>
            <td><jsp:getProperty name="movie3" property="genre" /></td>
            <td><jsp:getProperty name="movie3" property="runTime" /> minutes</td>
        </tr>  <tr>
            <td><jsp:getProperty name="movie4" property="title" /></td>
            <td><jsp:getProperty name="movie4" property="director" /></td>
            <td><jsp:getProperty name="movie4" property="releaseYear" /></td>
            <td><jsp:getProperty name="movie4" property="genre" /></td>
            <td><jsp:getProperty name="movie4" property="runTime" /> minutes</td>
        </tr>  <tr>
            <td><jsp:getProperty name="movie5" property="title" /></td>
            <td><jsp:getProperty name="movie5" property="director" /></td>
            <td><jsp:getProperty name="movie5" property="releaseYear" /></td>
            <td><jsp:getProperty name="movie5" property="genre" /></td>
            <td><jsp:getProperty name="movie5" property="runTime" /> minutes</td>
        </tr>
    </table>