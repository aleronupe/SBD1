-- --------     << MULTAS >>     ------------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 05/04/2019
-- Autor(es) ..............: Alexandre Miguel Rodrigues Nunes Pereira
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: aula4exer6EvolucaoFinal
--
-- Data Ultima Alteracao ..: 05/04/2019
--   => Alteração do nome da Base de Dados
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--
-- -----------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS aula4exer6EvolucaoFinal;

use aula4exer6EvolucaoFinal;

CREATE TABLE IF NOT EXISTS PROPRIETARIO (
    cpf BIGINT(11) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero INT(2) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    siglaEstado VARCHAR(2) NOT NULL,
    complemento VARCHAR(100) NOT NULL,
    cep BIGINT(10) NOT NULL,
    sexo ENUM('M','F') NOT NULL,
    dtNascimento DATE NOT NULL,
CONSTRAINT PROPRIETARIO_PK PRIMARY KEY (cpf)
);

CREATE TABLE IF NOT EXISTS telefone (
    cpf BIGINT(11) NOT NULL,
    telefone BIGINT(14) NOT NULL,
CONSTRAINT telefone_PK PRIMARY KEY (cpf, telefone),
CONSTRAINT telefone_PROPRIETARIO_FK FOREIGN KEY (cpf)
    REFERENCES PROPRIETARIO (cpf)
);

CREATE TABLE IF NOT EXISTS MODELO (
    codModelo INT(6) NOT NULL,
    descModelo VARCHAR(50) NOT NULL,
CONSTRAINT MODELO_PK PRIMARY KEY (codModelo)
);

CREATE TABLE IF NOT EXISTS CATEGORIA (
    codCategoria INT(2) NOT NULL,
    descCategoria VARCHAR(50) NOT NULL,
CONSTRAINT CATEGORIA_PK PRIMARY KEY (codCategoria)
);

CREATE TABLE IF NOT EXISTS VEICULO (
    placa VARCHAR(7) NOT NULL,
    numeroChassi VARCHAR(17) NOT NULL UNIQUE,
    corPredominante VARCHAR(20) NOT NULL,
    codModelo INT(6) NOT NULL,
    codCategoria INT(2) NOT NULL,
    anoFabricacao DATE NOT NULL, 
    cpf BIGINT(11) NOT NULL,
CONSTRAINT VEICULO_PK PRIMARY KEY (placa),
CONSTRAINT VEICULO_PROPRIETARIO_FK FOREIGN KEY (cpf)
    REFERENCES PROPRIETARIO (cpf),
CONSTRAINT VEICULO_MODELO_FK FOREIGN KEY (codModelo)
    REFERENCES MODELO (codModelo),
CONSTRAINT VEICULO_CATEGORIA_FK FOREIGN KEY (codCategoria)
    REFERENCES CATEGORIA (codCategoria)
);

CREATE TABLE IF NOT EXISTS LOCAL (
    codLocal INT(7) NOT NULL,
    latitude BIGINT(10) NOT NULL,
    longitude BIGINT(10) NOT NULL,
    velocidadePermitida INT(3) NOT NULL,
CONSTRAINT LOCAL_PK PRIMARY KEY (codLocal)
);

CREATE TABLE IF NOT EXISTS AGENTE (
    matricula INT(6) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    dtContratacao DATE NOT NULL,
CONSTRAINT AGENTE_PK PRIMARY KEY (matricula)
);

CREATE TABLE TIPOINFRACAO (
    codTipoInfracao INT(3) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    valor DOUBLE(6,2) NOT NULL,
CONSTRAINT TIPOINFRACAO_PK PRIMARY KEY (codTipoInfracao)
);

CREATE TABLE INFRACAO(
    idInfracao BIGINT NOT NULL,
    placa CHAR(7) NOT NULL,
    dataHora TIMESTAMP NOT NULL,
    codTipoInfracao INT(3) NOT NULL,
    codLocal INT(7) NOT NULL,
    velocidadeAferida INT(3),
    matricula INT(6) NOT NULL,
CONSTRAINT INFRACAO_PK PRIMARY KEY (idInfracao),
CONSTRAINT INFRACAO_VEICULO_FK FOREIGN KEY (placa) REFERENCES VEICULO (placa),
CONSTRAINT INFRACAO_TIPOINFRACAO_FK FOREIGN KEY (codTipoInfracao) REFERENCES TIPOINFRACAO (codTipoInfracao),
CONSTRAINT INFRACAO_LOCAL_FK FOREIGN KEY (codLocal) REFERENCES LOCAL (codLocal),
CONSTRAINT INFRACAO_AGENTE_FK FOREIGN KEY (matricula) REFERENCES AGENTE (matricula)
);
