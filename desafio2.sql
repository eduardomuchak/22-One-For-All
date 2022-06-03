SELECT
	COUNT(can.nome_cancao) AS cancoes,
  COUNT(DISTINCT art.nome_artista) AS artistas,
  COUNT(DISTINCT alb.nome_album) AS albuns
FROM
	SpotifyClone.cancoes AS can
		INNER JOIN
	SpotifyClone.albuns AS alb ON alb.album_id = can.album_id
		INNER JOIN
	SpotifyClone.artistas AS art ON alb.artista_id = art.artista_id;