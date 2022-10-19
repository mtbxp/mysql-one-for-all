SELECT 
    Users.user_name AS usuario,
    COUNT(DISTINCT Played.played_date) AS qt_de_musicas_ouvidas,
	ROUND(SUM(Songs.duration_song)/60,2) AS total_minutos
FROM SpotifyClone.Users 
INNER JOIN SpotifyClone.Played ON Users.user_id = Played.user_id
INNER JOIN SpotifyClone.Songs ON Songs.song_id = Played.song_id
GROUP BY usuario
ORDER BY usuario ASC;