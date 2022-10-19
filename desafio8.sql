SELECT 
    Artist.artist_name AS artista,
    Album.album_name AS album
FROM
    SpotifyClone.Album
    INNER JOIN
    SpotifyClone.Artist ON Album.artist_id = Artist.artist_id
WHERE
    artist_name = 'Elis Regina';