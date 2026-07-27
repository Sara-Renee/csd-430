DROP DATABASE IF EXISTS CSD430;
CREATE DATABASE CSD430;
USE CSD430;

CREATE TABLE saramoviesdata (
    movieID INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    director VARCHAR(100) NOT NULL,
    releaseYear INT NOT NULL,
    genre VARCHAR(100) NOT NULL,
    runtime INT NOT NULL,
    studio VARCHAR(100) NOT NULL
);

INSERT INTO saramoviesdata (title, director, releaseYear, genre, runtime, studio)
VALUES
('Amadeus', 'Milos Forman', 1984, 'Drama', 160, 'Orion Pictures'),

('Death Becomes Her', 'Robert Zemeckis', 1992, 'Comedy, Fantasy', 104, 'Universal Pictures'),

('The Adventures of Baron Munchausen', 'Terry Gilliam', 1988, 'Adventure, Fantasy', 126, 'Columbia Pictures'),

('Terminator 2: Judgment Day', 'James Cameron', 1991, 'Science Fiction', 137, 'TriStar Pictures'),

('Raising Arizona', 'Joel Coen', 1987, 'Dark Comedy, Surreal', 94, '20th Century Fox'),

('The Witches of Eastwick', 'George Miller', 1987, 'Dark Comedy, Fantasy', 118, 'Warner Bros. Pictures'),

('The Lost Boys', 'Joel Schumacher', 1987, 'Horror, Dark Comedy', 97, 'Warner Bros. Pictures'),

('The Prophecy', 'Gregory Widen', 1995, 'Thriller, Supernatural', 98, 'Miramax Films'),

('The Craft', 'Andrew Fleming', 1996, 'Thriller, Supernatural, Horror', 101, 'Columbia Pictures'),

('Tank Girl', 'Rachel Talalay', 1995, 'Dark Comedy, Adventure, Fantasy', 104, 'MGM Studios Inc.');

SELECT * FROM saramoviesdata;