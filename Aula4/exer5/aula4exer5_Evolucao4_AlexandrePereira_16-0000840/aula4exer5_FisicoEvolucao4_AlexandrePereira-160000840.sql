 -- --------     << aula4exer5Evolucao3  >>     ------------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 23/04/2019
-- Autor(es) ..............: Alexandre Miguel Rodrigues Nunes Pereira
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: aula4exer5Evolucao3
--
-- Data Ultima Alteracao ..: 30/04/2019
--   => Alteração do atributo "Posologia"
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--
-- -----------------------------------------------------------------


CREATE DATABASE IF NOT EXISTS aula4exer5Evolucao3;

USE aula4exer5Evolucao3;

CREATE TABLE ESPECIALIDADE (
    nomeEspecialidade VARCHAR(30) NOT NULL ,
    codEspecialidade INT NOT NULL,

    CONSTRAINT ESPECIALIDADE_PK PRIMARY KEY(codEspecialidade)
);

CREATE TABLE possui (
    crm INT(8) NOT NULL,
    codEspecialidade INT NOT NULL,

    CONSTRAINT ESPECIALIDADE_FK FOREIGN KEY(codEspecialidade) REFERENCES ESPECIALIDADE(codEspecialidade)
);

CREATE TABLE MEDICO (
    crm INT(8) NOT NULL,
    nome VARCHAR(30) NOT NULL,

    CONSTRAINT MEDICO_PK PRIMARY KEY (crm)
);

CREATE TABLE PACIENTE (
    cpf BIGINT(11) NOT NULL,
    nome VARCHAR(30) NOT NULL,
    idade INT(3) NOT NULL,
    sexo ENUM('M','F') NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    cep INT(10) NOT NULL,
    complemento VARCHAR(100),

    CONSTRAINT PACIENTE_PK PRIMARY KEY (cpf)
);

CREATE TABLE CONSULTA (
    data TIMESTAMP NOT NULL,
    cpf BIGINT(11) NOT NULL,
    crm INT(8) NOT NULL,

    CONSTRAINT CONSULTA_PK PRIMARY KEY (data, cpf, crm),
    CONSTRAINT CONSULTA_MEDICO_FK FOREIGN KEY (crm) REFERENCES MEDICO(crm),
    CONSTRAINT CONSULTA_PACIENTE_FK FOREIGN KEY (cpf) REFERENCES PACIENTE(cpf)
);

CREATE TABLE RECEITA (
    data TIMESTAMP NOT NULL,
    cpf BIGINT(11) NOT NULL,
    crm INT(8) NOT NULL,
    idReceita INT NOT NULL,

    CONSTRAINT RECEITA_PK PRIMARY KEY (idReceita),
    CONSTRAINT RECEITA_CONSULTA_FK FOREIGN KEY (data, cpf, crm) REFERENCES CONSULTA(data, cpf, crm)
);

CREATE TABLE MEDICAMENTO(
    descricao VARCHAR(100) NOT NULL,
    codMedicamento INT NOT NULL,
    nome VARCHAR(30) NOT NULL,

    CONSTRAINT MEDICAMENTO_PK PRIMARY KEY (codMedicamento)
);

CREATE TABLE telefone (
    cpf BIGINT(11) NOT NULL,
    telefone INT(9),

    CONSTRAINT TELEFONE_FK FOREIGN KEY (cpf) REFERENCES PACIENTE(cpf)
);

CREATE TABLE contem (
    idReceita INT NOT NULL,
    codMedicamento INT NOT NULL,
    posologia VARCHAR(200) NOT NULL,

    CONSTRAINT RECEITA_FK FOREIGN KEY (idReceita) REFERENCES RECEITA(idReceita),
    CONSTRAINT MEDICAMENTO_FK FOREIGN KEY (codMedicamento) REFERENCES MEDICAMENTO(codMedicamento)
);
