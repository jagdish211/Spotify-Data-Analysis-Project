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