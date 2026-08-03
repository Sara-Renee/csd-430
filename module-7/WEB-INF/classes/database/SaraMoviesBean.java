// Sara White - CSD-430 - Assignment 7.2

package database;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * JavaBean used to create and read movie records for the Module 7 project.
 */
public class SaraMoviesBean implements Serializable {

    private static final long serialVersionUID = 1L;

    private int movieID;
    private String title;
    private String director;
    private int releaseYear;
    private String genre;
    private int runtime;
    private String studio;

    public SaraMoviesBean() {
    }

    // Establish a connection to the CSD430 database.
    private Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");

        return DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/CSD430",
            "student1",
            "pass"
        );
    }

    // Add a movie record and return its automatically generated movieID.
    public int createRecord(String title, String director, int releaseYear,
                            String genre, int runtime, String studio)
                            throws ClassNotFoundException, SQLException {

        String sql =
            "INSERT INTO saramoviesdata " +
            "(title, director, releaseYear, genre, runtime, studio) " +
            "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(
                 sql, Statement.RETURN_GENERATED_KEYS)) {

            statement.setString(1, title);
            statement.setString(2, director);
            statement.setInt(3, releaseYear);
            statement.setString(4, genre);
            statement.setInt(5, runtime);
            statement.setString(6, studio);
            statement.executeUpdate();

            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                }
            }
        }

        throw new SQLException(
            "The movie was added, but its generated ID was unavailable."
        );
    }

    // Return all movie records in movieID order.
    public List<SaraMoviesBean> readAllRecords()
            throws ClassNotFoundException, SQLException {

        List<SaraMoviesBean> movies = new ArrayList<SaraMoviesBean>();
        String sql = "SELECT * FROM saramoviesdata ORDER BY movieID";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                movies.add(createMovieFromResultSet(resultSet));
            }
        }

        return movies;
    }

    // Build one JavaBean object from the current database row.
    private SaraMoviesBean createMovieFromResultSet(ResultSet resultSet)
            throws SQLException {

        SaraMoviesBean movie = new SaraMoviesBean();
        movie.setMovieID(resultSet.getInt("movieID"));
        movie.setTitle(resultSet.getString("title"));
        movie.setDirector(resultSet.getString("director"));
        movie.setReleaseYear(resultSet.getInt("releaseYear"));
        movie.setGenre(resultSet.getString("genre"));
        movie.setRuntime(resultSet.getInt("runtime"));
        movie.setStudio(resultSet.getString("studio"));
        return movie;
    }

    // Setter methods.
    public void setMovieID(int movieID) {
        this.movieID = movieID;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public void setReleaseYear(int releaseYear) {
        this.releaseYear = releaseYear;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public void setRuntime(int runtime) {
        this.runtime = runtime;
    }

    public void setStudio(String studio) {
        this.studio = studio;
    }

    // Getter methods.
    public int getMovieID() {
        return movieID;
    }

    public String getTitle() {
        return title;
    }

    public String getDirector() {
        return director;
    }

    public int getReleaseYear() {
        return releaseYear;
    }

    public String getGenre() {
        return genre;
    }

    public int getRuntime() {
        return runtime;
    }

    public String getStudio() {
        return studio;
    }
}
