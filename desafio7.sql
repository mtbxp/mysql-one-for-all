SELECT 
    Artist.artist_name AS artista,
    Album.album_name AS album,
    COUNT(following_table.user_id) AS seguidores
FROM SpotifyClone.Artist
INNER JOIN SpotifyClone.Album ON Album.artist_id = Artist.artist_id
INNER JOIN SpotifyClone.Following AS following_table ON following_table.artist_id = Artist.artist_id
GROUP BY artista , album
ORDER BY seguidores DESC, artista, album