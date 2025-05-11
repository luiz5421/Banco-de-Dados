DROP SCHEMA IF EXISTS atvAcademia;

CREATE SCHEMA atvAcademia;
USE atvAcademia;

CREATE TABLE modalidade 
(
  sg_modalidade VARCHAR(5),
  nm_modalidade VARCHAR(45),
  CONSTRAINT pk_modalidade PRIMARY KEY (sg_modalidade) 
);

CREATE TABLE aluno 
(
  nm_cpf_aluno VARCHAR(20),
  nm_aluno VARCHAR(45),
  ds_endereço VARCHAR(90),
  nm_telefone VARCHAR(20),
  nm_sexo VARCHAR(45),
  CONSTRAINT pk_aluno PRIMARY KEY (nm_cpf_aluno) 
);

CREATE TABLE professor
(
  nm_cpf_professor VARCHAR(20),
  nm_professor VARCHAR(45),
  ds_endereço VARCHAR(90),
  nm_telefone VARCHAR(20),
  nm_email VARCHAR(45),
  dt_nascimento DATE,
  qt_carga_horaria_semanal INT,
  vl_salario DECIMAL(9,2),

  CONSTRAINT pk_professor PRIMARY KEY (nm_cpf_professor) 
);

CREATE TABLE turma
(
  sg_turma VARCHAR(5),
  sg_modalidade VARCHAR(5),
  nm_dia_semana VARCHAR(45),
  hr_turma TIME,
  CONSTRAINT pk_turma PRIMARY KEY (sg_turma,sg_modalidade),
  CONSTRAINT fk_turma_modalidade FOREIGN KEY (sg_modalidade) REFERENCES modalidade (sg_modalidade) 
);

CREATE TABLE lista_turma
(
  nm_cpf_aluno VARCHAR(20),
  sg_turma VARCHAR(5),
  sg_modalidade VARCHAR(5),
  
  CONSTRAINT pk_lista_turma PRIMARY KEY (sg_turma,sg_modalidade,nm_cpf_aluno),
  CONSTRAINT fk_lista_turma_turma FOREIGN KEY (sg_turma) REFERENCES turma (sg_turma),
  CONSTRAINT fk_lista_turma_modalidade FOREIGN KEY (sg_modalidade) REFERENCES modalidade (sg_modalidade),
  CONSTRAINT fk_lista_turma_aluno FOREIGN KEY (nm_cpf_aluno) REFERENCES aluno (nm_cpf_aluno)
);

CREATE TABLE grade
(
  nm_cpf_professor VARCHAR(20),
  sg_turma VARCHAR(5),
  sg_modalidade VARCHAR(5),
  
  CONSTRAINT pk_grade PRIMARY KEY (nm_cpf_professor,sg_turma,sg_modalidade),
  CONSTRAINT fk_grade_professor FOREIGN KEY (nm_cpf_professor) REFERENCES professor (nm_cpf_professor),
  CONSTRAINT fk_grade_turma FOREIGN KEY (sg_turma) REFERENCES turma (sg_turma),
  CONSTRAINT fk_grade_modalidade FOREIGN KEY (sg_modalidade) REFERENCES modalidade (sg_modalidade)
);

CREATE TABLE avaliação
(
  cd_avaliação INT,
  nm_cpf_professor VARCHAR(20),
  nm_cpf_aluno VARCHAR(20),
  dt_avaliação DATE,
  qt_peso_aluno DECIMAL(9,1),
  qt_altura_aluno DECIMAL(9,2),
  qt_largura_trícepis_aluno DECIMAL(9,1),
  qt_largura_bícepis_aluno DECIMAL(9,1),
  CONSTRAINT pk_avaliação PRIMARY KEY (cd_avaliação,nm_cpf_professor,nm_cpf_aluno),
  CONSTRAINT fk_avaliação_professor FOREIGN KEY (nm_cpf_professor) REFERENCES professor (nm_cpf_professor),
  CONSTRAINT fk_avaliação_aluno FOREIGN KEY (nm_cpf_aluno) REFERENCES aluno (nm_cpf_aluno) 
);

insert into modalidade values ('CP','Capoeira');
insert into modalidade values ('JJ','jiu jitsu');
insert into modalidade values ('BX','Boxe');

insert into professor values ('803.580.118-09','Fernando Fagulha','Rua Almirante Feraz','(13)34308-9479','fernando@gmail.com','1995-08-1',50,'1200.00');
insert into professor values ('104.327.538-00','André Oliveira','Rua Afonso Pena','(13)81622-0599','andré@gmail.com','1996-04-21',45,'1350.00');
insert into professor values ('340.652.928-32','Luiza Campos','Rua Aana Costa','(13)68681-2631','luiza@gmail.com','1995-09-1',55,'1130.00');
insert into professor values ('413.377.138-99','Silvana Almeida','Rua Aana Costa','(13)68097-7227','silvana@gmail.com','1993-08-1',50,'1330.00');

insert into aluno values('764.140.328-08','Luiz Fernando','Rua Conselheiro Fagulha','(13)22555-8857','masculino');
insert into aluno values('632.009.848-13','Murilo Reis','Rua Alexandre Martins','(13)66953-8988','masculino');
insert into aluno values('125.775.308-89','Lorenzo Filho','Rua Ricardo Frnça','(13)83649-9019','masculino');
insert into aluno values('202.267.618-19','Gabriel Almeida','Rua Marechal Deodoro','(13)70561-8776','masculino');

insert into turma values('1CP','CP','Segunda','13:00');
insert into turma values('2CP','CP','Quarta','15:00');
insert into turma values('1BX','BX','Sexta','14:00');
insert into turma values('1JJ','JJ','Segunda','16:00');

insert into lista_turma values('764.140.328-08','1CP','CP');
insert into lista_turma values('764.140.328-08','1BX','BX');	
insert into lista_turma values('632.009.848-13','2CP','CP');
insert into lista_turma values('125.775.308-89','1BX','BX');
insert into lista_turma values('202.267.618-19','1JJ','JJ');

insert into avaliação values(1,'803.580.118-09','764.140.328-08','2021-08-29','87.9','1.70','10.5','12.3');
insert into avaliação values(2,'104.327.538-00','125.775.308-89','2021-02-22','85.9','1.80','9.3','10.5');
insert into avaliação values(3,'340.652.928-32','202.267.618-19','2021-03-28','80.7','1.67','12.5','12.4');
insert into avaliação values(4,'413.377.138-99','202.267.618-19','2021-06-25','70.4','1.85','13.5','11.7');

insert into grade values('803.580.118-09','1CP','CP');
insert into grade values('803.580.118-09','2CP','CP');
insert into grade values('104.327.538-00','1BX','BX');
insert into grade values('340.652.928-32','1JJ','JJ');