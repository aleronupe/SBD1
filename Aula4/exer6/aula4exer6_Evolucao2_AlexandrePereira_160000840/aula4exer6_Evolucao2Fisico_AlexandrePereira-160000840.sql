-- --------     DETRAN    ------------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 23/04/2019
-- Autor     ..............: Alexandre Miguel Rodrigues Nunes Pereira
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: clinica
--
-- Data Ultima Alteracao ..: 25/04/2019
--   => Criacao das tabelas
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--
-- -----------------------------------------------------------------

        CREATE DATABASE detran;
        use detran;

        CREATE TABLE PROPRIETARIO (
         cpf BIGINT(11) NOT NULL PRIMARY KEY,
         nome varchar(50) NOT NULL,
         logradouro varchar(100) NOT NULL,
         numero INT NOT NULL,
         complemento varchar(100) NOT NULL,
         bairro varchar(50) NOT NULL,
         cidade varchar(50) NOT NULL,
         uf char(2) NOT NULL,
         cep INT(8) NOT NULL,
         sexo char(1) NOT NULL,
         dtNascimento DATE NOT NULL
        );

        CREATE TABLE CATEGORIA (
         codCategoria INT(2) NOT NULL PRIMARY KEY,
         nomeCategoria varchar(50) NOT NULL
        );

        CREATE TABLE VEICULO (
         placa char(2) NOT NULL PRIMARY KEY,
         numeroChassi char(17) NOT NULL UNIQUE,
         cor varchar(20) NOT NULL,
         corModelo INT(6) NOT NULL,
         codCategoria INT(2) NOT NULL,
         ano DATE NOT NULL,
         cpf BIGINT(11) NOT NULL
        );

        CREATE TABLE MODELO (
         codModelo INT(6) NOT NULL PRIMARY KEY,
         nomeModelo varchar(50) NOT NULL
        );

        CREATE TABLE LOCALIDADE (
         codLocal varchar(20) NOT NULL PRIMARY KEY,
         latitude DECIMAL(8,6) NOT NULL,
         longitude DECIMAL(9,6) NOT NULL,
         velocidadePermitida INT(3) NOT NULL
        );

        CREATE TABLE INFRACAO (
         idInfracao BIGINT NOT NULL PRIMARY KEY,
         placa char(7) NOT NULL,
         dataHora TIMESTAMP NOT NULL,
         codInfracao INT NOT NULL,
         codLocal varchar(20) NOT NULL,
         velocidadeAferida INT(3),
         matricula BIGINT NOT NULL
        );
        
        CREATE TABLE TIPO_INFRACAO (
         codInfracao INT NOT NULL PRIMARY KEY,
         descricao varchar(100) NOT NULL,
         valor DECIMAL(6,2) NOT NULL        
        );

        CREATE TABLE AGENTE (
         matricula BIGINT NOT NULL PRIMARY KEY,
         nome varchar(50) NOT NULL,
         dtContratacao DATE NOT NULL
        );

        CREATE TABLE telefone (
         cpf BIGINT(11) NOT NULL,
         telefone BIGINT(11) NOT NULL,
         PRIMARY KEY (cpf,telefone)
        );
