SELECT 
  (SELECT COUNT(song_name) FROM SpotifyClone.Songs) AS cancoes,
  (SELECT  COUNT(artist_name) FROM SpotifyClone.Artist) AS artistas,
  (SELECT  COUNT(album_name) FROM SpotifyClone.Album) AS albuns;