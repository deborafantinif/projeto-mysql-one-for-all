SELECT 
	c.nome AS 'cancao',
	COUNT(*) AS 'reproducoes'
FROM SpotifyClone.usuario_cancao AS uc
JOIN SpotifyClone.cancao AS c
ON c.id = uc.id_cancao
GROUP BY uc.id_cancao
ORDER BY reproducoes DESC, c.nome
LIMIT 2;