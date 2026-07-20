// Sara White - CSD-430 - Assignment 5.3/6.3

package database;

import java.sql.*;

public class SaraMoviesBean implements java.io.Serializable {

    private int movieID;
    private String title;
    private String director;
    private int releaseYear;
    private String genre;
    private int runtime;
    private String studio;

    public SaraMoviesBean() {}

    // establish a connection to the CSD430 database

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");

        return DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/CSD430",
            "student1",
            "pass"
        );
    }

    // create html form containing a dropdown menu
    // populated with all movie IDs from database
    public String formGetPK(String actionPage) {
        StringBuilder html = new StringBuilder();

        html.append("<form method='post' action='").append(actionPage).append("'>");
        html.append("<label for='movieID'>Select a Movie ID:</label>");
        html.append("<select name='movieID' id='movieID'>");

        try {
            Connection conn = getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT movieID FROM saramoviesdata ORDER BY movieID");

            while (rs.next()) {
                int id = rs.getInt("movieID");
                html.append("<option value='").append(id).append("'>").append(id).append("</option>");
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            html.append("<option>Error loading movie IDs</option>");
        }


        html.append("</select>");
        html.append("<input type='submit' value='Display Movie'>");
        html.append("</form>");

        return html.toString();
    }

    // retrieve the selection from the database
    // return it as an html table
    public String read(int selectedMovieID) {
        StringBuilder html = new StringBuilder();

        try {
            Connection conn = getConnection();

            PreparedStatement stmt = conn.prepareStatement(
                "SELECT * FROM saramoviesdata WHERE movieID = ?"
            );

            stmt.setInt(1, selectedMovieID);

            ResultSet rs = stmt.executeQuery();

            // build html table to display the selected movie data

            if (rs.next()) {
                html.append("<table>");
                html.append("<thead>");
                html.append("<tr>");
                html.append("<th>Movie ID</th>");
                html.append("<th>Title</th>");
                html.append("<th>Director</th>");
                html.append("<th>Release Year</th>");
                html.append("<th>Genre</th>");
                html.append("<th>Runtime</th>");
                html.append("<th>Studio</th>");
                html.append("</tr>");
                html.append("</thead>");

                html.append("<tbody>");
                html.append("<tr>");
                html.append("<td>").append(rs.getInt("movieID")).append("</td>");
                html.append("<td>").append(rs.getString("title")).append("</td>");
                html.append("<td>").append(rs.getString("director")).append("</td>");
                html.append("<td>").append(rs.getInt("releaseYear")).append("</td>");
                html.append("<td>").append(rs.getString("genre")).append("</td>");
                html.append("<td>").append(rs.getInt("runtime")).append(" minutes</td>");
                html.append("<td>").append(rs.getString("studio")).append("</td>");
                html.append("</tr>");
                html.append("</tbody>");
                html.append("</table>");
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            html.append("<p>Error retrieving movie record: ")
                .append(e.getMessage())
                .append("</p>");
        }

        return html.toString();
    }

    // setter methods for SaraMoviesBean properties

    public void setMovieID(int movieID) { this.movieID = movieID; }
    public void setTitle(String title) { this.title = title; }
    public void setDirector(String director) { this.director = director; }
    public void setReleaseYear(int releaseYear) { this.releaseYear = releaseYear; }
    public void setGenre(String genre) { this.genre = genre; }
    public void setRuntime(int runtime) { this.runtime = runtime; }
    public void setStudio(String studio) { this.studio = studio; }

    // getter methods for SaraMovieBeans properties
    public int getMovieID() { return movieID; }
    public String getTitle() { return title; }
    public String getDirector() { return director; }
    public int getReleaseYear() { return releaseYear; }
    public String getGenre() { return genre; }
    public int getRuntime() { return runtime; }
    public String getStudio() { return studio; }
}


// References

// Oracle. (n.d.). JDBC Basics. https://docs.oracle.com/javase/tutorial/jdbc/basics/index.html?utm_source=chatgpt.com
// Oracle. (n.d.). StringBuilder (Java Platform SE 17). https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/lang/StringBuilder.html