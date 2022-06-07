SELECT 
	COUNT(*) AS 'quantidade_musicas_no_historico'
FROM SpotifyClone.usuario_cancao AS uc
JOIN SpotifyClone.usuario AS u
ON uc.id_usuario = u.id
WHERE u.nome = 'Bill';