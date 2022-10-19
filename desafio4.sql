SELECT 
    Users.user_name AS usuario,
    IF(MAX(YEAR(Played.played_date)) >= 2021, 'Usuário ativo', 'Usuário inativo')  AS status_usuario
FROM SpotifyClone.Users
INNER JOIN SpotifyClone.Played ON Users.user_id = Played.user_id
GROUP BY usuario
ORDER BY usuario; 