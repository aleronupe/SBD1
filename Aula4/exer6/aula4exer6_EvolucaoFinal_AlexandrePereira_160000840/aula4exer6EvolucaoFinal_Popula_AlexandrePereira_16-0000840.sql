use aula4exer6EvolucaoFinal;

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
  ('ABC1234', 1313, 'Preto', 444444, 77, '2017-01-01', 11111111111),
  ('DEF5678', 1717, 'Vermelho', 555555, 77, '2016-01-01', 22222222222),
  ('XYZ0987', 2222, 'Prata', 666666, 77, '2015-01-01', 33333333333);

INSERT INTO LOCAL VALUES
  (0909090, 101010, 202020, 60),
  (1010101, 303030, 404040, 80),
  (0707070, 505050, 606060, 40);


INSERT INTO AGENTE VALUES
  (150030, 'José', '2001-02-10'),
  (140030, 'Bárbara', '2006-04-11'),
  (130030, 'Diógenes', '2009-03-13');

INSERT INTO TIPOINFRACAO VALUES
  (111, 'Velocidade acima da permitida', 195.23),
  (222, 'Estacionamento em local proibido', 230.34 ),
  (333, 'Ultrapassagem Indevida', 502.54);

INSERT INTO INFRACAO VALUES
  (4444, 'ABC1234', '2019-02-12 20:12:32', 111, 0909090, 80, 150030),
  (5555, 'DEF5678', '2019-01-24 12:23:12', 222, 1010101, NULL, 140030),
  (6666, 'XYZ0987', '2019-03-15 08:10:34', 333, 0707070, NULL, 130030);
