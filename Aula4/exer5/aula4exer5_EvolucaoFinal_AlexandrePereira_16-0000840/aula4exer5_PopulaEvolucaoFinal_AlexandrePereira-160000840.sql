USE aula4exer5EvolucaoFinal;

INSERT INTO ESPECIALIDADE VALUES
  ('Cardiologista', 1),
  ('Neurologista', 2);

INSERT INTO MEDICO VALUES
  (12345678, 'Alexandre'),
  (87654321, 'Miguel');

INSERT INTO possui VALUES
  (12345678, 2),
  (87654321, 1);

INSERT INTO PACIENTE VALUES
  (12345678911, 'Fernando', 25, 'M', 'Taguatinga', 'Taguatinga Norte', 'DF', 1234567890, 'Casa 3'),
  (11987654321, 'Carla', 32, 'F', 'Sudoeste', 'SQS 02', 'DF', 0987654321, 'Apartamento 101');

INSERT INTO telefone VALUES
  (12345678911, 5561993214455),
  (12345678911, 5561996541234);

INSERT INTO CONSULTA VALUES
  ('2019-12-23 14:25:01', 12345678911, 12345678),
  ('2019-04-15 15:03:02', 11987654321, 87654321);

INSERT INTO RECEITA VALUES
  ('2019-12-23 14:25:01', 12345678911, 12345678, 3),
  ('2019-04-15 15:03:02', 11987654321, 87654321, 4);

INSERT INTO MEDICAMENTO VALUES
  ('Uso Tópico', 5, 'Propianato de Clobetasol'),
  ('Uso Oral', 6, 'Meticolim');

INSERT INTO contem VALUES
  (3, 5, '2 vezes ao dia'),
  (4, 6, '1 vez ao dia');
