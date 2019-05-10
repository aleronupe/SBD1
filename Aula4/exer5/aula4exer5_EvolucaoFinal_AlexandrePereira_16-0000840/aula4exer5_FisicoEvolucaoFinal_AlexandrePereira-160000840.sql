 -- --------     << aula4exer5Evolucao3  >>     ------------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 05/04/2019
-- Autor(es) ..............: Alexandre Miguel Rodrigues Nunes Pereira
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: aula4exer5EvolucaoFinal
--
-- Data Ultima Alteracao ..: 05/04/2019
--   => Alteração dos valores de atributo de telefone
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--
-- -----------------------------------------------------------------


CREATE DATABASE IF NOT EXISTS aula4exer5EvolucaoFinal;

USE aula4exer5EvolucaoFinal;

CREATE TABLE IF NOT EXISTS ESPECIALIDADE (
    nomeEspecialidade VARCHAR(30) NOT NULL ,
    idEspecialidade INT NOT NULL,

    CONSTRAINT ESPECIALIDADE_PK PRIMARY KEY(idEspecialidade)
);

CREATE TABLE IF NOT EXISTS MEDICO (
    crm INT(8) NOT NULL,
    nome VARCHAR(30) NOT NULL,

    CONSTRAINT MEDICO_PK PRIMARY KEY (crm)
);

CREATE TABLE IF NOT EXISTS possui (
    crm INT(8) NOT NULL,
    idEspecialidade INT NOT NULL,

    CONSTRAINT possui_ESPECIALIDADE_FK FOREIGN KEY(idEspecialidade) REFERENCES ESPECIALIDADE(idEspecialidade),
    CONSTRAINT possui_MEDICO_FK FOREIGN KEY(crm) REFERENCES MEDICO(crm)
);

CREATE TABLE IF NOT EXISTS PACIENTE (
    cpf BIGINT(11) NOT NULL,
    nome VARCHAR(30) NOT NULL,
    idade INT(3) NOT NULL,
    sexo ENUM('M','F') NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    cep BIGINT(10) NOT NULL,
    complemento VARCHAR(100),

    CONSTRAINT PACIENTE_PK PRIMARY KEY (cpf)
);

CREATE TABLE IF NOT EXISTS CONSULTA (
    data TIMESTAMP NOT NULL,
    cpf BIGINT(11) NOT NULL,
    crm INT(8) NOT NULL,

    CONSTRAINT CONSULTA_PK PRIMARY KEY (data, cpf, crm),
    CONSTRAINT CONSULTA_MEDICO_FK FOREIGN KEY (crm) REFERENCES MEDICO(crm),
    CONSTRAINT CONSULTA_PACIENTE_FK FOREIGN KEY (cpf) REFERENCES PACIENTE(cpf)
);

CREATE TABLE IF NOT EXISTS RECEITA (
    data TIMESTAMP NOT NULL,
    cpf BIGINT(11) NOT NULL,
    crm INT(8) NOT NULL,
    idReceita INT NOT NULL,

    CONSTRAINT RECEITA_PK PRIMARY KEY (idReceita),
    CONSTRAINT RECEITA_CONSULTA_FK FOREIGN KEY (data, cpf, crm) REFERENCES CONSULTA(data, cpf, crm)
);

CREATE TABLE IF NOT EXISTS MEDICAMENTO(
    descricao VARCHAR(100) NOT NULL,
    idMedicamento INT NOT NULL,
    nome VARCHAR(30) NOT NULL,

    CONSTRAINT MEDICAMENTO_PK PRIMARY KEY (idMedicamento)
);

CREATE TABLE IF NOT EXISTS telefone (
    cpf BIGINT(11) NOT NULL,
    telefone BIGINT(14),

    CONSTRAINT telefone_PACIENTE_FK FOREIGN KEY (cpf) REFERENCES PACIENTE(cpf)
);

CREATE TABLE IF NOT EXISTS contem (
    idReceita INT NOT NULL,
    idMedicamento INT NOT NULL,
    posologia VARCHAR(200) NOT NULL,

    CONSTRAINT contem_RECEITA_FK FOREIGN KEY (idReceita) REFERENCES RECEITA(idReceita),
    CONSTRAINT contem_MEDICAMENTO_FK FOREIGN KEY (idMedicamento) REFERENCES MEDICAMENTO(idMedicamento)
);
