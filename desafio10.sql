SELECT 
    c.nome_cancao AS nome, COUNT(uc.usuario_id) AS reproducoes
FROM
    SpotifyClone.cancoes AS c
        INNER JOIN
    SpotifyClone.usuarios_cancoes AS uc ON uc.cancao_id = c.cancao_id
        INNER JOIN
    SpotifyClone.usuarios AS u ON u.usuario_id = uc.usuario_id
        INNER JOIN
    SpotifyClone.planos AS p ON p.plano_id = u.plano_id
WHERE
    p.nome_plano = 'gratuito'
        OR p.nome_plano = 'pessoal'
GROUP BY nome
ORDER BY nome ASC;