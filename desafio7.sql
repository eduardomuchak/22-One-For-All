SELECT 
    art.nome_artista AS artista,
    alb.nome_album AS album,
    COUNT(ac.artista_id) AS seguidores
FROM
    SpotifyClone.artistas AS art
        INNER JOIN
    SpotifyClone.albuns AS alb ON alb.artista_id = art.artista_id
        INNER JOIN
    SpotifyClone.artistas_usuarios AS ac ON ac.artista_id = art.artista_id
GROUP BY album , artista
ORDER BY seguidores DESC , artista ASC , album ASC;