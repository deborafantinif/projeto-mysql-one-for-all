SELECT 
	art.nome AS 'artista',
  al.nome AS 'album',
  COUNT(*) AS 'seguidores'
FROM SpotifyClone.album AS al
JOIN SpotifyClone.artista AS art
ON al.artista_id = art.id
JOIN SpotifyClone.usuario_artista AS ua
ON al.artista_id = ua.id_artista
GROUP BY al.nome, art.nome
ORDER BY seguidores DESC, art.nome, al.nome;