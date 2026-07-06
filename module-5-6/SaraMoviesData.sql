CREATE DATABASE CSD430;
USE CSD430;
CREATE TABLE saramoviesdata (
    movieID INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    director VARCHAR(100) NOT NULL,
    releaseYear INT NOT NULL,
    genre VARCHAR(100) NOT NULL,
    runtime INT NOT NULL,
    studio VARCHAR(100) NOT NULL
);

INSERT INTO saramoviesdata
(movieID, title, director, releaseYear, genre, runtime, studio)
VALUES
(1, 'Amadeus',
'Milos Forman',
1984,
'Drama',
160,
'Orion Pictures'),

(2, 'Death Becomes Her',
'Robert Zemeckis',
1992,
'Comedy, Fantasy',
104,
'Universal Pictures'),

(3, 'The Adventures of Baron Munchausen',
'Terry Gilliam',
1988,
'Adventure, Fantasy',
126,
'Columbia Pictures'),

(4, 'Terminator 2: Judgment Day',
'James Cameron',
1991,
'Science Fiction',
137,
'TriStar Pictures'),

(5, 'Raising Arizona',
'Joel Coen',
1987,
'Dark Comedy, Surreal',
94,
'20th Century Fox'),

(6, 'The Witches of Eastwick',
'George Miller',
1987,
'Dark Comedy, Fantasy',
118,
'Warner Bros. Pictures'),

(7, 'The Lost Boys',
'Joel Schumacher',
1987,
'Horror, Dark Comedy',
97,
'Warner Bros. Pictures'),

(8, 'The Prophecy',
'Gregory Widen',
1995,
'Thriller, Supernatural',
98,
'Miramax Films'),

(9, 'The Craft',
'Andrew Fleming',
1996,
'Thriller, Supernatural, Horror',
101,
'Columbia Pictures'),

(10, 'Tank Girl',
'Rachel Talalay',
1995,
'Dark Comedy, Adventure, Fantasy',
104,
'MGM Studios Inc.');

SELECT * FROM saramoviesdata;

