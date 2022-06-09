SELECT
	c.nome AS 'nome',
    COUNT(*) AS 'reproducoes'
FROM SpotifyClone.usuario_cancao AS uc
JOIN SpotifyClone.cancao AS c
ON c.id = uc.id_cancao
JOIN SpotifyClone.usuario AS u
ON u.id = uc.id_usuario
WHERE u.plano_id IN (1, 4)
GROUP BY c.nome;