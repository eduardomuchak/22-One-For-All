SELECT 
  u.nome_usuario AS usuario,
  COUNT(uc.cancao_id) AS qtde_musicas_ouvidas,
  ROUND(SUM(c.duracao_segundos) / 60, 2) AS total_minutos

FROM
  SpotifyClone.usuarios AS u
      INNER JOIN
  SpotifyClone.usuarios_cancoes AS uc
      INNER JOIN
  SpotifyClone.cancoes AS c
  ON u.usuario_id = uc.usuario_id AND uc.cancao_id = c.cancao_id

GROUP BY u.usuario_id
ORDER BY u.nome_usuario ASC;