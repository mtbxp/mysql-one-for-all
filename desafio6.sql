SELECT 
    MIN(Subscription.subscription_price) AS faturamento_minimo,
    MAX(Subscription.subscription_price) AS faturamento_maximo,
    ROUND(AVG(Subscription.subscription_price), 2) AS faturamento_medio,
    SUM(Subscription.subscription_price) AS faturamento_total
FROM
    SpotifyClone.Subscription 
    INNER JOIN SpotifyClone.Users ON Users.subscription_id = Subscription.subscription_id;