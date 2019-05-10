-- --------     << MULTAS >>     ------------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 30/04/2019
-- Autor(es) ..............: Alexandre Miguel Rodrigues Nunes Pereira
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: aula4exer6Evolucao3
--
-- Data Ultima Alteracao ..: 30/04/2019
--   => Alteração do nome da Base de Dados
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--
-- -----------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS aula4exer6Evolucao3;

use aula4exer6Evolucao3;

CREATE TABLE PROPRIETARIO (
    cpf BIGINT(11) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    numero INT NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    uf CHAR(2) NOT NULL,
    complemento VARCHAR(100) NOT NULL,
    cep INT(8) NOT NULL,
    sexo CHAR(1) NOT NULL,
    dtNascimento DATE NOT NULL,
CONSTRAINT PROPRIETARIO_PK PRIMARY KEY (cpf)
);

CREATE TABLE telefone (
    cpf BIGINT(11) NOT NULL,
    telefone BIGINT(11) NOT NULL,
CONSTRAINT telefone_PK PRIMARY KEY (cpf, telefone),
CONSTRAINT telefone_PROPRIETARIO_FK FOREIGN KEY (cpf)
    REFERENCES PROPRIETARIO (cpf)
);

CREATE TABLE MODELO (
    codModelo INT(6) NOT NULL,
    nomeModelo VARCHAR(50) NOT NULL,
CONSTRAINT MODELO_PK PRIMARY KEY (codModelo)
);

CREATE TABLE CATEGORIA (
    codCategoria INT(2) NOT NULL,
    nomeCategoria VARCHAR(50) NOT NULL,
CONSTRAINT CATEGORIA_PK PRIMARY KEY (codCategoria)
);

CREATE TABLE VEICULO (
    placa CHAR(7) NOT NULL,
    numeroChassi CHAR(17) NOT NULL UNIQUE,
    cor VARCHAR(20) NOT NULL,
    codModelo INT(6) NOT NULL,
    codCategoria INT(2) NOT NULL,
    ano INT(4) NOT NULL,
    cpf BIGINT(11) NOT NULL,
CONSTRAINT VEICULO_PK PRIMARY KEY (placa),
CONSTRAINT VEICULO_PROPRIETARIO_FK FOREIGN KEY (cpf)
    REFERENCES PROPRIETARIO (cpf),
CONSTRAINT VEICULO_MODELO_FK FOREIGN KEY (codModelo)
    REFERENCES MODELO (codModelo),
CONSTRAINT VEICULO_CATEGORIA_FK FOREIGN KEY (codCategoria)
    REFERENCES CATEGORIA (codCategoria)
);

CREATE TABLE LOCALIDADE (
    codLocal VARCHAR(20) NOT NULL,
    latitude BIGINT(9) NOT NULL,
    longitude BIGINT(9) NOT NULL,
    velocidadePermitida INT(3) NOT NULL,
CONSTRAINT LOCALIDADE_PK PRIMARY KEY (codLocal)
);

CREATE TABLE AGENTE (
    matricula BIGINT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    dtContratacao DATE NOT NULL,
CONSTRAINT AGENTE_PK PRIMARY KEY (matricula)
);

CREATE TABLE TIPO_INFRACAO (
    codInfracao INT NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    valor DOUBLE(6,2) NOT NULL,
CONSTRAINT TIPO_INFRACAO_PK PRIMARY KEY (codInfracao)
);

CREATE TABLE INFRACAO(
    idInfracao BIGINT NOT NULL,
    placa CHAR(7) NOT NULL,
    dataHora TIMESTAMP NOT NULL,
    codInfracao INT NOT NULL,
    codLocal VARCHAR(20) NOT NULL,
    velocidadeAferida INT(3),
    matricula BIGINT NOT NULL,
CONSTRAINT INFRACAO_PK PRIMARY KEY (idInfracao),
CONSTRAINT INFRACAO_VEICULO_FK FOREIGN KEY (placa)
    REFERENCES VEICULO (placa),
CONSTRAINT INFRACAO_TIPO_INFRACAO_FK FOREIGN KEY (codInfracao)
    REFERENCES TIPO_INFRACAO (codInfracao),
CONSTRAINT INFRACAO_LOCALIDADE_FK FOREIGN KEY (codLocal)
    REFERENCES LOCALIDADE (codLocal),
CONSTRAINT INFRACAO_AGENTE_FK FOREIGN KEY (matricula)
    REFERENCES AGENTE (matricula)
);
