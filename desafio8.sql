SELECT 
	art.nome AS 'artista',
	al.nome AS 'album'
FROM SpotifyClone.album AS al
JOIN SpotifyClone.artista AS art
ON al.artista_id = art.id
WHERE art.nome = 'Walter Phoenix';