SELECT   
  COUNT(DISTINCT(al.nome)) AS 'albuns',
  COUNT(DISTINCT(al.artista_id)) AS 'artistas',
  COUNT(*) AS 'cancoes'
FROM SpotifyClone.album al
JOIN SpotifyClone.cancao c 
ON c.album_id = al.id;