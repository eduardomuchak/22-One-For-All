DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.planos(
  plano_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_plano VARCHAR(50) NOT NULL,
  valor DECIMAL(4,2) NOT NULL,
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuarios(
  usuario_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_usuario VARCHAR(255) NOT NULL,
  idade INT NOT NULL,
) engine = InnoDB;

CREATE TABLE SpotifyClone.artistas(
  artista_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_artista VARCHAR(255) NOT NULL,
) engine = InnoDB;

CREATE TABLE SpotifyClone.artistas_usuarios(
  id INT NOT NULL,
  FOREIGN KEY (`artista_id`) REFERENCES SpotifyClone.artistas(artista_id),
  FOREIGN KEY (`usuario_id`) REFERENCES SpotifyClone.usuarios(usuario_id),
  PRIMARY KEY (`artista_id`, `usuario_id`),
) engine = InnoDB;

CREATE TABLE SpotifyClone.albuns(
  album_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_album VARCHAR(255) NOT NULL,
  FOREIGN KEY (`artista_id`) REFERENCES SpotifyClone.artistas(artista_id),
  ano_lancamento INT NOT NULL,
) engine = InnoDB;

CREATE TABLE SpotifyClone.cancoes(
  cancao_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_cancao VARCHAR(255) NOT NULL,
  FOREIGN KEY (`album_id`) REFERENCES SpotifyClone.albuns(album_id),
  duracao_segundos INT NOT NULL,
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuarios_cancoes(
  id INT NOT NULL,
  FOREIGN KEY (`usuario_id`) REFERENCES SpotifyClone.usuarios(usuario_id),
  FOREIGN KEY (`cancao_id`) REFERENCES SpotifyClone.cancoes(cancao_id),
  data_reproducao DATETIME NOT NULL,
  PRIMARY KEY (`usuario_id`, `cancao_id`),
) engine = InnoDB;

INSERT INTO SpotifyClone.tabela1 (coluna1, coluna2)
VALUES
  ('exemplo de dados 1', 'exemplo de dados A'),
  ('exemplo de dados 2', 'exemplo de dados B'),
  ('exemplo de dados 3', 'exemplo de dados C');

INSERT INTO SpotifyClone.tabela2 (coluna1, coluna2)
VALUES
  ('exemplo de dados 1', 'exemplo de dados X'),
  ('exemplo de dados 2', 'exemplo de dados Y');