-- ============================================
-- SPOTIFY DATABASE
-- ============================================

CREATE DATABASE spotify_database;

USE spotify_db;


-- ============================================
-- 1. GENRES TABLE
-- ============================================

CREATE TABLE genres (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL UNIQUE
);


-- ============================================
-- 2. ARTISTS TABLE
-- ============================================

CREATE TABLE artists (
    artist_id INT PRIMARY KEY,
    artist_name VARCHAR(150) NOT NULL,
    country VARCHAR(100),
    debut_year INT
);


-- ============================================
-- 3. ALBUMS TABLE
-- ============================================

CREATE TABLE albums (
    album_id INT PRIMARY KEY,
    album_name VARCHAR(200) NOT NULL,
    artist_id INT NOT NULL,
    genre_id INT NOT NULL,
    release_date DATE,

    FOREIGN KEY (artist_id)
        REFERENCES artists(artist_id),

    FOREIGN KEY (genre_id)
        REFERENCES genres(genre_id)
);


-- ============================================
-- 4. TRACKS TABLE
-- ============================================

CREATE TABLE tracks (
    track_id INT PRIMARY KEY,
    track_name VARCHAR(200) NOT NULL,
    album_id INT NOT NULL,
    artist_id INT NOT NULL,
    genre_id INT NOT NULL,
    duration_seconds INT,

    FOREIGN KEY (album_id)
        REFERENCES albums(album_id),

    FOREIGN KEY (artist_id)
        REFERENCES artists(artist_id),

    FOREIGN KEY (genre_id)
        REFERENCES genres(genre_id)
);


-- ============================================
-- 5. PLAYLISTS TABLE
-- ============================================

CREATE TABLE playlists (
    playlist_id INT PRIMARY KEY,
    playlist_name VARCHAR(200) NOT NULL,
    playlist_type VARCHAR(50),
    created_date DATE
);


-- ============================================
-- 6. PLAYLIST TRACKS TABLE
-- ============================================

CREATE TABLE playlist_tracks (
    playlist_track_id INT PRIMARY KEY,
    playlist_id INT NOT NULL,
    track_id INT NOT NULL,
    added_date DATE,

    FOREIGN KEY (playlist_id)
        REFERENCES playlists(playlist_id),

    FOREIGN KEY (track_id)
        REFERENCES tracks(track_id),

    UNIQUE (playlist_id, track_id)
);


-- ============================================
-- 7. LISTENING HISTORY TABLE
-- ============================================

CREATE TABLE listening_history (
    history_id INT PRIMARY KEY,
    track_id INT NOT NULL,
    listened_at DATETIME,
    device VARCHAR(50),
    ms_played INT,

    FOREIGN KEY (track_id)
        REFERENCES tracks(track_id)
);


-- ============================================
-- CHECK ALL TABLES
-- ============================================

SHOW TABLES;


-- How  to inser Values in table Flow .
-- 1 genres → 2. artists → 3. albums → 4. tracks → 5. playlists → 6. playlist_tracks → 7. listening_history

-- Check whether all values are inserted into the table
select * from albums;
select * from artists;
select* from playlist_tracks;
select * from playlists;
select * from tracks;
select * from genres;
select * from listening_history;


-- ============================================================
-- SPOTIFY DATA ANALYSIS - QUESTIONS
-- ============================================================


-- Q1. What are the Top 10 artists by number of tracks?
-- Solution: Top 10 Artists by Track Count
SELECT 
    a.artist_name,
    COUNT(t.track_id) AS number_of_tracks
FROM artists a
LEFT JOIN tracks t 
    ON a.artist_id = t.artist_id
GROUP BY a.artist_id, a.artist_name
ORDER BY number_of_tracks DESC
LIMIT 10;

-- Q2. What are the Top 10 most played tracks?
-- Solution: Top 10 Most Played Tracks
select * from playlist_tracks;
select * from tracks;
SELECT 
    t.track_name, COUNT(pt.track_id) AS Number_of_tracks
FROM
    tracks t
        LEFT JOIN
    playlist_tracks pt ON t.track_id = pt.track_id
GROUP BY t.track_name
ORDER BY Number_of_tracks DESC
LIMIT 10;

-- Q3. What are the Top 10 artists by number of albums?
-- Solution: Top 10 Artists by Album Count
SELECT 
    a.artist_name, COUNT(al.album_id) AS Number_of_albums
FROM
    artists a
        LEFT JOIN
    albums al ON a.artist_id = al.artist_id
GROUP BY a.artist_id
ORDER BY Number_of_albums DESC
LIMIT 10;


-- Q4. What are the Top 10 genres by number of tracks?
-- Solution: Top 10 Genres by Track Count


-- Q5. How many tracks are available for each genre?
-- Solution: Track Count by Genre


-- Q6. How many albums does each artist have?
-- Solution: Album Count by Artist


-- Q7. How many tracks does each album contain?
-- Solution: Track Count by Album


-- Q8. How many playlists are available for each playlist type?
-- Solution: Playlist Count by Playlist Type


