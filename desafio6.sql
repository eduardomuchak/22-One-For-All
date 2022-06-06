SELECT 
    MIN(p.valor) AS faturamento_minimo,
    MAX(p.valor) AS faturamento_maximo,
    ROUND(AVG(p.valor), 2) AS faturamento_medio,
    ROUND(COUNT(u.plano_id) * AVG(p.valor), 2) AS faturamento_total
FROM
    SpotifyClone.planos AS p
        INNER JOIN
    SpotifyClone.usuarios AS u ON u.plano_id = p.plano_id;