SELECT 
    COUNT(Played.user_id) AS quantidade_musicas_no_historico
FROM
    SpotifyClone.Played
        INNER JOIN
    SpotifyClone.Users ON Users.user_id = Played.user_id
WHERE
    Users.user_name = 'Barbara Liskov';