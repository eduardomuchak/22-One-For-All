SELECT 
    art.nome_artista AS artista, alb.nome_album AS album
FROM
    SpotifyClone.artistas AS art
        INNER JOIN
    SpotifyClone.albuns AS alb ON alb.artista_id = art.artista_id
WHERE
    art.nome_artista = 'Walter Phoenix';