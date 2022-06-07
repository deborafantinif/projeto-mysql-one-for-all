DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plano(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  valor DECIMAL(3, 2) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuario(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  idade INT NOT NULL,
  data_assinatura DATE NOT NULL,
  plano_id INT NOT NULL,
  FOREIGN KEY (plano_id) REFERENCES SpotifyClone.plano(id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artista(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.album(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  ano_lancamento YEAR NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista(id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.cancao(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  duracao INT NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES SpotifyClone.album(id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuario_cancao(
  id_usuario INT NOT NULL,
  id_cancao INT NOT NULL,
  data_reproducao DATETIME NOT NULL,
  FOREIGN KEY (id_cancao) REFERENCES SpotifyClone.cancao(id),
  FOREIGN KEY (id_usuario) REFERENCES SpotifyClone.usuario(id),
  PRIMARY KEY (id_usuario, data_reproducao)
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuario_artista(
  id_usuario INT NOT NULL,
  id_artista INT NOT NULL,
  FOREIGN KEY (id_artista) REFERENCES SpotifyClone.artista(id),
  FOREIGN KEY (id_usuario) REFERENCES SpotifyClone.usuario(id),
  PRIMARY KEY (id_artista, id_usuario)
) engine = InnoDB;

INSERT INTO SpotifyClone.plano
  (id, nome, valor)
VALUES
  (1, 'gratuito', 0),
  (2, 'familiar', 7.99),
  (3, 'universitário', 5.99),
  (4, 'pessoal', 6.99);

INSERT INTO SpotifyClone.usuario
(id, nome, idade, plano_id, data_assinatura)
VALUES
  (1, 'Thati', 23, 1, '2019-10-20'),
  (2, 'Cintia', 35, 2, '2017-12-30'),
  (3, 'Bill', 20, 3, '2019-06-05'),
  (4, 'Roger', 45, 4, '2020-05-13'),
  (5, 'Norman', 58, 4, '2017-02-17'),
  (6, 'Patrick', 33, 2, '2017-01-06'),
  (7, 'Vivian', 26, 3, '2018-01-05'),
  (8, 'Carol', 19, 3, '2018-02-14'),
  (9, 'Angelina', 42, 2, '2018-04-29'),
  (10, 'Paul', 46, 2, '2017-01-17');

INSERT INTO SpotifyClone.artista
(id, nome)
VALUES
  (1, 'Walter Phoenix'),
  (2, 'Peter Strong'),
  (3, 'Lance Day'),
  (4, 'Freedie Shannon'),
  (5, 'Tyler Isle'),
  (6, 'Fog');

INSERT INTO SpotifyClone.album
(id, nome, ano_lancamento, artista_id)
VALUES
  (1, 'Envious', '1990', 1),
  (2, 'Exuberant', '1993', 1),
  (3, 'Hallowed Steam', '1995', 2),
  (4, 'Incandescent', '1998', 3),
  (5, 'Temporary Culture', '2001', 4),
  (6, 'Library of liberty', '2003', 4),
  (7, 'Chained Down', '2007', 5),
  (8, 'Cabinet of fools', '2012', 5),
  (9, 'No guarantees', '2015', 5),
  (10, 'Apparatus', '2015', 6);

INSERT INTO SpotifyClone.cancao
(id, nome, duracao, album_id)
VALUES
  (1, 'Soul For Us', 200, 1),
  (2, 'Reflections Of Magic', 163, 1),
  (3, 'Dance With Her Own', 116, 1),
  (4, 'Troubles Of My Inner Fire', 203, 2),
  (5, 'Time Fireworks', 152, 2),
  (6, 'Magic Circus', 105, 3),
  (7, 'Honey, So Do I', 207, 3),
  (8, "Sweetie, Let's Go Wild", 139, 3),
  (9, 'She Knows', 244, 3),
  (10, 'Fantasy For Me', 100, 4),
  (11, 'Celebration Of More', 146, 4),
  (12, 'Rock His Everything', 223, 4),
  (13, 'Home Forever', 231, 4),
  (14, 'Diamond Power', 241, 4),
  (15, "Let's Be Silly", 132, 4),
  (16, "Thang Of Thunder", 240, 5),
  (17, "Words Of Her Life", 185, 5),
  (18, "Without My Streets", 176, 5),
  (19, "Need Of The Evening", 190, 6),
  (20, "History Of My Roses", 222, 6),
  (21, "Without My Love", 111, 6),
  (22, "Walking And Game", 123, 6),
  (23, "Young And Father", 197, 6),
  (24, "Finding My Traditions", 179, 7),
  (25, "Walking And Man", 229, 7),
  (26, "Hard And Time", 135, 7),
  (27, "Honey, I'm A Lone Wolf", 150, 7),
  (28, "She Thinks I Won't Stay Tonight", 166, 8),
  (29, "He Heard You're Bad For Me", 154, 8),
  (30, "He Hopes We Can't Stay", 210, 8),
  (31, "I Know I Know", 117, 8),
  (32, "He's Walking Away", 159, 9),
  (33, "He's Trouble", 138, 9),
  (34, "I Heard I Want To Bo Alone", 120, 9),
  (35, "I Ride Alone", 151, 9),
  (36, "Honey", 79, 10),
  (37, "You Cheated On Me", 95, 10),
  (38, "Wouldn't It Be Nice", 213, 10),
  (39, "Baby", 136, 10),
  (40, "You Make Me Feel So..", 83, 10);

INSERT INTO SpotifyClone.usuario_artista
(id_usuario, id_artista)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 1),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 3),
  (6, 1),
  (7, 2),
  (7, 5),
  (8, 1),
  (8, 5),
  (9, 6),
  (9, 4),
  (9, 3),
  (10, 2),
  (10, 6);

INSERT INTO SpotifyClone.usuario_cancao
(id_usuario, data_reproducao, id_cancao)
VALUES
  (1, '2020-02-28 10:45:55', 36),
  (1, '2020-05-02 05:30:35', 25),
  (1, '2020-03-06 11:22:33', 23),
  (1, '2020-08-05 08:05:17', 14),
  (1, '2020-09-14 16:32:22', 15),
  (2, '2020-01-02 07:40:33', 34),
  (2, '2020-05-16 06:16:22', 24),
  (2, '2020-10-09 12:27:48', 21),
  (2, '2020-09-21 13:14:46', 39),
  (3, '2020-11-13 16:55:13', 6),
  (3, '2020-12-05 18:38:30', 3),
  (3, '2020-07-30 10:00:00', 26),
  (4, '2021-08-15 17:10:10', 2),
  (4, '2021-07-10 15:20:30', 35),
  (4, '2021-01-09 01:44:33', 27),
  (5, '2020-07-03 19:33:28', 7),
  (5, '2017-02-24 21:14:22', 12),
  (5, '2020-08-06 15:23:43', 14),
  (5, '2020-11-10 13:52:27', 1),
  (6, '2019-02-07 20:33:48', 38),
  (6, '2017-01-24 00:31:17', 29),
  (6, '2017-10-12 12:35:20', 30),
  (6, '2018-05-29 14:56:41', 22),
  (7, '2018-05-09 22:30:49', 5),
  (7, '2020-07-27 12:52:58', 4),
  (7, '2018-01-16 18:40:43', 11),
  (8, '2018-03-21 16:56:40', 39),
  (8, '2020-10-18 13:38:05', 40),
  (8, '2019-05-25 08:14:03', 32),
  (8, '2021-08-15 21:37:09', 33),
  (9, '2021-05-24 17:23:45', 16),
  (9, '2018-12-07 22:48:52', 17),
  (9, '2021-03-14 06:14:26', 8),
  (9, '2020-04-01 03:36:00', 9),
  (10, '2017-02-06 08:21:34', 20),
  (10, '2017-12-04 05:33:43', 21),
  (10, '2017-07-27 05:24:49', 12),
  (10, '2017-12-25 01:03:57', 13);


