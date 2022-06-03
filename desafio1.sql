DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.planos(
  plano_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_plano VARCHAR(50) NOT NULL,
  valor DECIMAL(4,2) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuarios(
  usuario_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_usuario VARCHAR(255) NOT NULL,
  idade INT NOT NULL,
  plano_id INT NOT NULL,
  FOREIGN KEY (plano_id) REFERENCES SpotifyClone.planos(plano_id),
  data_assinatura DATE NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.artistas(
  artista_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_artista VARCHAR(255) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.artistas_usuarios(
  artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas(artista_id),
  usuario_id INT NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios(usuario_id),
  CONSTRAINT id PRIMARY KEY (artista_id, usuario_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.albuns(
  album_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_album VARCHAR(255) NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas(artista_id),
  ano_lancamento INT NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.cancoes(
  cancao_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_cancao VARCHAR(255) NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES SpotifyClone.albuns(album_id),
  duracao_segundos INT NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuarios_cancoes(
  usuario_id INT NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios(usuario_id),
  cancao_id INT NOT NULL,
  FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancoes(cancao_id),
  data_reproducao DATETIME NOT NULL,
  CONSTRAINT id PRIMARY KEY (usuario_id, cancao_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.planos (nome_plano, valor)
VALUES
  ('gratuito', 0.00),
  ('universitario', 5.99),
  ('pessoal', 6.99),
  ('familiar', 7.99);

INSERT INTO SpotifyClone.usuarios (nome_usuario, idade, plano_id, data_assinatura)
VALUES
  ('Thati', 23, 1, '2019-10-20'),
  ('Cintia', 35, 4, '2017-12-30'),
  ('Bill', 20, 2, '2019-06-05'),
  ('Roger', 45, 3, '2020-05-13'),
  ('Norman', 58, 3, '2017-02-17'),
  ('Patrick', 33, 4, '2017-01-06'),
  ('Vivian', 26, 1, '2018-01-05'),
  ('Carol', 19, 2, '2018-02-14'),
  ('Angelina', 42, 4, '2018-04-29'),
  ('Paul', 46, 4, '2017-01-17');

INSERT INTO SpotifyClone.artistas (nome_artista)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon'),
  ('Tyler Isle'),
  ('Fog');

INSERT INTO SpotifyClone.artistas_usuarios (artista_id, usuario_id)
VALUES
  (1, 1),
  (4, 1),
  (3, 1),
  (1, 2),
  (3, 2),
  (2, 3),
  (1, 3),
  (4, 4),
  (5, 5),
  (6, 5),
  (6, 6),
  (3, 6),
  (1, 6),
  (2, 7),
  (5, 7),
  (1, 8),
  (5, 8),
  (6, 9),
  (4, 9),
  (3, 9),
  (2, 10),
  (6, 10);

INSERT INTO SpotifyClone.albuns (nome_album, artista_id, ano_lancamento)
VALUES
  ('Envious', 1, 1990),
  ('Exuberant', 1, 1993),
  ('Hallowed Steam', 2, 1995),
  ('Incandescent', 3, 1998),
  ('Temporary Culture', 4, 2001),
  ('Library of liberty', 4, 2003),
  ('Chained Down', 5, 2007),
  ('Cabinet of fools', 5, 2012),
  ('No guarantees', 5, 2015),
  ('Apparatus', 6, 2015);

INSERT INTO SpotifyClone.cancoes (nome_cancao, album_id, duracao_segundos)
VALUES
  ('Honey', 10, 79),
  ('Walking And Man', 7, 229),
  ('Young And Father', 6, 197),
  ('Diamond Power', 4, 241),
  ("Lets's Be Silly", 4, 132),
  ('I Heard I Want To Bo Alone', 9, 120),
  ('Finding My Traditions', 7, 179),
  ('Without My Love', 6, 111),
  ('Baby', 10, 136),
  ('Magic Circus', 3, 105),
  ('Dance With Her Own', 1, 116),
  ('Hard And Time', 7, 135),
  ('Reflections Of Magic', 1, 163),
  ('I Ride Alone', 9, 151),
  ("Honey, I'm A Lone Wolf", 7, 150),
  ('Honey, So Do I', 3, 207),
  ('Rock His Everything', 4, 223),
  ('Soul For Us', 1, 200),
  ("Wouldn't It Be Nice", 10, 213),
  ("He Heard You're Bad For Me", 8, 154),
  ("He Hopes We Can't Stay", 8, 210),
  ('Walking And Game', 6, 123),
  ('Time Fireworks', 2, 152),
  ('Troubles Of My Inner Fire', 2, 203),
  ('Celebration Of More', 4, 146),
  ('You Make Me Feel So..', 10, 83),
  ("He's Walking Away", 9, 159),
  ("He's Trouble", 9, 138),
  ('Thang Of Thunder', 5, 240),
  ('Words Of Her Life', 5, 185),
  ("Sweetie, Let's Go Wild", 3, 139),
  ('She Knows', 3, 244),
  ('History Of My Roses', 6, 222),
  ('Home Forever', 4, 231),
  ('Fantasy For Me', 4, 100),
  ('Without My Streets', 5, 176),
  ('Need of The Evening', 6, 190),
  ("She Thinks I Won't Stay Tonight", 8, 166),
  ('I Know I Know', 8, 117),
  ('You Cheated On Me', 10, 95);

INSERT INTO SpotifyClone.usuarios_cancoes (usuario_id, cancao_id, data_reproducao)
VALUES
  (1, 1, '2020-02-28 10:45:55'),
  (1, 2, '2020-05-02 05:30:35'),
  (1, 3, '2020-03-06 11:22:33'),
  (1, 4, '2020-08-05 08:05:17'),
  (1, 5, '2020-09-14 16:32:22'),
  (2, 6, '2020-01-02 07:40:33'),
  (2, 7, '2020-05-16 06:16:22'),
  (2, 8, '2020-10-09 12:27:48'),
  (2, 9, '2020-09-21 13:14:46'),
  (3, 10, '2020-11-13 16:55:13'),
  (3, 11, '2020-12-05 18:38:30'),
  (3, 12, '2020-07-30 10:00:00'),
  (4, 13, '2021-08-15 17:10:10'),
  (4, 14, '2021-07-10 15:20:30'),
  (4, 15, '2021-01-09 01:44:33'),
  (5, 16, '2020-07-03 19:33:28'),
  (5, 17, '2017-02-24 21:14:22'),
  (5, 4, '2020-08-06 15:23:43'),
  (5, 18, '2020-11-10 13:52:27'),
  (6, 19, '2019-02-07 20:33:48'),
  (6, 20, '2017-01-24 00:31:17'),
  (6, 21, '2017-10-12 12:35:20'),
  (6, 22, '2018-05-29 14:56:41'),
  (7, 23, '2018-05-09 22:30:49'),
  (7, 24, '2020-07-27 12:52:58'),
  (7, 25, '2018-01-16 18:40:43'),
  (8, 9, '2018-03-21 16:56:40'),
  (8, 26, '2020-10-18 13:38:05'),
  (8, 27, '2019-05-25 08:14:03'),
  (8, 28, '2021-08-15 21:37:09'),
  (9, 29, '2021-05-24 17:23:45'),
  (9, 30, '2018-12-07 22:48:52'),
  (9, 31, '2021-03-14 06:14:26'),
  (9, 32, '2020-04-01 03:36:00'),
  (10, 33, '2017-02-06 08:21:34'),
  (10, 8, '2017-12-04 05:33:43'),
  (10, 17, '2017-07-27 05:24:49'),
  (10, 34, '2017-12-25 01:03:57');