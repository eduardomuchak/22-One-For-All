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

CREATE TABLE SpotifyClone.seguindo_artistas(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  FOREIGN KEY (`artista_id`) REFERENCES SpotifyClone.artistas(artista_id),
  FOREIGN KEY (`usuario_id`) REFERENCES SpotifyClone.usuarios(usuario_id)
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