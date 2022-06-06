SELECT 
    COUNT(uc.usuario_id) AS quantidade_musicas_no_historico
FROM
    SpotifyClone.usuarios AS u
        INNER JOIN
    SpotifyClone.usuarios_cancoes AS uc ON uc.usuario_id = u.usuario_id
WHERE
    u.nome_usuario = 'Bill';