-- Q9. How many tracks are in each playlist?
-- Solution: Track Count by Playlist


-- Q10. What is the average track duration?
-- Solution: Average Track Duration


-- Q11. What is the distribution of track duration?
-- Solution: Track Duration Distribution


-- Q12. What are the shortest 10 tracks?
-- Solution: Top 10 Shortest Tracks


-- Q13. What are the longest 10 tracks?
-- Solution: Top 10 Longest Tracks


-- Q14. What is the average track duration by genre?
-- Solution: Average Duration by Genre


-- Q15. What is the average track duration by artist?
-- Solution: Average Duration by Artist


-- Q16. What is the total duration of tracks for each artist?
-- Solution: Total Track Duration by Artist


-- Q17. What is the total duration of tracks for each genre?
-- Solution: Total Track Duration by Genre


-- Q18. Which albums have the highest total track duration?
-- Solution: Albums by Total Track Duration


-- Q19. Which artists have the highest total track duration?
-- Solution: Artists by Total Track Duration


-- Q20. Which genres have the highest total track duration?
-- Solution: Genres by Total Track Duration


-- Q21. Which artists have released albums most recently?
-- Solution: Recently Released Albums by Artist


-- Q22. Which artists have the oldest debut years?
-- Solution: Artists by Debut Year


-- Q23. How many artists belong to each country?
-- Solution: Artist Count by Country


-- Q24. Which countries have the most artists?
-- Solution: Top Countries by Artist Count


-- Q25. How many albums were released each year?
-- Solution: Albums Released by Year


-- Q26. How many tracks were released in each year?
-- Solution: Tracks Released by Year


-- Q27. Which genres have the most albums?
-- Solution: Album Count by Genre


-- Q28. Which artists have albums across multiple genres?
-- Solution: Artists Across Multiple Genres


-- Q29. Which artists have the largest number of unique albums?
-- Solution: Artists by Unique Album Count


-- Q30. Which albums contain the highest number of tracks?
-- Solution: Albums by Track Count


-- Q31. Which playlists contain the most tracks?
-- Solution: Top Playlists by Track Count


-- Q32. Which playlist types contain the most tracks?
-- Solution: Track Count by Playlist Type


-- Q33. Which tracks appear in the most playlists?
-- Solution: Tracks by Playlist Count


-- Q34. Which artists appear in the most playlists?
-- Solution: Artists by Playlist Count


-- Q35. Which genres appear most frequently in playlists?
-- Solution: Genres by Playlist Track Count


-- Q36. What is the average number of tracks per playlist?
-- Solution: Average Tracks per Playlist


-- Q37. Which playlists have been updated with tracks most recently?
-- Solution: Recently Updated Playlists


-- Q38. How many tracks were added to playlists each year?
-- Solution: Playlist Track Additions by Year


-- Q39. What are the Top 10 most played tracks?
-- Solution: Top 10 Most Played Tracks


-- Q40. What are the Top 10 most played artists?
-- Solution: Top 10 Most Played Artists


-- Q41. What are the Top 10 most played genres?
-- Solution: Top 10 Most Played Genres


-- Q42. Which tracks have the highest total listening time?
-- Solution: Tracks by Total Listening Time


-- Q43. Which artists have the highest total listening time?
-- Solution: Artists by Total Listening Time


-- Q44. Which genres have the highest total listening time?
-- Solution: Genres by Total Listening Time


-- Q45. What is the listening activity by device?
-- Solution: Listening Activity by Device


-- Q46. What is the listening activity by hour of day?
-- Solution: Listening Activity by Hour


-- Q47. What is the listening activity by day of week?
-- Solution: Listening Activity by Day of Week


-- Q48. What is the listening activity by month?
-- Solution: Listening Activity by Month


-- Q49. What is the total listening time by month?
-- Solution: Monthly Total Listening Time


-- Q50. Which artists dominate the overall listening history?
-- Solution: Top Artists by Listening Activity


-- ============================================================
-- ADVANCED ANALYSIS
-- ============================================================


-- Q51. Which tracks have been played the highest number of times?
-- Solution: Tracks by Play Count


-- Q52. Which artists have the highest average listening duration per play?
-- Solution: Artists by Average Listening Duration


-- Q53. Which genres have the highest average listening duration per play?
-- Solution: Genres by Average Listening Duration


-- Q54. Which devices are used most for listening?
-- Solution: Device Usage Analysis


-- Q55. Which device generates the highest total listening time?
-- Solution: Listening Time by Device


-- Q56. Which artists have the highest number of tracks but relatively low listening activity?
-- Solution: Artist Track Count vs Listening Activity


-- Q57. Which tracks are present in the most playlists and have the highest listening activity?
-- Solution: Playlist Presence vs Listening Activity


-- Q58. What percentage of total listening time comes from the Top 10 artists?
-- Solution: Top 10 Artists Listening Time Share


-- Q59. Which genre has the highest number of tracks and highest listening time?
-- Solution: Genre Track Count vs Listening Time


-- Q60. How does listening activity change over time?
-- Solution: Listening Activity Trend