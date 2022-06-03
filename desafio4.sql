SELECT 
    u.nome_usuario AS usuario,
    IF(MAX(YEAR(uc.data_reproducao)) = 2021,
        'Usuário ativo',
        'Usuário inativo') AS condicao_usuario
FROM
    SpotifyClone.usuarios AS u
        INNER JOIN
    SpotifyClone.usuarios_cancoes AS uc ON u.usuario_id = uc.usuario_id
GROUP BY u.usuario_id
ORDER BY u.nome_usuario ASC;