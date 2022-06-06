SELECT 
    c.nome_cancao AS cancao, COUNT(uc.cancao_id) AS reproducoes
FROM
    SpotifyClone.cancoes AS c
        INNER JOIN
    SpotifyClone.usuarios_cancoes AS uc ON c.cancao_id = uc.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC , cancao ASC
LIMIT 2;