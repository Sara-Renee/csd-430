// Sara White - CSD-430 - Assignment 4.2 



package movies;


public class MovieBean implements java.io.Serializable {
    private String title;
    private String director;
    private int releaseYear;
    private String genre;
    private int runTime;


    // default constructor
    public MovieBean() {}


    // setters to set title, director, releaseYear, genre and runTime
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

    public void setRunTime(int runTime) {
        this.runTime = runTime;
    }


    // getters to return MovieBean properties
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

    public int getRunTime() {
        return runTime;
    }

}