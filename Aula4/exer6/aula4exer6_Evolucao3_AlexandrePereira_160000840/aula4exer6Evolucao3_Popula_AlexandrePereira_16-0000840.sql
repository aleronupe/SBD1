use aula4exer6Evolucao3;

INSERT INTO PROPRIETARIO VALUES
  (11111111111, 'Alexandre', 'Rua', 8, 'Taguatinga', 'Taguatinga Norte', 'DF', 'Casa 8', '18181818', 'M', '1998-12-15'),
  (22222222222, 'Beatriz', 'Avenida', 12, 'Águas Claras', 'Araucárias', 'DF', 'Apartamento 101', '28282828', 'F', '1997-09-07'),
  (33333333333, 'Luiz', 'Rua', 6, 'Vicente Pires', 'Chácara 80', 'DF', 'Casa 34', '38383838', 'M', '1995-04-23');

INSERT INTO telefone VALUES
  (11111111111, 991118881),
  (22222222222, 992228882),
  (33333333333, 993338883);

INSERT INTO MODELO VALUES
  (444444, 'Land Rover'),
  (555555, 'Jipe Renegade'),
  (666666, 'Palio Atractive');

INSERT INTO CATEGORIA VALUES
  (77, 'Automóvel'),
  (88, 'Motocicleta'),
  (99, 'Caminhão');

INSERT INTO VEICULO VALUES
  ('ABC1234', 1313, 'Preto', 444444, 77, 2017, 11111111111),
  ('DEF5678', 1717, 'Vermelho', 555555, 77, 2016, 22222222222),
  ('XYZ0987', 2222, 'Prata', 666666, 77, 2015, 33333333333);

INSERT INTO LOCALIDADE VALUES
  ('X1Y2Z3', 101010, 202020, 60),
  ('A1B2C3', 303030, 404040, 80),
  ('Q1W2E3', 505050, 606060, 40);


INSERT INTO AGENTE VALUES
  (15000030, 'José', '2001-02-10'),
  (14000030, 'Bárbara', '2006-04-11'),
  (13000030, 'Diógenes', '2009-03-13');

INSERT INTO TIPO_INFRACAO VALUES
  (111, 'Velocidade acima da permitida', 195.23),
  (222, 'Estacionamento em local proibido', 230.34 ),
  (333, 'Ultrapassagem Indevida', 502.54);

INSERT INTO INFRACAO VALUES
  (4444, 'ABC1234', '2019-02-12 20:12:32', 111, 'X1Y2Z3', 80, 15000030),
  (5555, 'DEF5678', '2019-01-24 12:23:12', 222, 'A1B2C3', NULL, 14000030),
  (6666, 'XYZ0987', '2019-03-15 08:10:34', 333, 'Q1W2E3', NULL, 13000030);
