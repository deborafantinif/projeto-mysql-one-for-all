SELECT 
	u.nome AS 'usuario',
    COUNT(uc.id_usuario) AS 'qtde_musicas_ouvidas',
    ROUND(SUM(c.duracao) / 60, 2) AS 'total_minutos'
FROM SpotifyClone.usuario_cancao AS uc
JOIN SpotifyClone.usuario AS u
ON u.id = uc.id_usuario
JOIN SpotifyClone.cancao AS c
ON c.id = uc.id_cancao
GROUP BY uc.id_usuario
ORDER BY u.nome;