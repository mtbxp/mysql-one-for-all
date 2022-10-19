DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;


CREATE TABLE SpotifyClone.Subscription (
    subscription_id INT PRIMARY KEY AUTO_INCREMENT,
    subscription_name VARCHAR(45) NOT NULL,
    subscription_price DECIMAL(15,2) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE SpotifyClone.Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(45) NOT NULL,
    user_age INT NOT NULL,
    user_subscription_date DATE NOT NULL,
    subscription_id INT NOT NULL,
    FOREIGN KEY (subscription_id) REFERENCES Subscription (subscription_id)
)  engine = InnoDB;

CREATE TABLE SpotifyClone.Artist (
    artist_id INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(45) NOT NULL
)  engine = InnoDB;

CREATE TABLE SpotifyClone.Album (
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_name VARCHAR(45) NOT NULL,
    release_year INT NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES Artist (artist_id)
)  engine = InnoDB;

CREATE TABLE SpotifyClone.Songs (
    song_id INT PRIMARY KEY AUTO_INCREMENT,
    song_name VARCHAR(45) NOT NULL,
    duration_song INT NOT NULL,
    artist_id INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES Artist (artist_id),
    FOREIGN KEY (album_id) REFERENCES Album (album_id)
)  engine = InnoDB;

CREATE TABLE SpotifyClone.Following (
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    PRIMARY KEY  (user_id, artist_id),
    FOREIGN KEY (user_id) REFERENCES Users (user_id),
    FOREIGN KEY (artist_id) REFERENCES Artist (artist_id)
)  engine = InnoDB;

CREATE TABLE SpotifyClone.Played (
    user_id INT NOT NULL,
    played_date DATETIME NOT NULL,
    song_id INT NOT NULL,
    PRIMARY KEY (user_id , song_id),
    FOREIGN KEY (user_id) REFERENCES Users (user_id),
    FOREIGN KEY (song_id) REFERENCES Songs (song_id)
)  engine = InnoDB;

  INSERT INTO SpotifyClone.Subscription (subscription_id, subscription_name, subscription_price)
  VALUES
    (1, 'gratuito', 0),
    (2, 'familiar', 7.99),
    (3, 'universitário', 5.99),
    (4, 'pessoal', 6.99);

  INSERT INTO SpotifyClone.Users (user_id, user_name, user_age, user_subscription_date, subscription_id)
  VALUES
    (1, 'Barbara Liskov', 82, '2019-10-20', 1),
    (2, 'Robert Cecil Martin', 58, '2017-01-06', 1),
    (3, 'Ada Lovelace', 37,'2017-12-30', 2),
    (4, 'Martin Fowler', 46, '2017-01-17', 2),
    (5, 'Sandi Metz', 58, '2018-04-29', 2),
    (6, 'Paulo Freire', 19, '2018-02-14', 3),
    (7, 'Bell Hooks', 26, '2018-01-05', 3),
    (8, 'Christopher Alexander', 85, '2019-06-05', 4),
    (9, 'Judith Butler', 45, '2020-05-13', 4),
    (10, 'Jorge Amado', 58, '2017-02-17', 4);

      INSERT INTO SpotifyClone.Artist (artist_name)
VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

    INSERT INTO SpotifyClone.Following (user_id, artist_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);


INSERT INTO SpotifyClone.Album (album_name, release_year, artist_id)
VALUES
    ('Renaissance', 2022, 1),
    ('Jazz', 1978, 2),
    ('Hot Space', 1982, 2),
    ('Falso Brilhante', 1998, 3),
    ('Vento de Maio', 2001, 3),
    ('QVVJFA?', 2003, 4),
    ('Somewhere Far Beyond', 2007, 5),
    ('I Put A Spell On You', 2012, 6);

INSERT INTO SpotifyClone.Songs (song_name, duration_song, artist_id, album_id)
VALUES
    ('BREAK MY SOUL', 279, 1, 1),
    ('VIRGO’S GROOVE', 369, 1, 1),
    ('ALIEN SUPERSTAR', 116, 1, 1),
    ('Don’t Stop Me Now', 203, 2, 2),
    ('Under Pressure', 152, 2, 3),
    ('Como Nossos Pais', 105, 3, 4),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 3, 5),
    ('Samba em Paris', 267, 4, 6),
    ('The Bard’s Song', 244, 5, 7),
    ('Feeling Good', 100, 6, 8);


INSERT INTO SpotifyClone.Played (user_id, song_id, played_date)
VALUES
    (1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');