SELECT Songs.song_name AS nome,
COUNT(Played.song_id) AS reproducoes
FROM SpotifyClone.Songs
INNER JOIN SpotifyClone.Played
ON Played.song_id = Songs.song_id
INNER JOIN SpotifyClone.Users
ON Users.user_id = Played.user_id
WHERE Users.subscription_id IN (1, 4)
GROUP BY nome
ORDER BY nome;