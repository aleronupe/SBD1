-- --------     RECEITAS MÉDICAS     ------------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 23/04/2019
-- Autor     ..............: Alexandre Miguel Rodrigues Nunes Pereira
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: clinica
--
-- Data Ultima Alteracao ..: 23/04/2019
--   => Criacao das tabelas
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--
-- -----------------------------------------------------------------

        CREATE DATABASE clinica;
        use clinica;

        CREATE TABLE PACIENTE (
         cpf BIGINT(8) NOT NULL,
         nome varchar(50) NOT NULL,
         idade INT(3) NOT NULL,
         sexo ENUM('M', 'F') NOT NULL,
         cidade varchar(180) NOT NULL,
         bairro varchar(180) NOT NULL,
         estado varchar(180) NOT NULL,
         cep BIGINT(10) NOT NULL,
         complementp varchar(180) NOT NULL);

        CREATE TABLE MEDICO (
         crm BIGINT(8) NOT NULL,
         nome varchar(50) NOT NULL);

        CREATE TABLE CONSULTA (
         data DATETIME NOT NULL,
         crm BIGINT(8) NOT NULL,
         cpf BIGINT(11) NOT NULL);

        CREATE TABLE RECEITA (
         idReceita BIGINT(10) NOT NULL,
         data DATETIME NOT NULL,
         crm BIGINT(8) NOT NULL,
         cpf BIGINT(11) NOT NULL);

        CREATE TABLE MEDICAMENTO (
         codMedicamento BIGINT(10) NOT NULL,
         descricao varchar(200) NOT NULL,
         nome varchar(30) NOT NULL);

        CREATE TABLE ESPECIALIDADE (
         codEspecialidade BIGINT(10) NOT NULL,
         nomeEspecialidade varchar(180) NOT NULL);

        CREATE TABLE telefone (
         cpf BIGINT(11) NOT NULL,
         telefone BIGINT(9));

        CREATE TABLE contem (
         idReceita BIGINT(10) NOT NULL,
         codMedicamento BIGINT(10) NOT NULL,
         posologia varchar(200) NOT NULL);

        CREATE TABLE possui (
         crm BIGINT(8) NOT NULL,
         codEspecialidade BIGINT(10) NOT NULL);
