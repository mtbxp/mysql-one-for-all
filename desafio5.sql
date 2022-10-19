SELECT 
	Songs.song_name AS cancao,
    COUNT(Played.played_date)AS reproducoes
FROM SpotifyClone.Songs
INNER JOIN SpotifyClone.Played ON Played.song_id = Songs.song_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;