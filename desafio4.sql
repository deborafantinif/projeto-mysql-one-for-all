SELECT 
	u.nome AS 'usuario',
CASE
	WHEN MAX(YEAR(uc.data_reproducao)) >= 2021 THEN 'Usuário ativo'
	ELSE 'Usuário inativo'
END AS 'condicao_usuario'
FROM SpotifyClone.usuario_cancao AS uc
JOIN SpotifyClone.usuario AS u
ON u.id = uc.id_usuario
GROUP BY uc.id_usuario
ORDER BY u.nome;